import { aqi } from '../model/AirModel';
import { DailyForecast } from '../model/DailyModel';
import { now } from '../model/NowModel';
import {ShowNumViewModel} from '../viewmodel/ShowNum_viewmodel'

import {Warning} from '../model/WarnModel'
import {SwiperViewModel} from '../viewmodel/Swiper_viewmodel'

import {HourlyViewModel} from '../viewmodel/Hourly_viewmodel'
import {day_data} from '../model/DataModel'

import {DailyViewModel} from '../viewmodel/Daily_viewmodel'
import { daily_data} from '../model/DailyModel'

import {AirViewModel} from '../viewmodel/Air_viewmodel'

import {GirdViewModel} from '../viewmodel/Gird_viewmodel'

import {TimeViewModel} from '../viewmodel/Time_viewmodel'

class Help{

  get_ShowNum_data(now_model:now,daily_model:DailyForecast,air_model:aqi){
    let result:ShowNumViewModel=new ShowNumViewModel()
    result.temp=now_model.temp+'°'
    result.text=now_model.text
    result.min=daily_model.tempMin+'°'
    result.max=daily_model.tempMax+'°'
    result.category=air_model.category
    result.value=air_model.value
    return result
  }

  get_Swiper_data(warn_model:Warning){
    let result:SwiperViewModel=new SwiperViewModel()
    result.text=warn_model.text
    return result
  }

  get_TimeList_data(hourly_model:day_data){
    let result:HourlyViewModel=new HourlyViewModel()
    result.hourly=hourly_model.hourly
    return result
  }

  get_DayList_data(daily_model:daily_data){
    let result:DailyViewModel=new DailyViewModel()
    result.daily=daily_model.daily
    return result
  }

  get_Air_data(air_model:aqi){
    let result:AirViewModel=new AirViewModel()
    result.num=air_model.value
    result.text=air_model.category
    result.advice=air_model.health.advice.generalPopulation
    return result
  }

  get_Gird_data(daily_model:DailyForecast,now_model:now){
    let result:GirdViewModel=new GirdViewModel()
    result.uvIndex=daily_model.uvIndex
    result.feelsLike=now_model.feelsLike
    result.humidity=daily_model.humidity
    result.windDirDay=daily_model.windDirDay
    result.windSpeedDay=daily_model.windSpeedDay
    result.pressure=daily_model.pressure
    result.vis=daily_model.vis
    return result
  }

  get_Time_data(daily_model:DailyForecast){
    let result:TimeViewModel=new TimeViewModel()
    result.up=daily_model.sunrise
    result.down=daily_model.sunset
    return result
  }
}

let x:Help=new Help()
export default x