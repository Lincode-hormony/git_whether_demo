import {ShowNumViewModel} from '../viewmodel/ShowNum_viewmodel'

@Component
export default struct ShowNum{
  @Link itemInfo:ShowNumViewModel

  build() {
    Column(){
      Row(){
        Text(this.itemInfo.temp)
          .fontSize(120)
          .width('100%')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
      }

      Row({space:11}){
        Text(this.itemInfo.text).fontColor(Color.White)
        Text(this.itemInfo.min+'/'+this.itemInfo.max).fontColor(Color.White)
        Text('空气'+this.itemInfo.category+this.itemInfo.value).fontColor(Color.White)
      }

    }
  }
}