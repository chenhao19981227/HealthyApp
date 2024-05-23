import { CommonConstants } from '../../common/constants/CommonConstants'
@Component
export default struct NutrientStats{
  carbon: number = 10
  protein: number = 20
  fat: number = 30
  recommendCarbon: number = CommonConstants.RECOMMEND_CARBON
  recommendProtein: number = CommonConstants.RECOMMEND_PROTEIN
  recommendFat: number = CommonConstants.RECOMMEND_FAT

  build(){
    Row(){
      this.StatsBuilder('碳水化合物',this.carbon,this.recommendCarbon,$r('app.color.carbon_color'))
      this.StatsBuilder('蛋白质',this.protein,this.recommendProtein,$r('app.color.protein_color'))
      this.StatsBuilder('脂肪',this.fat,this.recommendFat,$r('app.color.fat_color'))
    }
    .justifyContent(FlexAlign.SpaceEvenly)
    .padding({top:30,bottom: 35})
  }
  @Builder  StatsBuilder(label: string, value:number, recommend: number, color: ResourceStr){
    Column({space: 6}){
      Stack(){
        Progress({
          value: value,
          total: recommend,
          type: ProgressType.Ring
        })
          .width(95)
          .style({strokeWidth: CommonConstants.DEFAULT_6})
          .color(color)
        Column({space: 6}){
          Text('推荐摄入')
            .fontColor($r('app.color.gray'))
            .fontWeight(CommonConstants.FONT_WEIGHT_700)
            .fontSize(12)
          Text(`${value.toFixed(0)}/${recommend.toFixed(0)}`)
            .fontSize(18)
            .fontWeight(CommonConstants.FONT_WEIGHT_600)
        }
      }
      Text(`${label}（克）`)
        .fontSize(12)
        .fontColor($r('app.color.light_gray'))
    }
  }
}
