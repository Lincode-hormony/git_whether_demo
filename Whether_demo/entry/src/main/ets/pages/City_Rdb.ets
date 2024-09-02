import { router } from '@kit.ArkUI'
import CustomDialogComponent from '../view/Dialog_Add'

import { preferences } from '@kit.ArkData'
import HttpUtil_city from '../Util/HttpUtil_city'
import {CityPassViewModel} from '../viewmodel/City_Pass_viewmodel'
import HttpUtil_local from '../Util/HttpUtil_Local'
import help from '../Util/Help'
import {ShowNumViewModel} from '../viewmodel/ShowNum_viewmodel'
import HttpUtil_now from '../Util/HttpUtil_now'
import HttpUtil_daily from '../Util/HttpUtil_Daily'
import HttpUtil_air from '../Util/HttpUtil_Air'

import {card_list} from '../view/Card_list'



@Entry
@Component
struct City_Rdb {


  @Builder
  delButton(index:number) {
    Button('×')
      .fontSize(20)
      .type(ButtonType.Circle)
      .align(Alignment.Center)
      .margin({ right: 20 })
      .backgroundColor(Color.Red)
      .onClick(() => {
        this.card_data.splice(index,1)
        this.city.splice(index,1)
      })
  }


  @State city:Array<CityPassViewModel>=[]
  @State local_city:string=''
  @State local_id:string=''
  @State local_card:ShowNumViewModel=new ShowNumViewModel()

  @State card_data:Array<ShowNumViewModel>=[]


  dialogController:CustomDialogController=new CustomDialogController({
    builder: CustomDialogComponent({
      get_data:()=>{
        this.aboutToAppear()
        console.info('刷新')
      },
      confirm:()=>{},
      city:$city
    }),
    alignment:DialogAlignment.Center,
    customStyle:true,

  })


  aboutToAppear(): void {
    HttpUtil_local.GetData().then((v)=>{
      this.local_city=v.city
      HttpUtil_city.GetData(this.local_city).then((v)=>{
        this.local_id=v.location[0].id

        HttpUtil_now.GetData(this.local_id).then((now)=>{
          HttpUtil_daily.GetData(this.local_id).then((city)=>{
            HttpUtil_air.GetData(this.local_id).then((air)=>{
              this.local_card=help.get_ShowNum_data(now.now,city.daily[0],air.aqi[0])
            })
          })
        })

        for (let i=0;i<this.city.length;i++){
          let this_data:ShowNumViewModel=new ShowNumViewModel()
          HttpUtil_now.GetData(this.city[i].id).then((now)=>{
            HttpUtil_daily.GetData(this.city[i].id).then((city)=>{
              HttpUtil_air.GetData(this.city[i].id).then((air)=>{
                this_data=help.get_ShowNum_data(now.now,city.daily[0],air.aqi[0])
                console.info(`卡片${i}`+JSON.stringify(this_data))
                this.card_data.push(this_data)
              })
            })
          })
          //console.info(`卡片${i}`+JSON.stringify(this_data))

        }
        console.info('卡片'+JSON.stringify(this.card_data))

      })
    })
this.Get_preference().then((preference)=>{
  preference.get('city_data',[]).then((v)=>{
    console.info('拿了数据'+v)
    this.city=v as CityPassViewModel[]

  })
})


  }

  onPageHide(): void {
    this.Get_preference().then((preference)=>{
      preference.put('city_data',this.city)
      console.info('放入了数据'+this.city)
      preference.flush()
    })
  }

  Get_preference(){
    return preferences.getPreferences(getContext(this),'city_data')
  }

  build() {
  Stack({alignContent:Alignment.Top}){

    Row(){
      Row(){
        Text('<-').margin({left:15}).fontWeight(600).onClick(()=>{
          router.back()
        })
        Text('城市管理').margin({left:10}).fontSize(17)
      }.layoutWeight(1)

      Image($r('app.media.bianji')).width(20).margin({right:30})
    }
    //.backgroundColor(Color.Blue)
    .width('100%')
    .height(40)
    .zIndex(999)


    List(){
      ListItem() {
        Column() {
          Row() {
            Text(this.local_city).margin(15).fontColor(Color.White).fontSize(25).fontWeight(300)
            Text(this.local_card.temp).margin(15).fontColor(Color.White).fontSize(25).fontWeight(500)
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)

          Row() {
            Text('空气'+this.local_card.category+'   '+this.local_card.value).margin(15).fontColor('#66ffffff').fontSize(16).fontWeight(300)
            Text(this.local_card.text).margin(15).fontColor(Color.White).fontSize(16).fontWeight(500)
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .position({ x: 0, y: 45 })


        }
        .backgroundColor('#ff2c6bca')
        .width(315)
        .height(95)
        .margin({ left: 20, right: 20 })
        .borderRadius(10)

      }
      .sharedTransition('ID',{duration:400,curve:Curve.Smooth,delay:100})
      .margin({bottom:15})
      .onClick(()=>{
        router.pushUrl({
          url:'pages/Index',
          params:{
            info:'101010100'
          }

        })
      })


      ForEach(this.card_data,(value:ShowNumViewModel,index:number)=>{
        ListItem(){
          card_list({city:$city,card_data:value,index:index})
        }
        .sharedTransition('ID',{duration:400,curve:Curve.Smooth,delay:100})
        .margin({bottom:15})
        .onClick(()=>{
          router.pushUrl({
            url:'pages/Index',
          })
        })
        .swipeAction({ end: {builder:this.delButton(index)} })
      })
    }
    .margin({top:50})

    Button('＋').width(60).height(60).borderRadius(8).position({x:270,y:630})
      .fontSize(30)
      .onClick(()=>{
        this.dialogController.open()
      })





  }
}
}