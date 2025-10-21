//
//  AAA_inviteLiveModel_BBB.swift
//  Wohoo
//
//  Created by Frankie on 18/09/2024.
//

import UIKit
import RongIMLibCore

public class AAA_inviteLiveModel_BBB: RCMessageContent, NSCoding {
    
    // FUNCMARK
    public var kkk_roomId_lll: Int!
    // FUNCMARK
    // FUNCMARK
    public var kkk_type_lll: Int!
    // FUNCMARK
    // FUNCMARK
    public var kkk_avatar_lll: String!
    // FUNCMARK
    // FUNCMARK
    public var kkk_nickname_lll: String!
    // FUNCMARK
    // FUNCMARK
    public var kkk_pos_lll = 0
    
    public required override init(){
        super.init()
    }
    // FUNCMARK
    // FUNCMARK
    public class func CCC_messageWithType_DDD(_ room: Int,_ type: Int,_ avatar: String,_ name: String,_ pos: Int) -> AAA_inviteLiveModel_BBB {
        let kkk_message_lll = AAA_inviteLiveModel_BBB()
        kkk_message_lll.kkk_roomId_lll = room
        kkk_message_lll.kkk_avatar_lll = avatar
        kkk_message_lll.kkk_nickname_lll = name
        kkk_message_lll.kkk_type_lll = type
        kkk_message_lll.kkk_pos_lll = pos
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
        self.kkk_type_lll = (coder.decodeObject(forKey: "type") as! Int)
        self.kkk_avatar_lll = "\(coder.decodeObject(forKey: "avatar") ?? "")"
        self.kkk_nickname_lll = "\(coder.decodeObject(forKey: "nickname") ?? "")"
        self.kkk_pos_lll = Int("\(coder.decodeObject(forKey: "pos") ?? "0")")!
    }
    // FUNCMARK
    // FUNCMARK
    public func encode(with coder: NSCoder) {
        coder.encode(self.kkk_roomId_lll, forKey: "roomId")
        coder.encode(self.kkk_type_lll, forKey: "type")
        coder.encode(self.kkk_avatar_lll, forKey: "avatar")
        coder.encode(self.kkk_nickname_lll, forKey: "nickname")
        coder.encode(self.kkk_pos_lll, forKey: "pos")
    }
    // FUNCMARK
    // FUNCMARK
    public override func encode() -> Data {
        let kkk_dataDic_lll: NSMutableDictionary = NSMutableDictionary()
        kkk_dataDic_lll.setValue(self.kkk_roomId_lll, forKey: "roomId")
        kkk_dataDic_lll.setValue(self.kkk_type_lll, forKey: "type")
        kkk_dataDic_lll.setValue(self.kkk_avatar_lll, forKey: "avatar")
        kkk_dataDic_lll.setValue(self.kkk_nickname_lll, forKey: "nickname")
        kkk_dataDic_lll.setValue(self.kkk_pos_lll, forKey: "pos")
        
        return try! JSONSerialization.data(withJSONObject: kkk_dataDic_lll, options: .prettyPrinted)
    }
    // FUNCMARK
    // FUNCMARK
    public override func decode(with data: Data) {
        guard let kkk_dic_lll = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? NSDictionary else {
            return
        }
        self.kkk_roomId_lll = kkk_dic_lll.CCC_keyInt_DDD("roomId")
        self.kkk_type_lll = kkk_dic_lll.CCC_keyInt_DDD("type")
        self.kkk_avatar_lll = kkk_dic_lll["avatar"] as? String
        self.kkk_nickname_lll = kkk_dic_lll["nickname"] as? String
        self.kkk_pos_lll = kkk_dic_lll.CCC_keyInt_DDD("pos")
    }
    // FUNCMARK
    // FUNCMARK
    public override func conversationDigest() -> String {
        return  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_chatInvitestr_NNN")
    }
    // FUNCMARK
    // FUNCMARK
    public override class func getObjectName() -> String {
        return  AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_appchatroomStr_NNN")
    }
    // FUNCMARK
}
