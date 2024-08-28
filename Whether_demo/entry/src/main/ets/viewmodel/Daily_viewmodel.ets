import {DailyForecast} from '../model/DailyModel'

@Observed
export class DailyViewModel{
  daily:Array<DailyForecast>=[]
}