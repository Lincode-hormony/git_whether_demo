import {SwiperViewModel} from '../viewmodel/Swiper_viewmodel'
import {ShowNumViewModel} from '../viewmodel/ShowNum_viewmodel'
import {HourlyViewModel} from '../viewmodel/Hourly_viewmodel'
import {DailyViewModel} from '../viewmodel/Daily_viewmodel'
import {AirViewModel} from '../viewmodel/Air_viewmodel'
import {GirdViewModel} from '../viewmodel/Gird_viewmodel'
import {TimeViewModel} from '../viewmodel/Time_viewmodel'

export class CityMainViewModel{
   ShowNumData:Array<ShowNumViewModel>=[]
   SwiperData:Array<SwiperViewModel>=[]
   HourlyData:Array<HourlyViewModel>=[]
   DailyData:Array<DailyViewModel>=[]
   AirData:Array<AirViewModel>=[]
   GirdData:Array<GirdViewModel>=[]
   TimeData:Array<TimeViewModel>=[]
}