import { http } from '@kit.NetworkKit'
import {Air} from '../model/AirModel'




class HttpUtil {

  async GetData(num:string): Promise<Air>{
    let httpRequest = http.createHttp();

    try{


      httpRequest.on('headersReceive', (header: Object) => {
        console.info('header: ' + JSON.stringify(header));
      });

      let result= await httpRequest.request(`https://devapi.qweather.com/airquality/v1/now/${num}?pollutant=true&station=true&key=a38f3cd7ca1346d4a1896c1c6784ddd1`, {
        method: http.RequestMethod.GET,
      })



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