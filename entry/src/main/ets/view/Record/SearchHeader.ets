@Component
export default struct SearchHeader{
  build(){
    Row({space: 6}){
      Search({placeholder: '搜索小熊猫饮食~'})
        .textFont({size: 18})
        .layoutWeight(1)
      Badge({count: 1, position: BadgePosition.RightTop, style:{fontSize: 9}}){
        Image($r('app.media.ic_public_email'))
          .width(24)
      }
    }
    .width('94%')
  }
}