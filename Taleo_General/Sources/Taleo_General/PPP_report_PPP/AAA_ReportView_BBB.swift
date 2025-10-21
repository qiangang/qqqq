//
//  AAA_ReportView_BBB.swift
//  Viddi
//
//  Created by Frankie on 2024/2/27.
//

import UIKit
import Package_net

class AAA_ReportView_BBB: AAA_baseView_BBB, UITextViewDelegate {
    
    
    // FUNCMARK
//    @IBOutlet weak var kkk_reportView_lll: UIView!
    // FUNCMARK
    // FUNCMARK
    @IBOutlet weak var kkk_tipsLabel_lll: UILabel!
    // FUNCMARK
    // FUNCMARK
    @IBOutlet weak var kkk_titleView_lll: UITextView!
    // FUNCMARK
    // FUNCMARK
    @IBOutlet weak var kkk_confirmBtn_lll: UIButton!
    // FUNCMARK
    // FUNCMARK
    @IBOutlet weak var kkk_inputsView_lll: UIView!
    // FUNCMARK
    // FUNCMARK
    @IBOutlet weak var kkk_titleLabel_lll: UILabel!
    // FUNCMARK
    // FUNCMARK
    var kkk_reportId_lll = 0
    // FUNCMARK
    // FUNCMARK
    var kkk_isBlock_lll:Int  = 1
    // FUNCMARK
    // FUNCMARK
    
//    var kkk_layers_lll : CAGradientLayer!
    
    // FUNCMARK
    // FUNCMARK
    var kkk_dics_lll : NSDictionary! {
        didSet {
            CCC_setAnchorInfo_DDD()
        }
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_info_DDD(_ uid : Int, _ type : Int, _ white : Bool) {
//        kkk_titleView_lll.tintColor = .black
        let kkk_dic_lll = NSMutableDictionary()
        kkk_dic_lll.setObject(type, forKey: "kkk_type_lll" as NSCopying)
        kkk_dic_lll.setObject(String(format: "%d", uid), forKey: "kkk_uid_lll" as NSCopying)
        self.kkk_dics_lll = kkk_dic_lll
        if white == true {
            kkk_reportView_lll.backgroundColor = .clear
//            kkk_inputsView_lll.backgroundColor = AAA_GeneralOutModel_BBB.CCC_color_DDD("color_F5F5F5_color")
//            kkk_tipsLabel_lll.textColor = AAA_GeneralOutModel_BBB.CCC_color_DDD("color_A6A6A6_color")
//            kkk_titleView_lll.textColor = .black
            kkk_confirmBtn_lll.backgroundColor = AAA_GeneralOutModel_BBB.CCC_color_DDD("color_D9D9D9_color")
        }else {
             kkk_reportView_lll.backgroundColor = .clear
//            kkk_inputsView_lll.backgroundColor = AAA_GeneralOutModel_BBB.CCC_color_DDD("color_2F2F2F_color")
//            kkk_tipsLabel_lll.textColor = AAA_GeneralOutModel_BBB.CCC_color_DDD("color_A1A1A1_color")
//            kkk_titleView_lll.textColor = .white
            kkk_confirmBtn_lll.backgroundColor = AAA_GeneralOutModel_BBB.CCC_color_DDD("color_7A7B7D_color")
        }
    }
    // FUNCMARK
    // FUNCMARK
    
    
    func CCC_setAnchorInfo_DDD() {
        kkk_titleView_lll.text = ""
        kkk_confirmBtn_lll.isSelected = false
//        kkk_inputsView_lll.layer.borderColor = UIColor.clear.cgColor
    }
    // FUNCMARK
    // FUNCMARK
    
    override func awakeFromNib() {
        super.awakeFromNib()
        kkk_type_lll = 4
        kkk_titleLabel_lll.text = AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_report_NNN")
        kkk_tipsLabel_lll.text = AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_reportTip_NNN")
        kkk_confirmBtn_lll.setTitle(AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_submit_NNN"), for: .normal)
        
        CCC_addSysNoty_DDD(#selector(CCC_inputValueChanges_DDD), UITextView.textDidChangeNotification)
        CCC_addSysNoty_DDD(#selector(CCC_hideBoard_DDD(_ :)), UIResponder.keyboardWillHideNotification)
        CCC_addSysNoty_DDD(#selector(CCC_showBoard_DDD(_ :)), UIResponder.keyboardWillShowNotification)
//        kkk_layers_lll = kkk_confirmBtn_lll.CCC_layers_DDD(true, 22, [AAA_GeneralOutModel_BBB.CCC_string_DDD("color_74FE7B_color"), AAA_GeneralOutModel_BBB.CCC_string_DDD("color_D3F366_color")])
    }
    // FUNCMARK
    // FUNCMARK
    override func CCC_show_DDD(_ view: UIView) {
        super.CCC_show_DDD(view)
        CCC_inputValueChanges_DDD()
    }
    // FUNCMARK
    // FUNCMARK
    
    @IBAction func CCC_closeReportView_DDD(_ sender: Any) {
        CCC_hide_DDD()
    }
    // FUNCMARK
    // FUNCMARK
    
    @IBAction func CCC_submitReports_DDD(_ sender: Any) {
        if kkk_titleView_lll.text.count > 4 {
//            kkk_inputsView_lll.layer.borderColor = UIColor.clear.cgColor
            let kkk_dic_lll = NSMutableDictionary()
            kkk_dic_lll.setObject(kkk_dics_lll.CCC_keyStr_DDD("kkk_uid_lll"), forKey: kkk_target_idStr_lll as NSCopying)
            kkk_dic_lll.setObject(kkk_dics_lll.CCC_keyInt_DDD("kkk_type_lll"), forKey: kkk_qtarget_type_lll as NSCopying)
            kkk_dic_lll.setObject(kkk_titleView_lll.text as Any, forKey: kkk_contentStr_lll as NSCopying)
            kkk_dic_lll.setObject([kkk_reportId_lll].CCC_toJson_DDD(), forKey: kkk_reasonStr_lll as NSCopying)
            AAA_WaitView_BBB.kkk_share_lll.CCC_show_DDD()
            kkk_server_lll.CCC_reportData_DDD(kkk_dic_lll) { [weak self] in
                guard let self = self else {return}
                if self.kkk_isBlock_lll == 2 {
                    AAA_notyCenterModel_BBB.CCC_reportNoty_DDD(self.kkk_dics_lll.CCC_keyStr_DDD("kkk_uid_lll"), kkk_target_idStr_lll)
                    self.CCC_hide_DDD()
                    return
                }
                AAA_notyCenterModel_BBB.CCC_reportNoty_DDD(self.kkk_dics_lll.CCC_keyStr_DDD("kkk_uid_lll"), kkk_target_idStr_lll)
                AAA_ReportView_BBB.CCC_removeVoiceRoomControl_DDD()
                self.CCC_hide_DDD()
            } _ : { msg in
                AAA_WaitView_BBB.kkk_share_lll.CCC_show_DDD(msg)
            }
        }else{
//            kkk_inputsView_lll.layer.borderColor = AAA_GeneralOutModel_BBB.CCC_cgColor_DDD("color_EC2C28_color")
            AAA_GeneralOutModel_BBB.CCC_showTitle_DDD("MMM_createRoomTitleShortFive_NNN")
        }
    }
    // FUNCMARK
    // FUNCMARK
    
    @objc func CCC_inputValueChanges_DDD() {
//        kkk_inputsView_lll.layer.borderColor = UIColor.clear.cgColor
        if kkk_titleView_lll.text.count > 0 {
            kkk_tipsLabel_lll.isHidden = true
        }else{
            kkk_tipsLabel_lll.isHidden = false
        }
        if kkk_titleView_lll.text.count > 4 {
            kkk_confirmBtn_lll.isSelected = true
            kkk_confirmBtn_lll.setTitleColor(.white, for: .normal)
//            kkk_confirmBtn_lll.layer.insertSublayer(kkk_layers_lll, at: 0)
            self.kkk_confirmBtn_lll.backgroundColor = CCC_colors_DDD("CD873C")
        }else{
            kkk_confirmBtn_lll.isSelected = false
            kkk_confirmBtn_lll.setTitleColor(.white, for: .normal)
//            kkk_layers_lll.removeFromSuperlayer()
            kkk_confirmBtn_lll.backgroundColor = CCC_colors_DDD("F7BF49")
        }
        if kkk_titleView_lll.text.count > 50 {
            kkk_titleView_lll.text = kkk_titleView_lll.text!.CCC_substring_DDD(start: 0, 50)
        }
    }
    // FUNCMARK
    // FUNCMARK
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        kkk_Window_lll!.endEditing(true)
    }
    // FUNCMARK
    // FUNCMARK
    // 监听键盘
    @objc func CCC_showBoard_DDD(_ notifi : Notification) {
        let kkk_duration_lll = notifi.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        let kkk_keyboardFrame_lll = notifi.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        let kkk_keyboardHei_lll = (kkk_keyboardFrame_lll?.size.height)!
        UIView.animate(withDuration: kkk_duration_lll ?? 0.0) { [weak self] in
            guard let self = self else {return}
            self.kkk_showView_lll.y = kkk_HEIGHT_lll - kkk_keyboardHei_lll - self.kkk_inputsView_lll.bottom - 10
        }
    }
    // FUNCMARK
    // FUNCMARK
    @objc func CCC_hideBoard_DDD(_ notifi : Notification) {
        let kkk_duration_lll = notifi.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        UIView.animate(withDuration: kkk_duration_lll ?? 0.0) { [weak self] in
            guard let self = self else {return}
            self.kkk_showView_lll.y = kkk_HEIGHT_lll - self.kkk_showView_lll.height
        }
    }
    // FUNCMARK
    
    //举报后移除控制器
    class func CCC_removeVoiceRoomControl_DDD() {
        CCC_removeLiveRoomControl_DDD()
    }
    class func CCC_removeLiveRoomControl_DDD() {
        selfs.navigationController?.popViewController(animated: true)
//        let kkk_rootView_lll = kkk_Window_lll?.rootViewController as? UITabBarController
////        let kkk_navi_lll = kkk_rootView_lll?.selectedViewController as? UINavigationController
//        let kkk_navi_lll = selfs.navigationController
//        if kkk_navi_lll == nil {
//            return
//        }
//        let kkk_controlArray_lll = NSMutableArray(array: kkk_navi_lll!.viewControllers)
//        let kkk_classd_lll = kkk_controlArray_lll.lastObject as! UIViewController
//        let kkk_classNames_lll = String(describing: type(of: kkk_classd_lll.self))
//        if kkk_classNames_lll == "AAA_ChatController_BBB" {
//            kkk_navi_lll?.popViewController(animated: true)
//        }else if kkk_classNames_lll == "AAA_AnchorsDetailController_BBB" {
//            kkk_navi_lll?.popViewController(animated: true)
//        }else if kkk_classNames_lll == "AAA_VideoShowController_BBB" {
//            kkk_navi_lll?.popViewController(animated: true)
//        }
        
    }
    
}
