//
//  AAA_inviteTypeLiveModel_BBB.swift
//  Wohoo
//
//  Created by Frankie on 18/09/2024.
//

import UIKit
import RongIMLibCore

public class AAA_inviteTypeLiveModel_BBB: RCMessageContent, NSCoding {
    
    // FUNCMARK
    public var kkk_roomId_lll: Int!
    // FUNCMARK
    // FUNCMARK
    public var kkk_type_lll: Int = 16
    // FUNCMARK
    // FUNCMARK
    public var kkk_avatar_lll: String!
    // FUNCMARK
    // FUNCMARK
    public var kkk_nickname_lll: String!
    // FUNCMARK
    // FUNCMARK
    
    public required override init(){
        super.init()
    }
    // FUNCMARK
    // FUNCMARK
    class func CCC_messageWithType_DDD(_ room: Int,_ avatar: String,_ name: String) -> AAA_inviteLiveModel_BBB {
        let kkk_message_lll = AAA_inviteLiveModel_BBB()
        kkk_message_lll.kkk_roomId_lll = room
        kkk_message_lll.kkk_avatar_lll = avatar
        kkk_message_lll.kkk_nickname_lll = name
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
        self.kkk_roomId_lll = (coder.decodeObject(forKey: "roomId") as! Int)
        self.kkk_avatar_lll = "\(coder.decodeObject(forKey: "avatar") ?? "")"
        self.kkk_nickname_lll = "\(coder.decodeObject(forKey: "nickname") ?? "")"
    }
    // FUNCMARK
    // FUNCMARK
    public func encode(with coder: NSCoder) {
        coder.encode(self.kkk_roomId_lll, forKey: "roomId")
        coder.encode(self.kkk_avatar_lll, forKey: "avatar")
        coder.encode(self.kkk_nickname_lll, forKey: "nickname")
    }
    // FUNCMARK
    // FUNCMARK
    public override func encode() -> Data {
        let kkk_dataDic_lll: NSMutableDictionary = NSMutableDictionary()
        kkk_dataDic_lll.setValue(self.kkk_roomId_lll, forKey: "roomId")
        kkk_dataDic_lll.setValue(self.kkk_avatar_lll, forKey: "avatar")
        kkk_dataDic_lll.setValue(self.kkk_nickname_lll, forKey: "nickname")
        
        return try! JSONSerialization.data(withJSONObject: kkk_dataDic_lll, options: .prettyPrinted)
    }
    // FUNCMARK
    // FUNCMARK
    public override func decode(with data: Data) {
        guard let kkk_dic_lll = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? NSDictionary else {
            return
        }
        self.kkk_roomId_lll = kkk_dic_lll.CCC_keyInt_DDD("roomId")
        self.kkk_avatar_lll = kkk_dic_lll["avatar"] as? String
        self.kkk_nickname_lll = kkk_dic_lll["nickname"] as? String
    }
    // FUNCMARK
    // FUNCMARK
    public override func conversationDigest() -> String {
        return  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_liveInvitestr_NNN")
    }
    // FUNCMARK
    // FUNCMARK
    public override class func getObjectName() -> String {
        return  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_appLiceStr_NNN")
    }
    // FUNCMARK
}
