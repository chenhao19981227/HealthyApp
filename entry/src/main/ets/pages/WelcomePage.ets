import UserPrivacyDialog from '../view/welcomeView/UserPrivacyDialog'
import common from '@ohos.app.ability.common'
import PreferenceUtil from '../common/utils/PreferenceUtil'
import router from '@ohos.router'

const PRE_KEY='userPrivacyKey'
@Entry
@Component
struct WelcomePage {
  context=getContext(this) as common.UIAbilityContext
  controller: CustomDialogController=new CustomDialogController({
    builder: UserPrivacyDialog({
      confirm: ()=> this.onConfirm(),
      cancel: ()=> this.exitApp()
    })
  })
  async aboutToAppear(){
    let isAgree=await PreferenceUtil.getPreferenceValue(PRE_KEY,false)
    if(isAgree){
      this.jumpToIndex()
    }else{
      this.controller.open()
    }
  }
  onConfirm(){
    PreferenceUtil.putPreferenceValue(PRE_KEY,true)
    this.jumpToIndex()
  }
  exitApp(){
    this.context.terminateSelf()
  }

  jumpToIndex(){
    setTimeout(()=>{
      router.replaceUrl({
        url: 'pages/Index'
      })
    },1000)
  }

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