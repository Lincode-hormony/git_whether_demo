import { router } from '@kit.ArkUI'

@Component
export default struct NavBar{
  build() {
    Row(){
      Column(){
        Text('长安区')
          .fontSize(22)
          .fontColor(Color.White)
          .margin({top:6,bottom:3})
        Image($r('app.media.dingwei'))
          .width(14)
          .alignSelf(ItemAlign.Start)
          .margin({left:10})
      }
      .width(80)
      .height(50)
      //.backgroundColor(Color.Pink)


      Row({space:20}){
        Image($r('app.media.yifu')).width(20)
        Image($r('app.media.wenjian')).width(20)
          .onClick(()=>{
            router.pushUrl({url:'pages/City_Rdb'})
          })
        Image($r('app.media.shezhi')).width(20)
      }
      .margin({right:10})
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')


  }
}