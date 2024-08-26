import { http } from '@kit.NetworkKit'
import {WeatherData} from '../model/LocalModel'




class HttpUtil {

  async GetData(): Promise<WeatherData>{
    let httpRequest = http.createHttp();

    try{


      httpRequest.on('headersReceive', (header: Object) => {
        console.info('header: ' + JSON.stringify(header));
      });

      let result= await httpRequest.request('https://api.vvhan.com/api/weather', {
        method: http.RequestMethod.GET,
      })
      let a:WeatherData=JSON.parse((result.result.toString()))

      console.log('成功！'+JSON.stringify(a))


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