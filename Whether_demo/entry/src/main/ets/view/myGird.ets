import {GirdViewModel} from '../viewmodel/Gird_viewmodel'


@Builder
function my_gird(media:string,title:string,text:string){
  Column(){
    Image($r(`app.media.${media}`)).width(20)
    Text(title).width(16).width(40).fontColor(Color.White)
    Text(text).fontColor(Color.White)
  }
  .backgroundColor('#33000000')
  .width('100%')
  .height('100%')
  .borderRadius(10)

}


@Component
export default struct Air{
  @Link itemInfo:GirdViewModel
  // @State a:Array<DailyForecast>=[]
  // @State b:DailyForecast=new DailyForecast()
  // @State c:now=new now()



  // aboutToAppear(): void {
  //   HttpUtil.GetData(this.city).then((v)=>{
  //     this.a=v.daily
  //     this.b=this.a[0]
  //   })
  //
  //   HttpUtil1.GetData(this.city).then((v)=>{
  //     this.c=v.now
  //   })
  // }
  build() {
    Grid(){

      GridItem(){
        Column({space:7}){
          Image($r(`app.media.qingtian`)).width(24).margin({top:10})
          Text('紫外线').width(16).width(40).fontColor('#66ffffff').fontSize(13)
          Text(this.itemInfo.uvIndex).fontColor(Color.White).fontSize(16)
        }
        .backgroundColor('#33000000')
        .width('100%')
        .height('100%')
        .borderRadius(10)
        .alignItems(HorizontalAlign.Start)
        .padding({left:12})
        }
      .clickEffect({level:ClickEffectLevel.LIGHT})

      GridItem(){

        Column({space:7}){
          Image($r(`app.media.tiganwendu`)).width(24).margin({top:10})
          Text('体感温度').width(25).width(70).fontColor('#66ffffff').fontSize(13)
          Text(this.itemInfo.feelsLike+'°').fontColor(Color.White).fontSize(16)
        }
        .backgroundColor('#33000000')
        .width('100%')
        .height('100%')
        .borderRadius(10)
        .alignItems(HorizontalAlign.Start)
        .padding({left:12})
      }
      .clickEffect({level:ClickEffectLevel.LIGHT})

      GridItem(){
        Column({space:7}){
          Image($r(`app.media.shidu`)).width(24).margin({top:10})
          Text('湿度').width(16).width(40).fontColor('#66ffffff').fontSize(13)
          Text(this.itemInfo.humidity+'%').fontColor(Color.White).fontSize(16)
        }
        .backgroundColor('#33000000')
        .width('100%')
        .height('100%')
        .borderRadius(10)
        .alignItems(HorizontalAlign.Start)
        .padding({left:12})
      }
      .clickEffect({level:ClickEffectLevel.LIGHT})

      GridItem(){
        Column({space:7}){
          Image($r(`app.media.fengxiang`)).width(24).margin({top:10})
          Text(this.itemInfo.windDirDay).width(16).width(40).fontColor('#66ffffff').fontSize(13)
          Text(this.itemInfo.windSpeedDay+'千米/小时').fontColor(Color.White).fontSize(16)
        }
        .backgroundColor('#33000000')
        .width('100%')
        .height('100%')
        .borderRadius(10)
        .alignItems(HorizontalAlign.Start)
        .padding({left:12})
      }
      .clickEffect({level:ClickEffectLevel.LIGHT})

      GridItem(){
        Column({space:7}){
          Image($r(`app.media.qiya`)).width(24).margin({top:10})
          Text('气压').width(16).width(40).fontColor('#66ffffff').fontSize(13)
          Text(this.itemInfo.pressure+'百帕').fontColor(Color.White).fontSize(16)
        }
        .backgroundColor('#33000000')
        .width('100%')
        .height('100%')
        .borderRadius(10)
        .alignItems(HorizontalAlign.Start)
        .padding({left:12})
      }
      .clickEffect({level:ClickEffectLevel.LIGHT})

      GridItem(){
        Column({space:7}){
          Image($r(`app.media.nengjiandu`)).width(28).margin({top:10})
          Text('能见度').width(16).width(40).fontColor('#66ffffff').fontSize(13)
          Text(this.itemInfo.vis+'千米').fontColor(Color.White).fontSize(16)
        }
        .backgroundColor('#33000000')
        .width('100%')
        .height('100%')
        .borderRadius(10)
        .alignItems(HorizontalAlign.Start)
        .padding({left:12})
      }
      .clickEffect({level:ClickEffectLevel.LIGHT})

    }
    .columnsTemplate('1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr')
    .columnsGap(15)
    .rowsGap(10)
    .width(340)
    .margin({left:20})
    .height(200)
  }
}