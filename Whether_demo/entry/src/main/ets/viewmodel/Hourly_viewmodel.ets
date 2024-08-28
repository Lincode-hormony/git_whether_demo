import {WeatherForecast} from '../model/DataModel'

@Observed
export class HourlyViewModel{
  hourly:Array<WeatherForecast>=[]
}