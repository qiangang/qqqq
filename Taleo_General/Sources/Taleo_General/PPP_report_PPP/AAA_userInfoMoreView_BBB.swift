//
//  AAA_userInfoMoreView_BBB.swift
//  Wohoo
//
//  Created by Frankie on 12/09/2024.
//

import UIKit
import Package_net

class AAA_userInfoMoreView_BBB: AAA_baseView_BBB {

    // FUNCMARK
    @IBOutlet weak var kkk_backView_lll: UIView!
    // FUNCMARK
    // FUNCMARK
    @IBOutlet weak var kkk_reportBtn_lll: UIButton!
    // FUNCMARK
    // FUNCMARK
    @IBOutlet weak var kkk_blockBtn_lll: UIButton!
    // FUNCMARK
    // FUNCMARK
    @IBOutlet weak var kkk_userInfoView_lll: UIView!
    // FUNCMARK
    // FUNCMARK
    @IBOutlet weak var kkk_userHeadView_lll: UIImageView!
    // FUNCMARK
    // FUNCMARK
    @IBOutlet weak var kkk_userNameLabel_lll: UILabel!
    // FUNCMARK
    // FUNCMARK
    @IBOutlet weak var kkk_userIdLabel_lll: UILabel!
    // FUNCMARK
    // FUNCMARK
    @IBOutlet weak var kkk_userHriConstrain_lll: NSLayoutConstraint!
    // FUNCMARK
    // FUNCMARK
    
    var kkk_model_lll : AAA_reportUserModel_BBB!
    // FUNCMARK
    // FUNCMARK
    var kkk_types_lll = 1
    // FUNCMARK
    // FUNCMARK
    var kkk_room_lll = -1
    // FUNCMARK
    // FUNCMARK
    var kkk_white_lll = false
    // FUNCMARK
    // FUNCMARK
    
    
    func CCC_info_DDD(_ rooms : Int, _ avatar : String, _ name : String, _ uid : Int, _ user_no : String, _ type : Int, _ block : Bool, _ whites : Bool) {
        kkk_white_lll = whites
        kkk_types_lll = type
        kkk_room_lll = rooms
        if kkk_model_lll == nil {
            kkk_model_lll = AAA_reportUserModel_BBB()
        }
        kkk_model_lll.kkk_id_lll = rooms
        kkk_model_lll.kkk_uid_lll = String(format: "%d", uid)
        kkk_model_lll.kkk_avatar_lll = avatar
        kkk_model_lll.kkk_nickname_lll = name
        kkk_model_lll.kkk_user_no_lll = user_no
        CCC_stateChange_DDD(block)
//        if whites == true {
            self.kkk_type_lll = 4
        kkk_backView_lll.backgroundColor = CCC_colors_DDD("FFDCA3")
            kkk_reportBtn_lll.backgroundColor = CCC_colors_DDD("FFFAE6")
        kkk_blockBtn_lll.backgroundColor = CCC_colors_DDD("FFFAE6")
      
        kkk_reportBtn_lll.setTitleColor(CCC_colors_DDD("F7BF49"), for: .normal)
        kkk_reportBtn_lll.layer.borderWidth = 2
        kkk_reportBtn_lll.layer.borderColor = CCC_colors_DDD("F7BF49").cgColor

        
        kkk_blockBtn_lll.setTitleColor(CCC_colors_DDD("F7BF49"), for: .normal)
        kkk_blockBtn_lll.layer.borderWidth = 2
        kkk_blockBtn_lll.layer.borderColor = CCC_colors_DDD("F7BF49").cgColor
        kkk_userHriConstrain_lll.constant = 0
//        }else{
//            self.kkk_type_lll = 4
//            kkk_backView_lll.backgroundColor = .black
//            kkk_reportBtn_lll.backgroundColor = AAA_GeneralOutModel_BBB.CCC_color_DDD("color_2F2F2F_color")
//            kkk_blockBtn_lll.backgroundColor = AAA_GeneralOutModel_BBB.CCC_color_DDD("color_2F2F2F_color")
//            kkk_reportBtn_lll.setTitleColor(AAA_GeneralOutModel_BBB.CCC_color_DDD("color_A1A1A1_color"), for: .normal)
//            kkk_blockBtn_lll.setTitleColor(AAA_GeneralOutModel_BBB.CCC_color_DDD("color_A1A1A1_color"), for: .normal)
//            kkk_userHeadView_lll.CCC_avatar_DDD(avatar)
//            kkk_userNameLabel_lll.text = name
//            kkk_userIdLabel_lll.text = user_no
//            kkk_userHriConstrain_lll.constant = 77
//        }
        kkk_userInfoView_lll.isHidden = whites
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_stateChange_DDD(_ block : Bool) {
        if block == true {
            kkk_blockBtn_lll.setTitle(AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_unblock_NNN"), for: .normal)
        }else {
            kkk_blockBtn_lll.setTitle(AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_block_NNN"), for: .normal)
        }
    }
    // FUNCMARK
    // FUNCMARK
    
    override func awakeFromNib() {
        super.awakeFromNib()
        kkk_type_lll = 4
        kkk_reportBtn_lll.setTitle(AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_report_NNN"), for: .normal)
        kkk_blockBtn_lll.setTitle(AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_block_NNN"), for: .normal)
    }
    // FUNCMARK
    // FUNCMARK
    @IBAction func CCC_copyUserId_DDD(_ sender: Any) {
        let kkk_past_lll = UIPasteboard.general
        kkk_past_lll.string = kkk_model_lll.kkk_user_no_lll
        AAA_GeneralOutModel_BBB.CCC_showTitle_DDD("MMM_SuccessStr_NNN")
    }
    // FUNCMARK
    // FUNCMARK
    //显示举报
    @IBAction func CCC_reportSender_DDD(_ sender: Any) {
        var kkk_ids_lll = kkk_model_lll.kkk_id_lll
        if kkk_types_lll == 1 {
            kkk_ids_lll = Int(kkk_model_lll.kkk_uid_lll)!
        }
        CCC_showReportListView_DDD(kkk_room_lll, kkk_model_lll.kkk_avatar_lll, kkk_model_lll.kkk_nickname_lll, kkk_ids_lll, kkk_model_lll.kkk_user_no_lll, kkk_types_lll, kkk_white_lll)
    }
    // FUNCMARK
    // FUNCMARK
    //拉黑
    @IBAction func CCC_blockSender_DDD(_ sender: Any) {
        let kkk_dic_lll = NSMutableDictionary()
        kkk_dic_lll.setObject(Int(kkk_model_lll.kkk_uid_lll) as Any, forKey: kkk_user_idStr_lll as NSCopying)
        AAA_WaitView_BBB.kkk_share_lll.CCC_show_DDD()
        if kkk_model_lll.kkk_round_id_lll > 0 {
            kkk_dic_lll.setObject(kkk_model_lll.kkk_id_lll, forKey: kkk_allRoomIDStr_lll as NSCopying)
        }
        kkk_server_lll.CCC_blockUser_DDD(kkk_dic_lll) { [weak self] dic in
            guard let self = self else {return}
            let kkk_isBlock_lll = dic[kkk_blockedStr_lll] as! Bool
            (sender as! UIButton).isSelected = kkk_isBlock_lll
            AAA_GeneralOutModel_BBB.CCC_showTitle_DDD("MMM_SuccessStr_NNN")
            self.CCC_stateChange_DDD(kkk_isBlock_lll)
            if kkk_model_lll.kkk_round_id_lll > 0 {
                AAA_notyCenterModel_BBB.CCC_blockNoty_DDD(Int(self.kkk_model_lll.kkk_id_lll), kkk_isBlock_lll)
            }else {
                AAA_notyCenterModel_BBB.CCC_blockNoty_DDD(Int(self.kkk_model_lll.kkk_uid_lll)!, kkk_isBlock_lll)
            }
            AAA_ReportView_BBB.CCC_removeVoiceRoomControl_DDD()
            self.CCC_hide_DDD()
        } _: { string in
            AAA_WaitView_BBB.kkk_share_lll.CCC_show_DDD(string)
        }
    }
    // FUNCMARK
    // FUNCMARK
    @IBAction func CCC_closeMoreView_DDD(_ sender: Any) {
        CCC_hide_DDD()
    }
    // FUNCMARK
}
