import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'
import CalorieStars from './CalorieStats'
import { DatePickDialog } from './DatePickDialog'
import NutrientStats from './NutrientStats'
@Component
export default struct StatsCard{
  @StorageProp('selectedDate') selectedDate: number=DateUtil.beginTimeOfDay(new Date())
  controller: CustomDialogController = new CustomDialogController({
    builder: DatePickDialog({selectedDate: new Date(this.selectedDate)})
  })
  build(){
    Column(){
      Row(){
        Text(DateUtil.formatDate(this.selectedDate))
          .fontColor($r('app.color.secondary_color'))
        Image($r('app.media.ic_public_spinner'))
          .width(20)
          .fillColor($r('app.color.secondary_color'))
      }
      .padding(5)
      .onClick(()=>this.controller.open())

      Swiper(){
        CalorieStars()
        NutrientStats()
      }
      .width('100%')
      .backgroundColor(Color.White)
      .borderRadius(CommonConstants.DEFAULT_18)
      .indicatorStyle({selectedColor: $r('app.color.primary_color')})
      
    }
    .width(CommonConstants.THOUSANDTH_940)
    .backgroundColor($r('app.color.stats_title_bgc'))
    .borderRadius(CommonConstants.DEFAULT_18)
  }
}