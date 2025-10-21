//
//  AAA_inviteLiveModel_BBB.swift
//  Wohoo
//
//  Created by Frankie on 18/09/2024.
//

import UIKit
import RongIMLibCore

public class AAA_inviteTransferModel_BBB: RCMessageContent, NSCoding {

    // FUNCMARK
    public var kkk_content_lll: String!
    // FUNCMARK
    
    // FUNCMARK
    required override init(){
        super.init()
    }
    // FUNCMARK
    // FUNCMARK
    class func CCC_messageWithType_DDD(_ content: String) -> AAA_inviteTransferModel_BBB {
        let kkk_message_lll = AAA_inviteTransferModel_BBB()
        kkk_message_lll.kkk_content_lll = content
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
        
        self.kkk_content_lll = "\(coder.decodeObject(forKey: "content") ?? "")"
    }
    // FUNCMARK
    // FUNCMARK
    public func encode(with coder: NSCoder) {
        coder.encode(self.kkk_content_lll, forKey: "content")
    }
    // FUNCMARK
    // FUNCMARK
    public override func encode() -> Data {
        let kkk_dataDic_lll: NSMutableDictionary = NSMutableDictionary()
        
        kkk_dataDic_lll.setValue(self.kkk_content_lll, forKey: "content")
        
        return try! JSONSerialization.data(withJSONObject: kkk_dataDic_lll, options: .prettyPrinted)
    }
    // FUNCMARK
    // FUNCMARK
    public override func decode(with data: Data) {
        guard let kkk_dic_lll = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? NSDictionary else {
            return
        }
        self.kkk_content_lll = kkk_dic_lll["content"] as? String
    }
    // FUNCMARK
    // FUNCMARK
    public override func conversationDigest() -> String {
        return  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_giveAwayStr_NNN")
    }
    // FUNCMARK
    // FUNCMARK
    public override class func getObjectName() -> String {
        return  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_transferStr_NNN")
    }
    // FUNCMARK
}
