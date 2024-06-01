import mediaquery from '@ohos.mediaquery'
import BreakpointConstants from '../constants/BreakpointConstants'
export default class BreakpointSystem{
  private smListener: mediaquery.MediaQueryListener = mediaquery.matchMediaSync(BreakpointConstants.RANGE_SM)
  private mdListener: mediaquery.MediaQueryListener = mediaquery.matchMediaSync(BreakpointConstants.RANGE_MD)
  private lgListener: mediaquery.MediaQueryListener = mediaquery.matchMediaSync(BreakpointConstants.RANGE_LG)

  smListenerCallback(result: mediaquery.MediaQueryResult){
    if(result.matches){
      this.updateCurrentBreakpoint(BreakpointConstants.BREAKPOINT_SM)
    }
  }
  mdListenerCallback(result: mediaquery.MediaQueryResult){
    if(result.matches){
      this.updateCurrentBreakpoint(BreakpointConstants.BREAKPOINT_MD)
    }
  }
  lgListenerCallback(result: mediaquery.MediaQueryResult){
    if(result.matches){
      this.updateCurrentBreakpoint(BreakpointConstants.BREAKPOINT_LG)
    }
  }
  updateCurrentBreakpoint(breakpoint: string){
    AppStorage.SetOrCreate(BreakpointConstants.CURRENT_BREAKPOINT,breakpoint)
  }

  register(){
    this.smListener.on('change',this.smListenerCallback.bind(this))
    this.mdListener.on('change',this.mdListenerCallback.bind(this))
    this.lgListener.on('change',this.lgListenerCallback.bind(this))
  }

  unRegister(){
    this.smListener.off('change',this.smListenerCallback.bind(this))
    this.mdListener.off('change',this.mdListenerCallback.bind(this))
    this.lgListener.off('change',this.lgListenerCallback.bind(this))
  }
}