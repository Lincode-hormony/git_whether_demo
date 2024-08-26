export class now {
  obsTime: string = ''
  temp: string = ''
  feelsLike: string = ''
  icon: string = ''
  text: string = ''
  windDir: string = ''
  windScale: string = ''
  windSpeed: string = ''
  humidity: string = ''
  precip: string = ''
  pressure: string = ''
  vis: string = "30"
  cloud: string = "91"
  dew: string = "20"
}

export class reference{
  sources:string[]=[]
  license:string[]=[]
}

export class now_data{
  code:string=''
  updateTime:string=''
  fxLink:string=''
  now:now=new now()
  refer:Array<reference>=[]
}

