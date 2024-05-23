import { CommonConstants } from '../../common/constants/CommonConstants'

@Extend(Text) function grayText(){
  .fontSize(14)
  .fontColor($r('app.color.light_gray'))
}
@Component
export default struct RecordList{
  build(){
    List({space: 10}){
      ForEach([1,2,3],(item)=>{
        ListItem(){
          Column(){
            Row(){
              Image($r('app.media.ic_breakfast'))
                .width(20)
              Text('早餐')
                .fontWeight(CommonConstants.FONT_WEIGHT_600)
                .fontSize(18)
              Text('建议100-200千卡')
                .grayText()
              Blank()
              Text('190')
                .fontSize(14)
                .fontColor($r('app.color.primary_color'))
              Text('千卡')
                .grayText()
              Image($r('app.media.ic_public_add_norm_filled'))
                .width(20)
                .fillColor($r('app.color.primary_color'))
            }
            .width('100%')
            List(){
              ForEach([1,2],(item)=>{
                ListItem(){
                  Row({space: 6}){
                    Image($r('app.media.toast'))
                      .width(50)
                    Column(){
                      Text('土司面包').fontWeight(CommonConstants.FONT_WEIGHT_500)
                      Text('1片').grayText()
                    }
                    Blank()
                    Text('50千卡').grayText()
                  }
                  .width('100%')
                  .padding(CommonConstants.SPACE_6)
                }
                .swipeAction({end: this.deleteButton.bind(this)})
              })
            }
            .width('100%')
          }
          .width('100%')
          .backgroundColor(Color.White)
          .borderRadius(CommonConstants.DEFAULT_18)
          .padding(CommonConstants.SPACE_12)
        }
      })
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height('100%')
    .margin({top: 10})
  }
  @Builder deleteButton(){
    Image($r('app.media.ic_public_delete_filled'))
      .width(20)
      .fillColor(Color.Red)
      .margin(5)
  }
}