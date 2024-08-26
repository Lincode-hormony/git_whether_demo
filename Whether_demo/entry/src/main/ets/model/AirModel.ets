export class aqi {
  code: string = ''
  name: string = ''
  defaultLocalAqi: boolean = true
  value: number = 0
  valueDisplay: string = ''
  level: string = ''
  category: string = ''
  color: colors = new colors()
 health:health=new health()
}

  class colors{
    red:number=0
  green :number=0
  blue:number=0
  alpha:number=0
  }

  export class health{
  effect:string=''
    advice:advice=new advice()
}

export class advice{
  generalPopulation:string=''
  sensitivePopulation:string=''
}

class station{
  id:string=''
  name:string=''
}

export class Air{
  code:string=''
  updateTime=''
  aqi:Array<aqi>=[]
  pollutant:Array<pollutant>=[]
  station:Array<station>=[]
  source:string[]=[]
}

class concentration{
  value:number=0
  unit:string=''
}

class subIndex{
  value:number=0
  valueDisplay:string=''
}

class pollutant{
  code :string=''
  name:string=''
  fullName:string=''
  concentration:concentration=new concentration()
  subIndex:subIndex=new subIndex()
}