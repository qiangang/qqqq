
import UIKit
import RongIMLibCore



public class AAA_PresentMessageContent_BBB: RCMessageContent, NSCoding {
    
    // FUNCMARK
    var kkk_giftName_lll: String!
    // FUNCMARK
    // FUNCMARK
    public var kkk_giftImage_lll: String!
    // FUNCMARK
    // FUNCMARK
    var kkk_giftAni_lll: String!
    // FUNCMARK
    // FUNCMARK
    public var kkk_giftCount_lll = 1
    // FUNCMARK
    // FUNCMARK
    
    
    
    required override init(){
        super.init()
    }
    // FUNCMARK
    // FUNCMARK
    public class func CCC_messageWithContent_DDD(_ giftName: String,_ giftImage: String, _ giftAnim: String, _ count : Int) -> AAA_PresentMessageContent_BBB {
        let kkk_message_lll = AAA_PresentMessageContent_BBB()
        kkk_message_lll.kkk_giftName_lll = giftName
        kkk_message_lll.kkk_giftImage_lll = giftImage
        kkk_message_lll.kkk_giftAni_lll = giftAnim
        kkk_message_lll.kkk_giftCount_lll = count
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
        self.kkk_giftName_lll = "\(coder.decodeObject(forKey: "giftName") ?? "")"
        self.kkk_giftImage_lll = "\(coder.decodeObject(forKey: "giftImage") ?? "")"
        self.kkk_giftAni_lll = "\(coder.decodeObject(forKey: "giftAnim") ?? "")"
        self.kkk_giftCount_lll = Int("\(coder.decodeObject(forKey: "count") ?? 1)")!
    }
    // FUNCMARK
    // FUNCMARK
    public func encode(with coder: NSCoder) {
        coder.encode(self.kkk_giftName_lll, forKey: "giftName")
        coder.encode(self.kkk_giftImage_lll, forKey: "giftImage")
        coder.encode(self.kkk_giftAni_lll, forKey: "giftAnim")
        coder.encode(self.kkk_giftCount_lll, forKey: "count")
    }
    // FUNCMARK
    // FUNCMARK
    public override func encode() -> Data {
        let kkk_dataDic_lll: NSMutableDictionary = NSMutableDictionary()
        kkk_dataDic_lll.setValue(self.kkk_giftName_lll, forKey: "giftName")
        kkk_dataDic_lll.setValue(self.kkk_giftImage_lll, forKey: "giftImage")
        kkk_dataDic_lll.setValue(self.kkk_giftAni_lll, forKey: "giftAnim")
        kkk_dataDic_lll.setValue(self.kkk_giftCount_lll, forKey: "count")
        
        return try! JSONSerialization.data(withJSONObject: kkk_dataDic_lll, options: .prettyPrinted)
    }
    // FUNCMARK
    // FUNCMARK
    public override func decode(with data: Data) {
        guard let kkk_dic_lll = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? NSDictionary else {
            return
        }
        self.kkk_giftName_lll = kkk_dic_lll["giftName"] as? String
        self.kkk_giftImage_lll = kkk_dic_lll["giftImage"] as? String
        self.kkk_giftAni_lll = kkk_dic_lll["giftAnim"] as? String
        self.kkk_giftCount_lll = kkk_dic_lll.CCC_keyInt_DDD("count")
        if self.kkk_giftCount_lll == 0 {
            self.kkk_giftCount_lll = 1
        }
    }
    // FUNCMARK
    // FUNCMARK
    public override func conversationDigest() -> String {
        return "[GIFT]"
    }
    // FUNCMARK
    // FUNCMARK
    public override class func getObjectName() -> String {
        return AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_appgiftStr_NNN")
    }
    // FUNCMARK
}

