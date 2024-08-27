import { webview } from '@kit.ArkWeb';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      Web({ src: 'https://news.heytapdownload.com/weather/current.do?language=zh-cn&id=106577&unit=c&appFrom=2&openSource=15day_weather&template_rule=heytap&datasource=2&ver=13009002&frontCode=2.0&infoEnable=true&fromWeatherApp=true#/current', controller: this.controller, incognitoMode: true })
    }
  }
}