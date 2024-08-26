export default function getText(num:number):string{
  let text=''
  switch (num){
    case 1:
      text='宜穿短袖'
    break
    case 2:
      text='增强防晒'
      break
    case 3:
      text='脸部控油'
      break
    case 4:
      text='感冒易发'
      break
    case 5:
      text='不宜洗车'
      break
    case 6:
      text='适宜室内运动'
      break
    case 7:
      text='不宜高速驾驶'
      break
    case 8:
      text='较不宜旅游'
      break
    case 9:
      text='较适合钓鱼'
      break
    default:
      return 'error'
  }
  return text
}