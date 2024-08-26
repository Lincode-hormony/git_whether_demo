import {DailyViewModel} from '../viewmodel/Daily_viewmodel'
import {DailyForecast} from '../model/DailyModel'


@Component
export default struct DayList{
  @Link itemInfo:DailyViewModel
 // @State a:Array<DailyForecast>=[]

//   aboutToAppear(): void {
// HttpUtil1.GetData(this.city).then((v)=>{
//   this.a=v.daily
// })
//   }
  build() {
    Column(){
      ForEach(this.itemInfo.daily,(value:DailyForecast,index:number)=>{
        Row(){
          if(index==0){
            Text(value.fxDate.slice(6,10)+'  '+'今天').fontColor(Color.White)
            Image($r(`app.media.${value.iconDay}`)).width(17)
            Text(value.tempMin+'°'+'/'+value.tempMax+'°').fontColor(Color.White)
          }else if(index==1){
            Text(value.fxDate.slice(6,10)+'  '+'明天').fontColor(Color.White)
            Image($r(`app.media.${value.iconDay}`)).width(17)
            Text(value.tempMin+'°'+'/'+value.tempMax+'°').fontColor(Color.White)
          }else{
            Text(value.fxDate.slice(6,10)+'  '+`周三`).fontColor(Color.White)
            Image($r(`app.media.${value.iconDay}`)).width(17)
            Text(value.tempMin+'°'+'/'+value.tempMax+'°').fontColor(Color.White)
          }


        }
          .margin(10)
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')



      })


      Button('未来15日天气预报')
        .backgroundColor('#1affffff')
        .fontWeight(300)
        .width('80%')
    }
    .width(340)
    .height(330)
    .margin({left:20})
    .backgroundColor('#33000000')
    .borderRadius(10)
    .padding(7)
  }
}