import {AirViewModel} from '../viewmodel/Air_viewmodel'


@Component
export default struct Airs{
  @ObjectLink itemInfo:AirViewModel
  // @State a:aqi=new aqi()
  // @State b:health=new health()
  // @State c:advice=new advice()

  // aboutToAppear(): void {
  //   console.info('给给给'+this.city)
  //
  //   HttpUtil2.GetData(this.city).then((v)=>{
  //     this.a=v.aqi[0]
  //     this.b=this.a.health
  //     this.c=this.b.advice
  //   })
  // }
  build() {
    Column(){
      Row(){
        Text('空气质量')
          .fontSize(15)
          .fontColor('#99ffffff')

        Text('>')
          .fontColor('#99ffffff')
          .fontWeight(900)
      }
      //.backgroundColor(Color.White)
      .width(300)
      .margin(10)
      .justifyContent(FlexAlign.SpaceBetween)

      Divider()
        .color('#33ffffff')
        .width('90%')

      Column({space:13}){
        Row({space:10}){
          Text(this.itemInfo.text+this.itemInfo.num).fontSize(20).fontColor(Color.White)
        }.width('100%').margin({top:15})
        Text(this.itemInfo.advice).fontSize(13).fontColor(Color.White).width('100%')
      }.margin({left:18})

      Progress({ value: this.itemInfo.num, total: 100, type: ProgressType.Linear }).width('90%')
        .margin({top:12})
    }
    .width(340)
    .height(140)
    .margin({left:20})
    .backgroundColor('#33000000')
    .borderRadius(10)
    .clickEffect({level:ClickEffectLevel.LIGHT})
  }
}