import { router } from '@kit.ArkUI'
import CustomDialogComponent from '../view/Dialog_Add'
import {city} from '../model/CityModel'





//
// @Builder
// function  card(){
//   Column(){
//     Row(){
//       Text('长安区').margin(15).fontColor(Color.White).fontSize(25).fontWeight(300)
//       Text('26°').margin(15).fontColor(Color.White).fontSize(25).fontWeight(500)
//     }
//     .width('100%')
//     .justifyContent(FlexAlign.SpaceBetween)
//
//     Row(){
//       Text('空气优  20').margin(15).fontColor('#66ffffff').fontSize(16).fontWeight(300)
//       Text('多云').margin(15).fontColor(Color.White).fontSize(16).fontWeight(500)
//     }
//     .width('100%')
//     .justifyContent(FlexAlign.SpaceBetween)
//     .position({x:0,y:45})
//     //.backgroundColor(Color.Blue)
//
//   }
//   .backgroundColor(Color.Orange)
//   .width(315)
//   .height(95)
//   .margin({left:20,right:20})
//   .borderRadius(10)
// }





@Entry
@Component
struct City_Rdb {

  @State city:Array<city>=[]


  dialogController:CustomDialogController=new CustomDialogController({
    builder: CustomDialogComponent({
      get_data:()=>{

      },
      confirm:()=>{},
      city:$city
    }),
    alignment:DialogAlignment.Center,
    customStyle:true,

  })
build() {
  Stack({alignContent:Alignment.Top}){

    Row(){
      Row(){
        Text('<-').margin({left:15}).fontWeight(600).onClick(()=>{
          router.back()
        })
        Text('城市管理').margin({left:10}).fontSize(17)
      }.layoutWeight(1)

      Image($r('app.media.qiya')).width(20).backgroundColor(Color.Blue).margin({right:30})
    }
    //.backgroundColor(Color.Blue)
    .width('100%')
    .height(40)
    .zIndex(999)


    List(){
      ListItem() {
        Column() {
          Row() {
            Text('北京市').margin(15).fontColor(Color.White).fontSize(25).fontWeight(300)
            Text('34°').margin(15).fontColor(Color.White).fontSize(25).fontWeight(500)
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)

          Row() {
            Text('空气优  20').margin(15).fontColor('#66ffffff').fontSize(16).fontWeight(300)
            Text('多云').margin(15).fontColor(Color.White).fontSize(16).fontWeight(500)
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .position({ x: 0, y: 45 })


        }
        .backgroundColor(Color.Orange)
        .width(315)
        .height(95)
        .margin({ left: 20, right: 20 })
        .borderRadius(10)

      }
      .margin({bottom:15})
      .onClick(()=>{
        router.pushUrl({
          url:'pages/Index',
          params:{
            info:'101010100'
          }

        })
      })


      ForEach(this.city,(value:city)=>{
        ListItem(){
          Column(){
            Row(){
              Text(value.city).margin(15).fontColor(Color.White).fontSize(25).fontWeight(300)
              Text(value.temp).margin(15).fontColor(Color.White).fontSize(25).fontWeight(500)
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)

            Row(){
              Text(`空气${value.air_level}`+'    '+value.air_value?.toString()).margin(15).fontColor('#66ffffff').fontSize(16).fontWeight(300)
              Text(value.whether).margin(15).fontColor(Color.White).fontSize(16).fontWeight(500)
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .position({x:0,y:45})
            //.backgroundColor(Color.Blue)

          }
          .backgroundColor(Color.Orange)
          .width(315)
          .height(95)
          .margin({left:20,right:20})
          .borderRadius(10)
        }
        .margin({bottom:15})
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