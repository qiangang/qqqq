

import UIKit
import RongIMLibCore



public class AAA_SysMessageContent_BBB: RCMessageContent, NSCoding {
    
    // FUNCMARK
    public var kkk_type_lll: String!
    // FUNCMARK
    // FUNCMARK
    public var kkk_content_lll: String!
    // FUNCMARK
    // FUNCMARK
    var kkk_user_lll: String!
    // FUNCMARK
    
    // FUNCMARK
    required override init(){
        super.init()
    }
    // FUNCMARK
    // FUNCMARK
    class func CCC_messageWithType_DDD(_ type: String,_ content: String) -> AAA_SysMessageContent_BBB {
        let kkk_message_lll = AAA_SysMessageContent_BBB()
        kkk_message_lll.kkk_type_lll = type
        kkk_message_lll.kkk_content_lll = content
        return kkk_message_lll
    }
    // FUNCMARK
    // FUNCMARK
    public override class func persistentFlag() -> RCMessagePersistent {
        return RCMessagePersistent.MessagePersistent_NONE
    }
    // FUNCMARK
    // FUNCMARK
    required public init?(coder: NSCoder) {
        super.init()
        self.kkk_type_lll = "\(coder.decodeObject(forKey:  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_typeKey_NNN")) ?? "")"
        self.kkk_content_lll = "\(coder.decodeObject(forKey:  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_contentStr_NNN")) ?? "")"
        self.kkk_user_lll = "\(coder.decodeObject(forKey:  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_userKey_NNN")) ?? "")"
    }
    // FUNCMARK
    // FUNCMARK
    public func encode(with coder: NSCoder) {
        coder.encode(self.kkk_type_lll, forKey:  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_typeKey_NNN"))
        coder.encode(self.kkk_content_lll, forKey:  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_contentStr_NNN"))
    }
    // FUNCMARK
    // FUNCMARK
    public override func encode() -> Data {
        let kkk_dataDic_lll: NSMutableDictionary = NSMutableDictionary()
        kkk_dataDic_lll.setValue(self.kkk_type_lll, forKey:  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_typeKey_NNN"))
        kkk_dataDic_lll.setValue(self.kkk_content_lll, forKey:  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_contentStr_NNN"))
        return try! JSONSerialization.data(withJSONObject: kkk_dataDic_lll, options: .prettyPrinted)
    }
    // FUNCMARK
    // FUNCMARK
    public override func decode(with data: Data) {
        guard let kkk_dic_lll = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? NSDictionary else {
            return
        }
        self.kkk_type_lll = "\(kkk_dic_lll[ AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_typeKey_NNN")]!)"
        self.kkk_content_lll = kkk_dic_lll[ AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_contentStr_NNN")] as? String
        self.kkk_user_lll = kkk_dic_lll[ AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_userKey_NNN")] as? String
    }
    // FUNCMARK
    // FUNCMARK
    public override func conversationDigest() -> String {
        return ""
    }
    // FUNCMARK
    // FUNCMARK
    public override class func getObjectName() -> String {
        return  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_appPushStr_NNN")
    }
    // FUNCMARK
}
