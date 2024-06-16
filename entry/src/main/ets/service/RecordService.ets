import DateUtil from '../common/utils/DateUtil'
import ItemModel from '../model/ItemModel'
import RecordModel from '../model/RecordModel'
import { RecordTypeEnum, RecordTypes } from '../model/RecordTypeModel'
import GroupInfo from '../viemmodel/GroupInfo'
import RecordType from '../viemmodel/RecordType'
import RecordVO from '../viemmodel/RecordVO'
import StatsInfo from '../viemmodel/StatsInfo'
class RecordService {
  insert(typeId: number, itemId: number, amount: number): Promise<number>{
    let createTime = (AppStorage.Get('selectedDate') || DateUtil.beginTimeOfDay(new Date())) as number
    return RecordModel.insert({typeId, itemId, amount, createTime})
  }

  deleteById(id: number): Promise<number>{
    return RecordModel.deleteById(id)
  }
  async queryRecordByDate(date: number): Promise<RecordVO[]>{
    let rps = await RecordModel.listByDate(date)
    return rps.map(rp => {
      let rv = {id: rp.id, typeId: rp.typeId, amount: rp.amount} as RecordVO
      rv.recordItem = ItemModel.getById(rp.itemId, rp.typeId !== RecordTypeEnum.WORKOUT)
      rv.calorie = rp.amount * rv.recordItem.calorie
      return rv
    })
  }

  calculateStatsInfo(records: RecordVO[]): StatsInfo{
    let info = new StatsInfo()
    if(!records || records.length <= 0){
      return info
    }
    records.forEach(r => {
      if(r.typeId === RecordTypeEnum.WORKOUT){
        info.expend += r.calorie
      }else{
        info.intake += r.calorie
        info.carbon += r.recordItem.carbon
        info.protein += r.recordItem.protein
        info.fat += r.recordItem.fat
      }
    })
    return info
  }
  calculateGroupInfo(records: RecordVO[]): GroupInfo<RecordType, RecordVO>[]{
    let groups = RecordTypes.map(recordType => new GroupInfo(recordType, []))
    if(!records || records.length <= 0){
      return groups
    }
    records.forEach(record => {
      groups[record.typeId].items.push(record)
      groups[record.typeId].calorie += record.calorie
    })
    return groups
  }
}

let recordService = new RecordService()

export default recordService as RecordService