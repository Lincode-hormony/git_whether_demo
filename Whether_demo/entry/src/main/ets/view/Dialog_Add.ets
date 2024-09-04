import HttpUtil from '../Util/HttpUtil_Local'
import  { city } from '../model/CityModel'
import { now } from '../model/NowModel'
import HttpUtil1 from '../Util/HttpUtil_now'

import HttpUtil2 from '../Util/HttpUtil_Air'
import {aqi,Air} from '../model/AirModel'
import HttpUtil3 from '../Util/HttpUtil_city'
import {location} from '../model/GeoIp'
import { JSON } from '@kit.ArkTS'

import {CityPassViewModel} from  '../viewmodel/City_Pass_viewmodel'





@Preview
@CustomDialog

export default struct CustomDialogComponent {



  @State a: string = ''

  aboutToAppear(): void {
    HttpUtil.GetData().then((v) => {
      this.a = v.city
    })




  }
  @State w:Array<location>=[]

  @State x: number = 20
  @State y: number = 40
  @State c: string | number = 320
  @State q: number = 17
  @State x1: number = -125
  @State y1: number = 20
  flag = 0
  @State name:string=''
  @State flag1:string|number=0
  @State b: now = new now()
  @State d: aqi = new aqi()
  controller?: CustomDialogController
  get_data: () => void = () => {

  }
  flush:()=>void=()=>{

  }
  confirm: () => void = () => {
  }
  @Link city:Array<CityPassViewModel>
  @State city_pass:CityPassViewModel=new CityPassViewModel()


  build() {
    Column() {
      Row() {

        Text('取消').position({ x: this.x1, y: this.y1 }).fontColor('#ff3e4cd2')
          .onClick(() => {
            if (this.flag) {
              animateTo({
                duration: 140,
                curve: Curve.EaseOut,
                iterations: 1,
                playMode: PlayMode.Normal,
              }, () => {
                this.x = 20
                this.y = 40
                this.c = 320
                this.q = 17
                this.x1 = -125
                this.y1 = 20
                this.flag = 0
                this.flag1=0
                this.name=''
              })
            } else if (!this.flag) {
              this.controller?.close()
            }

          })
        Text('添加城市').fontSize(this.q).margin({ top: 20 })


      }

      Search({ placeholder: '搜索城市',value:this.name}).width(this.c).position({ x: this.x, y: this.y })
        .onClick(() => {
          animateTo({
            duration: 140,
            curve: Curve.EaseOut,
            iterations: 1,
            playMode: PlayMode.Normal,
          }, () => {
            this.x = 20
            this.y = 10
            this.c = 260
            this.q = 0
            this.x1 = 130
            this.y1 = 30
            this.flag = 1
          })
        })
        .onChange((v)=>{
          if(v)
          this.flag1=1
          HttpUtil3.GetData(v).then((value)=>{
            this.w=value.location
          })
        })



  Column({ space: 10 }) {
        if(!this.flag1){
          Text('定位城市').fontSize(14).fontColor('#66000000')
          Button(this.a).width(100).height(30).fontWeight(300)
            .onClick(() => {
              console.log('sss')
              this.controller?.close()
            })
        }else{
          List(){
            ForEach(this.w,(v:location)=>{
              ListItem(){
                Text(v.name)
                  .margin(20).width('100%')
                  .onClick(()=>{
                    this.city_pass.name=v.name
                    this.city_pass.id=v.id
                    this.city.push(this.city_pass)
                    this.flush()
                    this.controller?.close()
                    this.get_data()
                  })
              }
            })
          }


        }

    }
    .margin({ top: 70, left: 30 })
      .width('100%')//.backgroundColor(Color.Blue)
      .alignItems(HorizontalAlign.Start)


    }
    .height('95%')
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(20)

  }
}




