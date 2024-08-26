import getText from '../model/AdviceModel'
@Builder
function advice(num:number,text:string){
  Column({space:10}){
    Image($r(`app.media.advice_${num}`)).width(30)
    Text(text)
      .fontColor('#99ffffff')
  }
  //.backgroundColor('#33000000')
  .width('100%')
  .borderRadius(10)
  .clickEffect({level:ClickEffectLevel.LIGHT})



}




@Component
export default struct Advice{



  build() {
    Column(){
      Row(){
        Text('生活建议')
          .fontSize(15)
          .fontColor('#99ffffff')

        Text('>')
          .fontColor('#99ffffff')
          .fontWeight(900)
      }
      //.backgroundColor(Color.White)
      .width(300)
      .margin(15)
      .justifyContent(FlexAlign.SpaceBetween)

      Divider()
        .color('#33ffffff')
        .width('90%')
      Grid(){
        ForEach([1,2,3,4,5,6,7,8,9],(index:number)=>{
          GridItem(){
            advice(index,getText(index))
          }
          .alignSelf(ItemAlign.Center)
          //.backgroundColor(Color.White)
        })
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr')
      .columnsGap(15)
      .rowsGap(5)
      .width(320)
      //.margin({left:20})
      .height(260)
    }
    .backgroundColor($r('sys.color.mask_fourth'))
    .width(340)
    .height(310)
    .margin({left:20})
    .borderRadius(10)
    }

}