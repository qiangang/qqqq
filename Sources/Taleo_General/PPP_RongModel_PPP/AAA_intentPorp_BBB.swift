//
//  AAA_intentPorp_BBB.swift
//  Wohoo
//
//  Created by Ben on 10/10/2024.
//AAA_inviteLiveModel_BBB

import UIKit
import RongIMLibCore

public class AAA_intentPorp_BBB: RCMessageContent, NSCoding {
    
    // FUNCMARK
    public var kkk_type_lll: Int!
    // FUNCMARK
    // FUNCMARK
    public var kkk_url_lll: String!
    // FUNCMARK
    
    // FUNCMARK
    public required override init(){
        super.init()
    }
    // FUNCMARK
    // FUNCMARK
    public class func CCC_messageWithType_DDD(_ type: Int,_ url: String) -> AAA_intentPorp_BBB {
        let kkk_message_lll = AAA_intentPorp_BBB()
        kkk_message_lll.kkk_type_lll = type
        kkk_message_lll.kkk_url_lll = url
        return kkk_message_lll
    }
    // FUNCMARK
    // FUNCMARK
    public override class func persistentFlag() -> RCMessagePersistent {
        return RCMessagePersistent.MessagePersistent_ISCOUNTED
    }
    // FUNCMARK
    // FUNCMARK
    //消息解析，不能加Y
    public required init?(coder: NSCoder) {
        super.init()
        self.kkk_type_lll = (coder.decodeObject(forKey: "type") as! Int)
        self.kkk_url_lll = "\(coder.decodeObject(forKey: "url") ?? "")"
    }
    // FUNCMARK
    // FUNCMARK
    public func encode(with coder: NSCoder) {
        coder.encode(self.kkk_type_lll, forKey: "type")
        coder.encode(self.kkk_url_lll, forKey: "url")
    }
    // FUNCMARK
    // FUNCMARK
    public override func encode() -> Data {
        let kkk_dataDic_lll: NSMutableDictionary = NSMutableDictionary()
        kkk_dataDic_lll.setValue(self.kkk_type_lll, forKey: "type")
        kkk_dataDic_lll.setValue(self.kkk_url_lll, forKey: "url")
        
        return try! JSONSerialization.data(withJSONObject: kkk_dataDic_lll, options: .prettyPrinted)
    }
    // FUNCMARK
    // FUNCMARK
    public override func decode(with data: Data) {
        guard let kkk_dic_lll = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? NSDictionary else {
            return
        }
        self.kkk_type_lll = kkk_dic_lll.CCC_keyInt_DDD("type")
        self.kkk_url_lll = kkk_dic_lll["url"] as? String
    }
    // FUNCMARK
    // FUNCMARK
    public override func conversationDigest() -> String {
        return  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_appPropStr_NNN")
    }
    // FUNCMARK
    // FUNCMARK
    public override class func getObjectName() -> String {
        return  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_appPropStr_NNN")
    }
    // FUNCMARK
}
