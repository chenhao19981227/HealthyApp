@Entry
@Component
struct WelcomePage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Stack(){
        Row(){
          Image($r('app.media.little_panda'))
            .width('100%')
            .height('100%')
        }
        Row(){
          Text('小熊猫健康App')
            .fontSize(25)
            .fontColor(Color.White)
            .padding(3)
        }
        .alignItems(VerticalAlign.Bottom)
        .padding({bottom: 20})
        .height('100%')
      }
    }
    .height('100%')
    .width('100%')
  }
}