import { CommonConstants } from '../common/constants/CommonConstants'
import router from '@ohos.router'
import ItemList from '../view/Item/ItemList'
@Entry
@Component
struct ItemIndex {
  @State message: string = 'Hello World'
  @State showPanel: boolean = false
  onPanelShow(){
    this.showPanel = true
  }
  build() {
    Column(){
      this.Header()
      ItemList({showPanel: this.onPanelShow.bind(this)})
      .layoutWeight(1)
      Panel(this.showPanel){
        Button('关闭').onClick(()=>this.showPanel=false)
      }
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