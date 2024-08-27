import {SwiperViewModel} from '../viewmodel/Swiper_viewmodel'


@Builder
function my_warn(title:string,text:string){
  Column(){
    Text(title).fontSize(22).fontColor(Color.White).width('100%').margin({top:8,left:13})
    Text(text).fontSize(12).fontColor('#66ffffff').width('100%').margin({top:5,left:13})
      .textOverflow({
        overflow:TextOverflow.Ellipsis
      })
      .maxLines(2)
  }
}



@Component
export default struct mySwiper{
  @Link itemInfo:SwiperViewModel
  flag=0


  build() {
    Swiper(){
      //轮播
      Column(){
        Text('天气预警').fontSize(22).fontColor(Color.White).width('100%').margin({top:8,left:13})
        if(this.itemInfo.text){
          Text(this.itemInfo.text).fontSize(12).fontColor('#66ffffff').width('100%').margin({top:5,left:13})
        }else{
          Text('今天没有预警').fontSize(12).fontColor('#66ffffff').width('100%').margin({top:5,left:13})
            .textOverflow({
              overflow:TextOverflow.Ellipsis
            })
            .maxLines(2)
        }

      }
      my_warn('降雨提醒','95分钟后雨就停了')
      my_warn('穿衣提醒','这么热的天适合穿短袖')
    }
    .onClick(()=>{
      this.flag=1
    })
    .width(340)
    .height(80)
    .margin({left:20})
    .borderRadius(10)
    .backgroundColor('#33000000')
    .autoPlay(true)
    .indicator(this.flag==0?false:true)
  }
}