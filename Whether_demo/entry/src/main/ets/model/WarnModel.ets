export class Warning {
  // 定义类的属性
  id: string = ''
  sender: string = ''
  pubTime: string = ''
  title: string = ''
  startTime: string = ''
  endTime: string = ''
  status: string = ''
  level: string = ''
  severity: string = ''
  severityColor: string = ''
  type: number = 0
  typeName: string = ''
  urgency: string = ''
  certainty: string = ''
  text: string = ''
  related: string = ''
}

export class warn{
  code:string=''
  updateTime:string=''
  fxLink:string=''
  warning:Array<Warning>=[]
  refer:Array<reference>=[]
}
export class reference{
  sources:string[]=[]
  license:string[]=[]
}