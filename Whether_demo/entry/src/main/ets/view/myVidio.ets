@Component
export default struct myVideo{
  build() {
    Row(){
      Row(){
        Column({space:10}){
          Text('央 视 天 气 预 报')
            .fontColor(Color.White)
            .fontWeight(400)
            .fontSize(22)
            .width('100%')
          Text('了解全国气象信息')
            .width('100%')
            .fontColor('#99ffffff')
            .fontSize(15)
        }
        .margin({left:20})
      }
      .width(190)
      .height(140)
      .margin({left:20})
      .backgroundColor('#33000000')
      .borderRadius({
        topLeft:10,
        bottomLeft:10
      })
      Row(){
        Image($r('app.media.bofang')).width(50).margin({left:50})

      }
      .width(150)
      .height(140)
      //.margin({left:10})
      .backgroundColor('#33000000')
      .borderRadius({
        topRight:10,
        bottomRight:10
      })
      .backgroundImage($r('app.media.diqiu')).backgroundImageSize({width:220})
      .backgroundImagePosition({x:0,y:-20})


    }
    .clickEffect({level:ClickEffectLevel.LIGHT})
    }

}