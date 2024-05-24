import { CommonConstants } from '../../common/constants/CommonConstants'
@Component
export default struct ItemList{
  build(){
    Tabs(){
      TabContent(){
        this.TabContentBuilder()
      }
      .tabBar('全部')
      TabContent(){
        this.TabContentBuilder()
      }
      .tabBar('果蔬')
      TabContent(){
        this.TabContentBuilder()
      }
      .tabBar('肉蛋奶')
      TabContent(){
        this.TabContentBuilder()
      }
      .tabBar('坚果')
      TabContent(){
        this.TabContentBuilder()
      }
      .tabBar('其他')
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height('100%')
  }
  @Builder TabContentBuilder(){
    List({space: 10}){
      ForEach([1,2,3,4,5,6,7],(item)=>{
        ListItem(){
          Row({space: 6}){
            Image($r('app.media.toast'))
              .width(50)
            Column({space: 4}){
              Text('土司面包').fontWeight(CommonConstants.FONT_WEIGHT_500)
              Text('1片').fontSize(14).fontColor($r('app.color.light_gray'))
            }
            Blank()
            Image($r('app.media.ic_public_add_norm_filled'))
              .width(18)
              .fillColor($r('app.color.primary_color'))
          }
          .width('100%')
          .padding(CommonConstants.SPACE_6)
        }
      })
    }
    .width('100%')
    .height('100%')
  }
}