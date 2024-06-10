import { CommonConstants } from '../common/constants/CommonConstants'
import router from '@ohos.router'
import ItemList from '../view/Item/ItemList'
import ItemPanelHeader from '../view/Item/ItemPanelHeader'
import ItemCard from '../view/Item/ItemCard'
import NumberKeyboard from '../view/Item/NumberKeyboard'
import RecordItem from '../viemmodel/RecordItem'
@Entry
@Component
struct ItemIndex {
  @State message: string = 'Hello World'
  @State showPanel: boolean = false
  @State value: string= ''
  @State amount: number =1
  @State item: RecordItem=null
  onPanelShow(item: RecordItem){
    this.showPanel = true
    this.amount=1
    this.value=''
    this.item=item
  }
  build() {
    Column(){
      this.Header()
      ItemList({showPanel: this.onPanelShow.bind(this)})
      .layoutWeight(1)
      Panel(this.showPanel){
        ItemPanelHeader()
        if(this.item){
          ItemCard({amount: this.amount, item: $item})
        }
        NumberKeyboard({amount: $amount,value: $value})
        Row({space: CommonConstants.SPACE_6}){
          Button('取消')
            .width(120)
            .backgroundColor($r('app.color.light_gray'))
            .type(ButtonType.Normal)
            .borderRadius(6)
            .onClick(()=>this.showPanel=false)
          Button('提交')
            .width(120)
            .backgroundColor($r('app.color.primary_color'))
            .type(ButtonType.Normal)
            .borderRadius(6)
            .onClick(()=>this.showPanel=false)
        }
        .margin({top: 10})
      }
      .mode(PanelMode.Full)
      .dragBar(false)
      .backgroundColor(Color.White)
      .backgroundMask($r('app.color.light_gray'))
    }
    .width('100%')
    .height('100%')
  }

  @Builder Header(){
    Row(){
      Image($r('app.media.ic_public_back'))
        .width(24)
        .onClick(()=>router.back())
      Blank()
      Text('早餐').fontSize(18).fontWeight(CommonConstants.FONT_WEIGHT_600)
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height(32)
  }
}