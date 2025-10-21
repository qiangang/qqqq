

import UIKit
import RongIMLibCore


public class AAA_CallingResultContent_BBB: RCMessageContent, NSCoding {
    
    // FUNCMARK
    public var kkk_callType_lll: Int!
    // FUNCMARK
    // FUNCMARK
    public var kkk_callState_lll: Int!
    // FUNCMARK
    // FUNCMARK
    public var kkk_callTime_lll: Int!
    // FUNCMARK
    
    // FUNCMARK
    required override init(){
        super.init()
    }
    // FUNCMARK
    // FUNCMARK
    class func CCC_messageWithType_DDD(_ callType: Int,_ callState: Int, _ callTime: Int) -> AAA_CallingResultContent_BBB {
        let kkk_message_lll = AAA_CallingResultContent_BBB()
        kkk_message_lll.kkk_callType_lll = callType
        kkk_message_lll.kkk_callState_lll = callState
        kkk_message_lll.kkk_callTime_lll = callTime
        return kkk_message_lll
    }
    // FUNCMARK
    // FUNCMARK
    public override class func persistentFlag() -> RCMessagePersistent {
        return RCMessagePersistent.MessagePersistent_ISCOUNTED
    }
    // FUNCMARK
    // FUNCMARK
    public required init?(coder: NSCoder) {
        super.init()
        kkk_callType_lll = coder.decodeObject(forKey: "callType") as? Int
        kkk_callState_lll = coder.decodeObject(forKey: "callState") as? Int
        kkk_callTime_lll = coder.decodeObject(forKey: "callTime") as? Int
    }
    // FUNCMARK
    // FUNCMARK
    public func encode(with coder: NSCoder) {
        coder.encode(kkk_callType_lll, forKey: "callType")
        coder.encode(kkk_callState_lll, forKey: "callState")
        coder.encode(kkk_callTime_lll, forKey: "callTime")
    }
    // FUNCMARK
    // FUNCMARK
    public override func encode() -> Data {
        let kkk_dataDic_lll: NSMutableDictionary = NSMutableDictionary()
        kkk_dataDic_lll.setValue(kkk_callType_lll, forKey: "callType")
        kkk_dataDic_lll.setValue(kkk_callState_lll, forKey: "callState")
        kkk_dataDic_lll.setValue(kkk_callTime_lll, forKey: "callTime")
        
        return try! JSONSerialization.data(withJSONObject: kkk_dataDic_lll, options: .prettyPrinted)
    }
    // FUNCMARK
    // FUNCMARK
    public override func decode(with data: Data) {
        guard let kkk_dic_lll = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? NSDictionary else {
            return
        }
        kkk_callType_lll = kkk_dic_lll["callType"] as? Int
        kkk_callState_lll = kkk_dic_lll["callState"] as? Int
        kkk_callTime_lll = kkk_dic_lll["callTime"] as? Int
    }
    // FUNCMARK
    // FUNCMARK
    public override func conversationDigest() -> String {
        return AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_rccCallVideoType_NNN")
    }
    // FUNCMARK
    // FUNCMARK
    public override class func getObjectName() -> String {
        return  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_appcallStr_NNN")
    }
    // FUNCMARK
}
