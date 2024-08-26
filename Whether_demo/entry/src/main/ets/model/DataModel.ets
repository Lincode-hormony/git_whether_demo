@Observed export class  WeatherForecast {
  fxTime: string='20040527'
  temp: number=2
  icon: string='333'
  text: string=''
  wind360: number=3
  windDir: string=''
  windScale: string=''
  windSpeed: number=3
  humidity: number=3
  pop: number=2
  precip: number=3
  pressure: number=2
  cloud: number=3
  dew: number=2
}

export class reference{
  sources:string[]=[]
  license:string[]=[]
}

export class day_data{
  code:string=''
  updateTime:string=''
  fxLink:string=''
  hourly:Array<WeatherForecast>=[]
  refer:Array<reference>=[]
}



