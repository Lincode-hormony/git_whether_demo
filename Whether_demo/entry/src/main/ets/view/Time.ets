
import {TimeViewModel} from '../viewmodel/Time_viewmodel'


@Component
export default struct Time{
  @ObjectLink itemInfo:TimeViewModel

  build() {
    Column(){
      Row(){
        Column(){
          Image($r('app.media.ss')).width(35).margin({left:40})
          Text('日出').margin({left:40}).fontColor('#66ffffff')
        }

        Column(){
          Image($r('app.media.sss')).width(35).margin({right:50})
          Text('日落').margin({right:50}).fontColor('#66ffffff')
        }
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .margin({top:20})

      Progress({ value: 24, total: 100, type: ProgressType.Linear }).width('90%')
        .margin({top:20})
        .animation({
          duration: 700,
          curve: Curve.EaseOut,
          iterations: 1,
          playMode: PlayMode.Normal,
        })


      Row(){
          Text(this.itemInfo.up).margin({left:40}).fontColor(Color.White)
          Text(this.itemInfo.down).margin({right:50}).fontColor(Color.White)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .margin({top:20})
    }
    .width(340)
    .height(140)
    .margin({left:20})
    .backgroundColor('#33000000')
    .borderRadius(10)
  }
}