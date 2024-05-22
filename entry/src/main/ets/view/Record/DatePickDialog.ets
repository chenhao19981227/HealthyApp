@CustomDialog
export struct DatePickDialog{
  controller: CustomDialogController
  selectedDate: Date=new Date()
  build(){
    Column({space: 12}){
      DatePicker({
        start: new Date('2021-01-01'),
        end: new Date,
        selected: this.selectedDate
      })
        .onChange((value: DatePickerResult)=>{
          this.selectedDate.setFullYear(value.year,value.month,value.day)
        })
      Row({space: 12}){
        Button('取消')
          .backgroundColor($r('app.color.light_gray'))
          .width(120)
          .onClick(()=>this.controller.close())
        Button('确定')
          .backgroundColor($r('app.color.primary_color'))
          .width(120)
          .onClick(()=>{
            AppStorage.SetOrCreate('selectedDate',this.selectedDate.getTime())
            this.controller.close()
          })
      }
    }
    .padding(12)
  }
}