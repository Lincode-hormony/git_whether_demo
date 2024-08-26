@Entry
@Component
struct Setting {
  @State message: string = '这是设置';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('SettingHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}