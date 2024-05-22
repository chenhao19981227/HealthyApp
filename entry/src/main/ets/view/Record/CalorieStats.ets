import { CommonConstants } from '../../common/constants/CommonConstants'
@Component
export default struct CalorieStars{
  intake: number = 100
  expand: number = 50
  recommend: number = CommonConstants.RECOMMEND_CALORIE

  remainCalorie(){
    return this.recommend-this.intake+this.expand
  }
  build(){
    Row(){
      this.StatsBuilder('饮食摄入',this.intake)
      Stack(){
        Progress({
          value: this.intake,
          total: this.recommend,
          type: ProgressType.Ring
        })
          .width(130)
          .style({strokeWidth: CommonConstants.DEFAULT_8})
          .color($r('app.color.primary_color'))
        this.StatsBuilder('还可以吃',this.remainCalorie(),`推荐${this.recommend}`)
      }
      this.StatsBuilder('运动消耗',this.expand)
    }
    .justifyContent(FlexAlign.SpaceEvenly)
    .padding({top:30,bottom: 35})
  }
  @Builder  StatsBuilder(label: string, value:number, tips?: string){
    Column({space: 6}){
      Text(label)
        .fontColor($r('app.color.gray'))
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
      Text(value.toFixed(0))
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
      if(tips){
        Text(tips)
          .fontSize(12)
          .fontColor($r('app.color.light_gray'))
      }
    }
  }
}