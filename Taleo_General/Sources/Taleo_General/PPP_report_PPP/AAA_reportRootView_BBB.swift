//
//  AAA_reportRootView_BBB.swift
//  Module_General
//
//  Created by Frankie on 20/05/2025.
//

import UIKit





//举报、拉黑用户菜单弹窗
nonisolated(unsafe) var kkk_userReportView_lll : AAA_userInfoMoreView_BBB!
// FUNCMARK
// FUNCMARK
//举报列表弹窗
nonisolated(unsafe) var kkk_reportView_lll : AAA_voiceReportListView_BBB!
// FUNCMARK
// FUNCMARK
//举报输入框
nonisolated(unsafe) var kkk_reportInputView_lll : AAA_ReportView_BBB!
// FUNCMARK
// FUNCMARK
//动画
@MainActor var kkk_svgaPlayer_lll : UIView?
// FUNCMARK
// FUNCMARK


/// 参数依次为  房间ID、被举报用户头像、昵称、id、编号、类型、是否拉黑，是否白色（举报用户，则房间Id传0，举报房间、用户id传0，类型除直播语聊外都传1，是否拉黑只有拉黑用户时需要）
/// 1 用户   2 直播语聊
@MainActor public func CCC_showReportView_DDD (_ room : Int, _ avatar : String, _ name : String, _ uid : Int, _ user_no : String, _ type : Int, _ block : Bool, _ white : Bool,_ typeIndex:Int = 1) {
    if type == 6 {
        CCC_showReportListView_DDD(room, avatar, name, 0, user_no, 6, white)
    }else if type == 7 {
        CCC_showReportListView_DDD(room, avatar, name, 0, user_no, 7, white)
    }else {
        CCC_showReportUserView_DDD(avatar, name, uid ,user_no, 1, block, white,typeIndex)
    }
}


//显示举报列表弹窗
@MainActor public func CCC_showReportListView_DDD(_ room : Int, _ avatar : String, _ name : String, _ uid : Int, _ user_no : String, _ type : Int, _ white : Bool,_ isBlock:Int = 1,_ gender:Int = 0,_ age:Int = 0) {
    if kkk_reportView_lll == nil {
        kkk_reportView_lll = AAA_voiceReportListView_BBB()
    }
    if kkk_userReportView_lll != nil {
        kkk_userReportView_lll.CCC_hide_DDD()
    }
    kkk_reportView_lll.kkk_baseView_lll.backgroundColor = .clear
    kkk_reportView_lll.backgroundColor = .clear
    kkk_reportView_lll.CCC_info_DDD(room, avatar, name, uid, user_no, type, white,isBlock,gender,age)
    kkk_reportView_lll.CCC_show_DDD()
}


@MainActor func CCC_showReportUserView_DDD(_ avatar : String, _ name : String, _ uid : Int, _ user_no : String, _ type : Int, _ block : Bool, _ white : Bool,_ typeIndex:Int = 1) {
    if kkk_userReportView_lll == nil {
        kkk_userReportView_lll = AAA_userInfoMoreView_BBB.CCC_loadViews_DDD()
    }
    kkk_userReportView_lll.CCC_info_DDD(0, avatar, name, uid, user_no, type, block, white)
//    kkk_userReportView_lll.kkk_type_lll = typeIndex
    kkk_userReportView_lll.CCC_show_DDD(kkk_Window_lll!)
}

//举报输入框
@MainActor public func CCC_showReportInputView_DDD(_ room : Int, _ uid : Int, _ white : Bool, _ reason : Int, _ type : Int,_ isBlock:Int = 1) {
    if kkk_reportInputView_lll == nil {
        kkk_reportInputView_lll = AAA_ReportView_BBB.CCC_loadViews_DDD()
    }
    
    if room > 0 {
        kkk_reportInputView_lll.CCC_info_DDD(room, type, white)
    }else {
        kkk_reportInputView_lll.CCC_info_DDD(uid, 1, white)
    }
    kkk_reportInputView_lll.backgroundColor = .clear
    kkk_reportInputView_lll.kkk_isBlock_lll = isBlock
    kkk_reportInputView_lll.kkk_reportId_lll = reason
    kkk_reportInputView_lll.CCC_show_DDD(kkk_Window_lll!)
}
