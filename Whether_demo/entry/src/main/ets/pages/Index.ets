//组件显示
import ShowNum from '../view/ShowNum'
import mySwiper from '../view/Swiper'
import TimeList from '../view/TimeList'
import DayList from '../view/DayList'
import Air from '../view/Air'
import myGird from '../view/myGird'
import  Advice from '../view/Advice'
import Time from '../view/Time'
import  myVideo from '../view/myVidio'

import { router } from '@kit.ArkUI'
import preferences from '@ohos.data.preferences'

import HttpUtil_city from '../Util/HttpUtil_city'
import {location} from '../model/GeoIp'

import {SwiperViewModel} from '../viewmodel/Swiper_viewmodel'
import {ShowNumViewModel} from '../viewmodel/ShowNum_viewmodel'
import {HourlyViewModel} from '../viewmodel/Hourly_viewmodel'
import {DailyViewModel} from '../viewmodel/Daily_viewmodel'
import {AirViewModel} from '../viewmodel/Air_viewmodel'
import {GirdViewModel} from '../viewmodel/Gird_viewmodel'
import {TimeViewModel} from '../viewmodel/Time_viewmodel'
import {CityMainViewModel} from '../viewmodel/CityMain_viewmodel'


import HttpUtil_now from '../Util/HttpUtil_now'
import HttpUtil_daily from '../Util/HttpUtil_Daily'
import HttpUtil_air from '../Util/HttpUtil_Air'
import HttpUtil_warn from '../Util/HttpUtil_warn'
import HttpUtil_hourly from '../Util/HttpUtil_hourly'

import help from '../Util/Help'
import {CityPassViewModel} from '../viewmodel/City_Pass_viewmodel'

@Entry
@Component
struct Index {
  swiperController: SwiperController = new SwiperController()

  @State city_name:string=''
  @State obj:object=router.getParams()
  @State city_Num :string=''
  @State k:location=new location()


  @State ShowNumData:ShowNumViewModel=new ShowNumViewModel()
  @State SwiperData:SwiperViewModel=new SwiperViewModel()
  @State HourlyData:HourlyViewModel=new HourlyViewModel()
  @State DailyData:DailyViewModel=new DailyViewModel()
  @State AirData:AirViewModel=new AirViewModel()
  @State GirdData:GirdViewModel=new GirdViewModel()
  @State TimeData:TimeViewModel=new TimeViewModel()

  @State CityData:Array<CityMainViewModel>=[]

   @State city:Array<CityPassViewModel>=[]

  @State num:number=0


   onPageShow(): void {




     if(0){
       // this.city_Num=this.obj['info']
       // HttpUtil3.GetData(this.city_Num).then((v)=>{
       //   this.city_name=v.location[0].name
       // })
       this.city_Num=this.obj['info']
       HttpUtil_now.GetData(this.city_Num).then((now)=>{
         HttpUtil_daily.GetData(this.city_Num).then((city)=>{
           HttpUtil_air.GetData(this.city_Num).then((air)=>{
             this.ShowNumData=help.get_ShowNum_data(now.now,city.daily[0],air.aqi[0])
           })
         })
       })

       //拿滚动组件的数据
       HttpUtil_warn.GetData(this.city_Num).then((warn)=>{
         this.SwiperData=help.get_Swiper_data(warn.warning[0])
       })

       //获取每小时天气
       HttpUtil_hourly.GetData(this.city_Num).then((hourly)=>{
         this.HourlyData=help.get_TimeList_data(hourly)
       })

       //获取每天天气
       HttpUtil_daily.GetData(this.city_Num).then((daily)=>{
         this.DailyData=help.get_DayList_data(daily)
       })

       //获取空气质量数据
       HttpUtil_air.GetData(this.city_Num).then((air)=>{
         this.AirData=help.get_Air_data(air.aqi[0])
       })

       //拿各种数据
       HttpUtil_now.GetData(this.city_Num).then((now)=>{
         HttpUtil_daily.GetData(this.city_Num).then((daily)=>[
           this.GirdData=help.get_Gird_data(daily.daily[0],now.now)
         ])
       })

       //日出日落
       HttpUtil_daily.GetData(this.city_Num).then((daily)=>{
         this.TimeData=help.get_Time_data(daily.daily[0])
       })

       HttpUtil_city.GetData(this.city_Num).then((v)=>{
         this.city_name=v.location[0].name
       })
     }else {
       this.Get_preference().then((preference:preferences.Preferences)=>{
         preference.get('city_data',[]).then((v)=>{
            this.city=v as Array<CityPassViewModel>
           console.info('我拿到了'+JSON.stringify(this.city))


           for(let i=0;i<this.city.length;i++){
             let this_city:CityMainViewModel=new CityMainViewModel()

             //拿组件温度的数据
             HttpUtil_now.GetData(this.city[i].id).then((now)=>{
               HttpUtil_daily.GetData(this.city[i].id).then((city)=>{
                 HttpUtil_air.GetData(this.city[i].id).then((air)=>{
                   this_city.ShowNumData=help.get_ShowNum_data(now.now,city.daily[0],air.aqi[0])
                 })
               })
             })

             //拿滚动组件的数据
             HttpUtil_warn.GetData(this.city[i].id).then((warn)=>{
               this_city.SwiperData=help.get_Swiper_data(warn.warning[0])
             })

             //获取每小时天气
             HttpUtil_hourly.GetData(this.city[i].id).then((hourly)=>{
               this_city.HourlyData=help.get_TimeList_data(hourly)
             })

             //获取每天天气
             HttpUtil_daily.GetData(this.city[i].id).then((daily)=>{
               this_city.DailyData=help.get_DayList_data(daily)
             })

             //获取空气质量数据
             HttpUtil_air.GetData(this.city[i].id).then((air)=>{
               this_city.AirData=help.get_Air_data(air.aqi[0])
             })

             //拿各种数据
             HttpUtil_now.GetData(this.city[i].id).then((now)=>{
               HttpUtil_daily.GetData(this.city[i].id).then((daily)=>[
                 this_city.GirdData=help.get_Gird_data(daily.daily[0],now.now)
               ])
             })

             //日出日落
             HttpUtil_daily.GetData(this.city[i].id).then((daily)=>{
               this_city.TimeData=help.get_Time_data(daily.daily[0])
             })

             // HttpUtil_city.GetData(this.city_Num).then((v)=>{
             //   this.city_name=v.location[0].name
             // })



             this.CityData.push(this_city)
             console.info('暂时数据'+i+JSON.stringify(this.CityData))

           }

           console.info('最终数据'+JSON.stringify(this.CityData))
           console.info('最终数据'+this.CityData.length)







         })
       })
     }




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
      //导航栏
      Row(){
        Column(){
          if (this.city && this.city.length > 0) {
            Text(this.city[this.num].name)
              .fontSize(22)
              .fontColor(Color.White)
              .margin({top:15})
          } else {
            Text('正在加载数据')
          }




          // Image($r('app.media.dingwei'))
          //   .width(14)
          //   .alignSelf(ItemAlign.Start)
          //   .margin({left:10})
        }
        .width(80)
        .height(50)
        //.backgroundColor(Color.Pink)


        Row({space:20}){
          Image($r('app.media.yifu')).width(20)
            .onClick(()=>{
              this.city_Num='101300103'
              AlertDialog.show({message:'修改成功：'+this.city_Num})
            })
          Image($r('app.media.wenjian')).width(20)
            .onClick(()=>{
              router.pushUrl({url:'pages/City_Rdb'})
            })
          Image($r('app.media.shezhi')).width(20)
            .onClick(()=>{
              router.pushUrl({url:'pages/Setting'})
            })
        }
        .margin({right:10})
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .backgroundColor('#ff2c6bca')
      .width('100%')
      .height(37)
      .zIndex(99)



      Swiper(this.swiperController){
        ForEach(this.CityData,(value:CityMainViewModel,index:number)=>{
          //List组件
          List(){
            //温度显示
            ListItem(){
              ShowNum({itemInfo:value.ShowNumData})
            }
            .margin({top:60})

            //建议
            ListItem(){
              mySwiper({itemInfo:value.SwiperData})
            }
            .margin({top:50})

            //时间段
            ListItem(){
              TimeList({itemInfo:value.HourlyData})
            }
            .margin({top:20})

            //未来十五天
            ListItem(){
              DayList({itemInfo:value.DailyData})
            }
            .margin({top:20})

            //空气质量
            ListItem(){
              Air({itemInfo:value.AirData})
            }
            .margin({top:20})

            //六张小卡片
            ListItem(){
              myGird({itemInfo:value.GirdData})
            }
            .margin({top:20})

            //日出日落
            ListItem(){
              Time({itemInfo:value.TimeData})
            }
            .margin({top:20})

            //央视预报
            ListItem(){
              myVideo()
            }
            .margin({top:20})

            //生活建议
            ListItem(){
              Advice()
            }
            .margin({top:20})

            ListItem(){
              Text('OpenHarmony--天气预报')
                .textAlign(TextAlign.Center)
                .width('100%')
                .fontColor('#b3ffffff')
                .fontWeight(800)
            }
            .margin({top:20})


          }
          .width('100%')
          .height('100%')
          .backgroundColor('#ff2c6bca')
          .scrollBar(BarState.Off)
        })
      }
      .loop(false)
      .indicator(
        Indicator.dot()
          .left(5)
          .top(28)
          .itemWidth(4)
          .itemHeight(4)
          .selectedItemWidth(4)
          .selectedItemHeight(4)
          .color('#66ffffff')
          .selectedColor('#ffffffff')
      )
      .onChange((index)=>{
        this.num=index
      })



    }
    .sharedTransition('ID',{duration:400,curve:Curve.Smooth,delay:100})
    .backgroundColor('#ff2c6bca')
  }
}
