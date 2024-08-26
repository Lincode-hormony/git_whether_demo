import { http } from '@kit.NetworkKit'
import {WeatherForecast,reference,day_data} from '../model/DataModel'
import json from '@ohos.util.json';
import { BusinessError, zlib } from '@kit.BasicServicesKit';
import { fileShare } from '@kit.CoreFileKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { buffer } from '@kit.ArkTS';

//返回一个result0


class HttpUtil {



  async GetData(num:string): Promise<day_data>{
    let httpRequest = http.createHttp();

    try{


      httpRequest.on('headersReceive', (header: Object) => {
        console.info('header: ' + JSON.stringify(header));
      });

      let result= await httpRequest.request(`https://devapi.qweather.com/v7/weather/24h?location=${num}&key=a38f3cd7ca1346d4a1896c1c6784ddd1`, {
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