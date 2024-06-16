import { CommonConstants } from '../../common/constants/CommonConstants'
import ItemModel from '../../model/ItemModel'
import GroupInfo from '../../viemmodel/GroupInfo'
import ItemCategory from '../../viemmodel/ItemCategory'
import RecordItem from '../../viemmodel/RecordItem'
@Component
export default struct ItemList{
  showPanel: (item: RecordItem)=>void
  @State isFood: boolean=true
  build(){
    Tabs(){
      TabContent(){
        this.TabContentBuilder(ItemModel.list(this.isFood))
      }
      .tabBar('全部')
      ForEach(ItemModel.listItemGroupByCategory(this.isFood), (group: GroupInfo<ItemCategory,RecordItem>)=>{
        TabContent(){
          this.TabContentBuilder(group.items)
        }
        .tabBar(group.type.name)
      })
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height('100%')
    .barMode(BarMode.Scrollable)
  }
  @Builder TabContentBuilder(items: RecordItem[]){
    List({space: 10}){
      ForEach(items,(item: RecordItem)=>{
        ListItem(){
          Row({space: 6}){
            Image(item.image)
              .width(50)
            Column({space: 4}){
              Text(item.name).fontWeight(CommonConstants.FONT_WEIGHT_500)
              Text(`${item.calorie}千卡/${item.unit}`).fontSize(14).fontColor($r('app.color.light_gray'))
            }
            Blank()
            Image($r('app.media.ic_public_add_norm_filled'))
              .width(18)
              .fillColor($r('app.color.primary_color'))
          }
          .width('100%')
          .padding(CommonConstants.SPACE_6)
        }.onClick(()=>this.showPanel(item))
      })
    }
    .width('100%')
    .height('100%')
  }
}