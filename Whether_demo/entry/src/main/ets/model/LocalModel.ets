export class WeatherData {
  success: boolean=true
  city: string=''
  data: data=new data()
  air: air=new air()
  tip: string=''
}

class data{
  date: string=''
  week: string=''
  type: string=''
  low: string=''
  high: string=''
  fengxiang: string=''
  fengli: string=''
  night: night=new night()
}

class night{
  type: string=''
  fengxiang: string=''
  fengli: string=''
}

class air{
  aqi: number=0
  aqi_level: number=0
  aqi_name: string=''
  co: string=''
  no2: string=''
  o3: string=''
  pm10: string=''
  pm2_5: string=''
  so2: string=''
}