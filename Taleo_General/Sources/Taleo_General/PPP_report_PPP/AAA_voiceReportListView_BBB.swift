//
//  AAA_voiceReportListView_BBB.swift
//  Wohoo
//
//  Created by Frankie on 12/09/2024.
//

import UIKit
import Package_net

import SnapKit


class AAA_voiceReportListView_BBB: AAA_showListView_BBB {
   
    var kkk_userinfo_lll : AAA_userInfoView_BBB!
    
    // FUNCMARK
    var kkk_dics_lll : NSDictionary!
    var kkk_list_lll = NSArray()
    // FUNCMARK
    // FUNCMARK
    var kkk_select_lll = 0
    // FUNCMARK
    // FUNCMARK
    
    var kkk_types_lll = -1
    // FUNCMARK
    // FUNCMARK
    var kkk_isReportRoom_lll = false
    // FUNCMARK
    // FUNCMARK
    var kkk_white_lll = true
    // FUNCMARK
    // FUNCMARK
    let kkk_confirmBtn_lll = UIButton()
    // FUNCMARK
    // FUNCMARK
    var kkk_avatar_lll = ""
    // FUNCMARK
    // FUNCMARK
    var kkk_name_lll = ""
    // FUNCMARK
    // FUNCMARK
    var kkk_uid_lll = ""
    // FUNCMARK
    // FUNCMARK
    var kkk_ismy_lll:Int = 1
    // FUNCMARK
    // FUNCMARK
    var kkk_gender_lll: Int = 0
    // FUNCMARK
    // FUNCMARK
    var kkk_ages_lll : Int = 0
    // FUNCMARK
    // FUNCMARK
    
    
    override func CCC_configView_DDD() {
        CCC_addNoty_DDD(#selector(CCC_hide_DDD), "MMM_closeReportViewNoty_NNN")
        kkk_baseView_lll.height = kkk_HEIGHT_lll * 0.7635
        kkk_baseView_lll.backgroundColor = CCC_colors_DDD("FFDCA3")
        kkk_isShowAlpha_lll = true
        kkk_titleLabel_lll.text = AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_report_NNN")
        kkk_cellSize_lll = CGSize(width: kkk_WIDTH_lll - 32, height: 48)
        kkk_leadTra_lll = 16
        kkk_lineSpa_lll = 12
        kkk_collect_lll.CCC_regCodeCell_DDD(AAA_wallCountryCell_BBB.self)
//        kkk_collect_lll.snp.makeConstraints { make in
//            make.top.equalTo(60)
//        }
//        kkk_collect_lll.snp.updateConstraints { make in
//            make.bottom.equalTo(119 + UIDevice.CCC_safeBottom_DDD())
//        }
        kkk_collect_lll.snp.makeConstraints { make in
            make.top.equalTo(131)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-UIDevice.CCC_safeBottom_DDD() - 44 - 30)
        }
        kkk_confirmBtn_lll.CCC_round_DDD(22)
        kkk_confirmBtn_lll.CCC_defaults_DDD(self, #selector(CCC_submit_DDD))
        kkk_confirmBtn_lll.frame = CGRectMake(67, kkk_baseView_lll.height - UIDevice.CCC_safeBottom_DDD() - 44 - 20, kkk_WIDTH_lll - 134, 44)
        kkk_confirmBtn_lll.backgroundColor = CCC_colors_DDD("CD873C")
        kkk_confirmBtn_lll.setTitleColor(.white, for: .normal)
        kkk_confirmBtn_lll.setTitleColor(.white, for: .selected)
//        kkk_confirmBtn_lll.kkk_backSelImage_lll = "MMM_loginButtonBg_NNN"
        kkk_confirmBtn_lll.setTitle(AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_submit_NNN"), for: .normal)
        kkk_confirmBtn_lll.titleLabel!.font = .systemFont(ofSize: 14, weight: .bold)
        kkk_baseView_lll.addSubview(kkk_confirmBtn_lll)
    }
    func CCC_getReportList_DDD() {
        if kkk_list_lll.count == 0 {
            let kkk_reports_lll = ((UserDefaults.standard.object(forKey: "MMM_myRepoertListLocalSave_NNN") ?? "") as! String).CCC_ToArray_DDD()
            kkk_list_lll = AAA_reportModel_BBB.CCC_array_DDD(kkk_reports_lll)
            kkk_server_lll.CCC_getReportList_DDD { [weak self] array in
                guard let self = self else {return}
                self.kkk_list_lll = AAA_reportModel_BBB.CCC_array_DDD(array)
                self.kkk_cellCount_lll = self.kkk_list_lll.count
                self.kkk_collect_lll.reloadData()
            }
        }
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let kkk_cell_lll = collectionView.dequeueReusableCell(withReuseIdentifier: "AAA_wallCountryCell_BBB", for: indexPath) as! AAA_wallCountryCell_BBB
        let kkk_model_lll = kkk_list_lll[indexPath.item] as? AAA_reportModel_BBB
        
        if kkk_model_lll != nil {
            kkk_cell_lll.CCC_titles_DDD(kkk_model_lll!.kkk_name_lll)
        }else {
            kkk_cell_lll.CCC_titles_DDD(kkk_list_lll[indexPath.item] as! String)
        }
        if kkk_select_lll == indexPath.item {
            kkk_cell_lll.CCC_selects_DDD(true)
        }else {
            kkk_cell_lll.CCC_selects_DDD(false)
        }
        if kkk_white_lll == false {
            kkk_cell_lll.CCC_blacks_DDD()
        }else {
            kkk_cell_lll.CCC_whites_DDD()
        }
        
        return kkk_cell_lll
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        kkk_select_lll = indexPath.item
        kkk_collect_lll.reloadData()
        if indexPath.item == kkk_list_lll.count - 1 {
            let kkk_model_lll = kkk_list_lll[indexPath.item] as! AAA_reportModel_BBB
            if kkk_types_lll == 1 {
                if kkk_ismy_lll == 2 {
                    CCC_showReportInputView_DDD(0, Int(kkk_dics_lll.CCC_keyStr_DDD("kkk_uid_lll"))!, kkk_white_lll, kkk_model_lll.kkk_id_lll,kkk_types_lll,2)
                } else {
                    CCC_showReportInputView_DDD(0, Int(kkk_dics_lll.CCC_keyStr_DDD("kkk_uid_lll"))!, kkk_white_lll, kkk_model_lll.kkk_id_lll,kkk_types_lll)
                }
            }else {
                CCC_showReportInputView_DDD(kkk_dics_lll.CCC_keyInt_DDD("kkk_room_lll"),0, kkk_white_lll, kkk_model_lll.kkk_id_lll,kkk_types_lll)
            }
            kkk_confirmBtn_lll.isSelected = false
        } else {
            kkk_confirmBtn_lll.isSelected = true
        }
    }
    
    override func CCC_show_DDD() {
        super.CCC_show_DDD()
        kkk_cellCount_lll = kkk_list_lll.count
        kkk_collect_lll.reloadData()
        kkk_select_lll = 0
        kkk_confirmBtn_lll.isSelected = true
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_info_DDD(_ room : Int, _ avatar : String, _ name : String, _ uid : Int, _ user_no : String, _ type : Int, _ whites : Bool, _ isBlock:Int = 1,_ gender:Int = 0,_ age:Int = 0) {
        self.kkk_ismy_lll = isBlock
        kkk_white_lll = whites
        kkk_types_lll = type
        kkk_avatar_lll = avatar
        kkk_name_lll = name
        kkk_uid_lll = "\(uid)"
        kkk_gender_lll = gender
        kkk_ages_lll = age
        
        let kkk_dic_lll = NSMutableDictionary()
        kkk_dic_lll.setObject(avatar, forKey: "kkk_avatar_lll" as NSCopying)
        kkk_dic_lll.setObject(name, forKey: "kkk_nickname_lll" as NSCopying)
        kkk_dic_lll.setObject(user_no, forKey: "kkk_user_no_lll" as NSCopying)
        kkk_dic_lll.setObject(type, forKey: "kkk_type_lll" as NSCopying)
        kkk_dic_lll.setObject(room, forKey: "kkk_room_lll" as NSCopying)
        kkk_dic_lll.setObject(String(format: "%d", uid), forKey: "kkk_uid_lll" as NSCopying)
        self.kkk_dics_lll = kkk_dic_lll
        if room > 0 {
            kkk_isReportRoom_lll = true
        }else {
            kkk_isReportRoom_lll = false
        }
        if kkk_white_lll == false {
            kkk_baseView_lll.backgroundColor = CCC_colors_DDD("FFDCA3")
            kkk_collect_lll.snp.updateConstraints { make in
                make.top.equalTo(130)
            }
            kkk_titleLabel_lll.textColor = CCC_colors_DDD("CD873C")
            kkk_baseView_lll.height = kkk_HEIGHT_lll * 0.8596
            if kkk_userinfo_lll == nil {
                kkk_userinfo_lll = AAA_userInfoView_BBB.CCC_loadViews_DDD()
                kkk_userinfo_lll.frame = CGRectMake(17, 57, kkk_WIDTH_lll - 27, 64)
            }
            kkk_baseView_lll.addSubview(kkk_userinfo_lll)
            kkk_userinfo_lll?.CCC_info_DDD(kkk_avatar_lll, kkk_name_lll, user_no,kkk_gender_lll,kkk_ages_lll)
            kkk_confirmBtn_lll.backgroundColor = CCC_colors_DDD("CD873C")//AAA_GeneralOutModel_BBB.CCC_color_DDD("color_2F2F2F_color")

        }else {
            kkk_baseView_lll.backgroundColor = CCC_colors_DDD("FFDCA3")
            kkk_titleLabel_lll.textColor = CCC_colors_DDD("CD873C")
            kkk_baseView_lll.height = kkk_HEIGHT_lll * 0.7635
            kkk_collect_lll.snp.updateConstraints { make in
                make.top.equalTo(60)
            }
            kkk_confirmBtn_lll.backgroundColor =  AAA_GeneralOutModel_BBB.CCC_color_DDD("CD873C")
            kkk_userinfo_lll?.removeFromSuperview()
        }
        
        kkk_confirmBtn_lll.y = kkk_baseView_lll.height - UIDevice.CCC_safeBottom_DDD() - 86
        kkk_cellCount_lll = kkk_list_lll.count
        CCC_getReportList_DDD()
        kkk_collect_lll.reloadData()
    }
    // FUNCMARK
    // FUNCMARK
    @objc func CCC_submit_DDD() {
        if kkk_confirmBtn_lll.isSelected == true {
            if kkk_list_lll.count > kkk_select_lll {
                let kkk_dic_lll = NSMutableDictionary()
                let kkk_model_lll = kkk_list_lll[kkk_select_lll] as? AAA_reportModel_BBB
                if kkk_types_lll == 1 {
                    kkk_dic_lll.setObject(kkk_dics_lll.CCC_keyStr_DDD("kkk_uid_lll"), forKey: kkk_target_idStr_lll as NSCopying)
                }else {
                    kkk_dic_lll.setObject(kkk_dics_lll.CCC_keyStr_DDD("kkk_room_lll"), forKey: kkk_target_idStr_lll as NSCopying)
                }
                kkk_dic_lll.setObject(kkk_dics_lll.CCC_keyInt_DDD("kkk_type_lll"), forKey: kkk_qtarget_type_lll as NSCopying)
                if kkk_model_lll != nil {
                    kkk_dic_lll.setObject([kkk_model_lll!.kkk_id_lll].CCC_toJson_DDD(), forKey: kkk_reasonStr_lll as NSCopying)
                }else {
                    kkk_dic_lll.setObject(kkk_list_lll[kkk_select_lll], forKey: kkk_contentStr_lll as NSCopying)
                }
                AAA_WaitView_BBB.kkk_share_lll.CCC_show_DDD()
                kkk_server_lll.CCC_reportData_DDD(kkk_dic_lll) { [weak self] in
                    guard let self = self else {return}
                    AAA_GeneralOutModel_BBB.CCC_showTitle_DDD("MMM_SuccessStr_NNN")
                    if self.kkk_ismy_lll == 2 {
                        self.CCC_hide_DDD()
                        return
                    }
                    if kkk_types_lll == 1 {
                        AAA_notyCenterModel_BBB.CCC_reportNoty_DDD(kkk_dics_lll.CCC_keyStr_DDD("kkk_uid_lll"), kkk_target_idStr_lll)
                    } else {
                        AAA_notyCenterModel_BBB.CCC_reportNoty_DDD(kkk_dics_lll.CCC_keyStr_DDD("kkk_room_lll"), kkk_target_idStr_lll)
                    }
                    AAA_ReportView_BBB.CCC_removeVoiceRoomControl_DDD()
                    self.CCC_hide_DDD()
                } _ : { msg in
                    AAA_WaitView_BBB.kkk_share_lll.CCC_show_DDD(msg)
                }
                
            }
        }
    }
    // FUNCMARK
}
