import { http } from '@kit.NetworkKit'
import {now_data} from '../model/NowModel'


//返回一个result0


class HttpUtil {



  async GetData(num:string): Promise<now_data>{
    let httpRequest = http.createHttp();
    console.info('哈尼'+num)


    try{


      httpRequest.on('headersReceive', (header: Object) => {
        console.info('header: ' + JSON.stringify(header));
      });

      let result= await httpRequest.request(`https://devapi.qweather.com/v7/weather/now?location=${num}&key=a38f3cd7ca1346d4a1896c1c6784ddd1`, {
        method: http.RequestMethod.GET,
      })

      console.info('哈哈'+JSON.stringify(result.result))



      return JSON.parse(result.result.toString())
    }catch (error){
      console.error("获取网络数据失败: " + JSON.stringify(error));
      throw new Error("获取网络数据失败: " + error.message);
    } finally {
      httpRequest.destroy()
    }


  }

}
let x:HttpUtil=new HttpUtil()
export default x