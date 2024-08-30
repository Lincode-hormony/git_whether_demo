import {ShowNumViewModel } from '../viewmodel/ShowNum_viewmodel'
import {CityPassViewModel} from '../viewmodel/City_Pass_viewmodel'
import { router } from '@kit.ArkUI'

@Component
export struct card_list{
  @ObjectLink card_data:ShowNumViewModel
  @Link city:Array<CityPassViewModel>
  @Prop index:number
  build() {
        Column(){
          Row(){
            Text(this.city && this.city.length > 0 && this.index >= 0 && this.index < this.city.length && this.city[this.index].name?this.city[this.index].name:'正在加载中').margin(15).fontColor(Color.White).fontSize(25).fontWeight(300)
            Text(this.card_data.temp).margin(15).fontColor(Color.White).fontSize(25).fontWeight(500)
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)

          Row(){
            Text('空气'+this.card_data.category+'   '+this.card_data.value).margin(15).fontColor('#66ffffff').fontSize(16).fontWeight(300)
            Text(this.card_data.text).margin(15).fontColor(Color.White).fontSize(16).fontWeight(500)
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .position({x:0,y:45})
          //.backgroundColor(Color.Blue)

        }
        .backgroundColor('#ff2c6bca')
        .width(315)
        .height(95)
        .margin({left:20,right:20})
        .borderRadius(10)
      }
      // .sharedTransition('ID',{duration:400,curve:Curve.Smooth,delay:100})
      // .margin({bottom:15})
      // .onClick(()=>{
      //   router.pushUrl({
      //     url:'pages/Index',
      //
      //
      //   })
      // })

}