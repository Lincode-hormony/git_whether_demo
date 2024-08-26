import HttpUtil from '../Util/HttpUtil_hourly'
import {HourlyViewModel} from '../viewmodel/Hourly_viewmodel'
import {WeatherForecast} from '../model/DataModel'



@Component
export default struct TimeList{
  @Link itemInfo:HourlyViewModel

  flag=0


  build() {
    List(){
      ForEach(this.itemInfo.hourly,(value:WeatherForecast,index:number)=>{
        ListItem(){
          Column(){
            if(index==0){
              Text('现在').fontColor(Color.White).fontSize(10)
              Image($r(`app.media.${value.icon}`)).width(20)
              Text(value.temp.toString()+'°').fontColor(Color.White).fontSize(12)
            }else if(index>0){
              Text(value.fxTime.slice(11,16)).fontColor(Color.White).fontSize(10)
              Image($r(`app.media.${value.icon}`)).width(20)
              Text(value.temp.toString()+'°').fontColor(Color.White).fontSize(12)
            }

          }
          .justifyContent(FlexAlign.SpaceAround)
          .height(75)
          //.backgroundColor(Color.Pink)
        }
        .margin({left:20,right:20,top:10})
      })
    }
    .width(340)
    .height(100)
    .margin({left:20})
    .listDirection(Axis.Horizontal)
    .backgroundColor('#33000000')
    .borderRadius(10)
    .scrollBar(BarState.Off)
  }
}

