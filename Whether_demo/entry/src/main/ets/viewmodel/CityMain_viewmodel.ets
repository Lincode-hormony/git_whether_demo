import {SwiperViewModel} from '../viewmodel/Swiper_viewmodel'
import {ShowNumViewModel} from '../viewmodel/ShowNum_viewmodel'
import {HourlyViewModel} from '../viewmodel/Hourly_viewmodel'
import {DailyViewModel} from '../viewmodel/Daily_viewmodel'
import {AirViewModel} from '../viewmodel/Air_viewmodel'
import {GirdViewModel} from '../viewmodel/Gird_viewmodel'
import {TimeViewModel} from '../viewmodel/Time_viewmodel'

export class CityMainViewModel{
   ShowNumData:ShowNumViewModel=new ShowNumViewModel()
   SwiperData:SwiperViewModel=new SwiperViewModel()
   HourlyData:HourlyViewModel=new HourlyViewModel()
   DailyData:DailyViewModel=new DailyViewModel()
   AirData:AirViewModel=new AirViewModel()
   GirdData:GirdViewModel=new GirdViewModel()
   TimeData:TimeViewModel=new TimeViewModel()
}