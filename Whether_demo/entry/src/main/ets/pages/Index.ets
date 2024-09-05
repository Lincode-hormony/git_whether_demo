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

import {SwiperViewModel} from '../viewmodel/Swiper_viewmodel'
import {ShowNumViewModel} from '../viewmodel/ShowNum_viewmodel'
import {HourlyViewModel} from '../viewmodel/Hourly_viewmodel'
import {DailyViewModel} from '../viewmodel/Daily_viewmodel'
import {AirViewModel} from '../viewmodel/Air_viewmodel'
import {GirdViewModel} from '../viewmodel/Gird_viewmodel'
import {TimeViewModel} from '../viewmodel/Time_viewmodel'
import {CityMainViewModel} from '../viewmodel/CityMain_viewmodel'
import {CityPassViewModel} from '../viewmodel/City_Pass_viewmodel'

import HttpUtil_city from '../Util/HttpUtil_city'
import HttpUtil_now from '../Util/HttpUtil_now'
import HttpUtil_daily from '../Util/HttpUtil_Daily'
import HttpUtil_air from '../Util/HttpUtil_Air'
import HttpUtil_warn from '../Util/HttpUtil_warn'
import HttpUtil_hourly from '../Util/HttpUtil_hourly'
import HttpUtil_local from '../Util/HttpUtil_Local'

import help from '../Util/Help'


@Entry
@Component
struct Index {
  swiperController: SwiperController = new SwiperController()

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

  @State local_city:string=''
  @State local_id:string=''
  @State local_cityData:CityMainViewModel=new CityMainViewModel()

  @State numa:number=0

  @State num_local:number=0

  private scrollerForList: Scroller = new Scroller()

  private scrollerForList1: Scroller = new Scroller()

  @State ref:boolean=false
  @State change1:number=0

  @State ref1:boolean=false
  @State change2:number=0

  @State index:number=0
  @State obj:object=router.getParams()

  @Builder
  customRefreshComponent(num:number)
  {
    Stack()
    {
      Row()
      {
        if(num==1){
          LoadingProgress().height(16)
          Text("下拉刷新").fontSize(10).margin({left:20}).fontColor(Color.White)
        }else if(num==2){
          LoadingProgress().height(16)
          Text("松开刷新").fontSize(10).margin({left:20}).fontColor(Color.White)
        }else if(num==3){
          LoadingProgress().height(16)
          Text("页面刷新中").fontSize(10).margin({left:20}).fontColor(Color.White)
        }

      }
      .alignItems(VerticalAlign.Center)
    }
    .align(Alignment.Start)
    .clip(true)
    .constraintSize({minHeight:32}) // 设置最小高度约束保证自定义组件高度随刷新区域高度变化时自定义组件高度不会低于minHeight
    .width("100%")
  }

  aboutToAppear(): void {

  }


   onPageShow(): void {
    console.info('数据检查：'+console.info(this.CityData.length.toString()))

    //请求本地城市数据
       HttpUtil_local.GetData().then((v)=>{
         this.local_city=v.city
         HttpUtil_city.GetData(this.local_city).then((v)=>{
           this.local_id=v.location[0].id

           HttpUtil_now.GetData(this.local_id).then((now)=>{
             HttpUtil_daily.GetData(this.local_id).then((city)=>{
               HttpUtil_air.GetData(this.local_id).then((air)=>{
                 this.local_cityData.ShowNumData=help.get_ShowNum_data(now.now,city.daily[0],air.aqi[0])
               })
             })
           })

           //拿滚动组件的数据
           HttpUtil_warn.GetData(this.local_id).then((warn)=>{
             this.local_cityData.SwiperData=help.get_Swiper_data(warn.warning[0])
           })

           //获取每小时天气
           HttpUtil_hourly.GetData(this.local_id).then((hourly)=>{
             this.local_cityData.HourlyData=help.get_TimeList_data(hourly)
           })

           //获取每天天气
           HttpUtil_daily.GetData(this.local_id).then((daily)=>{
             this.local_cityData.DailyData=help.get_DayList_data(daily)
           })

           //获取空气质量数据
           HttpUtil_air.GetData(this.local_id).then((air)=>{
             this.local_cityData.AirData=help.get_Air_data(air.aqi[0])
           })

           //拿各种数据
           HttpUtil_now.GetData(this.local_id).then((now)=>{
             HttpUtil_daily.GetData(this.local_id).then((daily)=>[
               this.local_cityData.GirdData=help.get_Gird_data(daily.daily[0],now.now)
             ])
           })

           //日出日落
           HttpUtil_daily.GetData(this.local_id).then((daily)=>{
             this.local_cityData.TimeData=help.get_Time_data(daily.daily[0])
           })
         })
       })

    //请求城市列表数据
     this.Get_preference().then((preference:preferences.Preferences)=>{
             preference.get('city_data',this.city).then((v)=>{
               this.city=v as Array<CityPassViewModel>
               console.info('我真正拿到了'+JSON.stringify(this.city))




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
     if(this.obj){
       this.index=this.obj['info']

     }

   }

   onPageHide(): void {
    //数据持久化
     this.Get_preference().then((preference)=>{
       preference.put('city_data',this.city)
       console.info('放入了数据'+this.city)
       preference.flush()
     })

     this.CityData=[]
   }

   Get_preference(){
     return preferences.getPreferences(getContext(this),'city_data')
   }

  build() {
    Stack({alignContent:Alignment.Top}){
      //导航栏
      Row(){
        Column(){
          if (this.city.length==0) {
            if(this.numa<45){
              Text(this.local_city)
                .fontSize(22)
                .fontColor(Color.White)
                .margin({top:15})

            }else{
              Text(this.local_city)
                .fontSize(5)
                .fontColor(Color.White)
                .margin({top:15})
            }

          } else {
            if(this.num==0){
              Text(this.local_city)
                .fontSize(this.num_local<45?22-(this.num_local)/10:17.5)
                .fontColor(Color.White)
                .margin({top:15})
            }else if(this.num>0 && this.city){
              Text(this.city[this.num-1].name)
                .fontSize(this.numa<45?22-(this.numa)/10:17.5)
                .fontColor(Color.White)
                .margin({top:15})
            }else {
              Text('aaa')
                .fontSize(22)
                .fontColor(Color.White)
                .margin({top:15})
            }

          }




          // Image($r('app.media.dingwei'))
          //   .width(14)
          //   .alignSelf(ItemAlign.Start)
          //   .margin({left:10})
        }
        .width(80)
        .height(50)

        Row({space:20}){
          Image($r('app.media.yifu')).width(20)
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

        Refresh({refreshing:$$this.ref,builder:this.customRefreshComponent(this.change1)}){
          List({scroller:this.scrollerForList1}) {
            //温度显示
            ListItem() {
              ShowNum({ itemInfo: this.local_cityData.ShowNumData })
            }
            .margin({ top: 60 })

            //建议
            ListItem() {
              mySwiper({ itemInfo: this.local_cityData.SwiperData })
            }
            .margin({ top: 50 })

            //时间段
            ListItem() {
              TimeList({ itemInfo: this.local_cityData.HourlyData })
            }
            .margin({ top: 20 })

            //未来十五天
            ListItem() {
              DayList({ itemInfo: this.local_cityData.DailyData })
            }
            .margin({ top: 20 })

            //空气质量
            ListItem() {
              Air({ itemInfo: this.local_cityData.AirData })
            }
            .margin({ top: 20 })

            //六张小卡片
            ListItem() {
              myGird({ itemInfo: this.local_cityData.GirdData })
            }
            .margin({ top: 20 })

            //日出日落
            ListItem() {
              Time({ itemInfo: this.local_cityData.TimeData })
            }
            .margin({ top: 20 })

            //央视预报
            ListItem() {
              myVideo()
            }
            .margin({ top: 20 })

            //生活建议
            ListItem() {
              Advice()
            }
            .margin({ top: 20 })

            ListItem() {
              Text('OpenHarmony--天气预报')
                .textAlign(TextAlign.Center)
                .width('100%')
                .fontColor('#b3ffffff')
                .fontWeight(800)
            }
            .margin({ top: 20 })
          }
          .onDidScroll(()=>{
            this.num_local=this.scrollerForList1.currentOffset().yOffset
          })
          .scrollBar(BarState.Off)


        }
        .onRefreshing(()=>{
          setTimeout(()=>{
            this.ref=false
          },2000)
        })
        .onStateChange((value)=>{
          this.change1=value
        })
        .margin({top:42})

        //本地城市信息渲染


        //列表城市信息渲染
        ForEach(this.CityData,(value:CityMainViewModel)=>{
          //List组件
          Refresh({refreshing:$$this.ref1,builder:this.customRefreshComponent(this.change2)}){
          List({scroller:this.scrollerForList}){
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
          .onDidScroll(()=>{
            this.numa=this.scrollerForList.currentOffset().yOffset
          })
          }
          .margin({top:40})
          .onRefreshing(()=>{
            setTimeout(()=>{
              this.ref1=false
            },2000)
          })
          .onStateChange((value)=>{
            this.change2=value
          })
        })
      }
      .loop(false)
      .indicator(this.numa>45||this.num_local>45?false:
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
      .index(this.index)
      .onChange((index)=>{
        this.num=index
      })





    }
    .sharedTransition('ID',{duration:400,curve:Curve.Smooth,delay:100})
    .backgroundColor('#ff2c6bca')
  }
}
