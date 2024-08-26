export class location{
  name: string=''
  id: string=''
  lat: string=''
  lon: string=''
  adm2: string=''
  adm1: string=''
  country: string=''
  tz: string=''
  utcOffset: string=''
  isDst: string=''
  type: string=''
  rank: string=''
  fxLink: string=''
}

export class reference{
  sources:string[]=[]
  license:string[]=[]
}

export class city_data{
  code:string=''
  location:Array<location>=[]
  refer:Array<reference>=[]
}