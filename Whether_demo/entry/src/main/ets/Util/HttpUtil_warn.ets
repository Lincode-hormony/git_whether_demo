import { http } from '@kit.NetworkKit'
import {warn} from '../model/WarnModel'




class HttpUtil {

  async GetData(num:string): Promise<warn>{
    let httpRequest = http.createHttp();

    try{


      httpRequest.on('headersReceive', (header: Object) => {
        console.info('header: ' + JSON.stringify(header));
      });

      let result= await httpRequest.request(`https://devapi.qweather.com/v7/warning/now?location=101010100&lang=en&key=a38f3cd7ca1346d4a1896c1c6784ddd1`, {
        method: http.RequestMethod.GET,
      })
      let a:warn=JSON.parse((result.result.toString()))

      console.warn('成功！'+JSON.stringify(a))


      return a
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