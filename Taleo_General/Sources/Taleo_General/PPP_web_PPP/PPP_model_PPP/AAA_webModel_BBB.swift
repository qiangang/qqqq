//
//  AAA_webModel_BBB.swift
//  Module_General
//
//  Created by Frankie on 21/05/2025.
//

import UIKit

class AAA_webModel_BBB: NSObject {

    /*
     游戏类型
     0 默认游戏大厅，全屏网页
     1 半屏网页，主要直播间或者语聊房使用
     2 固定高度网页，主要家族点击的网页
     3 全屏网页，退出需发送充值成功通知
     */
    var kkk_type_lll = 0
    
    //网页URL
    var kkk_url_lll = ""
    
    //游戏列表
    var kkk_gameListView_lll : AAA_gameListView_BBB!
    var kkk_playView_lll : AAA_voiceGameView_BBB!
    
    override init() {
        super.init()
        
        CCC_addNoty_DDD(#selector(CCC_showWebView_DDD(_ :)), "MMM_showWebNoty_NNN")
        CCC_addNoty_DDD(#selector(CCC_showGameListView_DDD(_ :)), "MMM_showGameListNoty_NNN")
        CCC_addNoty_DDD(#selector(CCC_removeGameListView_DDD), "MMM_removeGameListView_NNN")
        CCC_addNoty_DDD(#selector(CCC_cleanGameListView_DDD), "MMM_cleanGameListView_NNN")
        CCC_addNoty_DDD(#selector(CCC_showGameWebView_DDD(_ :)), "MMM_showWebNoty_web_NNN")
        CCC_addNoty_DDD(#selector(CCC_cleanWebviewInfo_DDD), "MMM_cleanWebviewInfoNoty_NNN")
        CCC_addNoty_DDD(#selector(CCC_showWebOrList_DDD(_ :)), "MMM_showWebOrListNoty_NNN")
        CCC_addNoty_DDD(#selector(CCC_hideVoiceGameList_DDD), "MMM_hideVoiceGameListNoty_NNN")
        CCC_addNoty_DDD(#selector(CCC_cleanVoiceGameUrlView_DDD), "MMM_cleanVoiceGameUrlViewNoty_NNN")
    }
    @MainActor@objc func CCC_hideVoiceGameList_DDD() {
        kkk_playView_lll?.CCC_hide_DDD()
    }
    @MainActor@objc func CCC_cleanVoiceGameUrlView_DDD() {
        kkk_playView_lll?.CCC_clears_DDD()
    }
    @MainActor@objc func CCC_showWebOrList_DDD(_ noty : Notification) {
        let kkk_roomId_lll = noty.object as! Int
        if AAA_webView_BBB.kkk_share_lll.kkk_roomId_lll == kkk_roomId_lll && AAA_webView_BBB.kkk_share_lll.kkk_localType_lll == 0 {
            AAA_webView_BBB.kkk_share_lll.CCC_show_DDD(1)
        }else {
            if kkk_playView_lll == nil {
                kkk_playView_lll = AAA_voiceGameView_BBB.CCC_loadViews_DDD()
            }
            kkk_playView_lll.kkk_roomId_lll = kkk_roomId_lll
            kkk_playView_lll.CCC_loadGame_DDD()
            kkk_playView_lll.CCC_show_DDD(kkk_Window_lll!)
        }
    }
    @MainActor@objc func CCC_cleanWebviewInfo_DDD() {
        AAA_webView_BBB.kkk_share_lll.CCC_hidePlay_DDD()
    }
    @MainActor@objc func CCC_showGameWebView_DDD(_ noty : Notification) {
        AAA_webView_BBB.kkk_share_lll.kkk_isShowFromList_lll = false
        let kkk_dic_lll = noty.object as! NSDictionary
        let kkk_roomId_lll = kkk_dic_lll.CCC_keyInt_DDD("kkk_roomId_lll")
        let kkk_playId_lll = kkk_dic_lll.CCC_keyInt_DDD("kkk_playId_lll")
        let kkk_ratio_lll = kkk_dic_lll.CCC_keyDouble_DDD("kkk_ratio_lll")
        let kkk_url_lll = kkk_dic_lll.CCC_keyStr_DDD("kkk_url_lll")
        let kkk_type_lll = kkk_dic_lll.CCC_keyInt_DDD("kkk_type_lll")
        AAA_webView_BBB.kkk_share_lll.kkk_type_lll = 1
        if AAA_webView_BBB.kkk_share_lll.kkk_roomId_lll == kkk_roomId_lll && kkk_roomId_lll != 0 {
            if AAA_webView_BBB.kkk_share_lll.kkk_playId_lll == kkk_playId_lll && AAA_webView_BBB.kkk_share_lll.kkk_localType_lll == kkk_type_lll {
                AAA_webView_BBB.kkk_share_lll.CCC_show_DDD(1)
                return
            }
        }
        AAA_webView_BBB.kkk_share_lll.CCC_hidePlay_DDD()
        AAA_webView_BBB.kkk_share_lll.kkk_localType_lll = kkk_type_lll
        AAA_webView_BBB.kkk_share_lll.kkk_roomId_lll = kkk_roomId_lll
        AAA_webView_BBB.kkk_share_lll.kkk_playId_lll = kkk_playId_lll
        AAA_webView_BBB.kkk_share_lll.kkk_ratio_lll = kkk_ratio_lll
        AAA_webView_BBB.kkk_share_lll.kkk_urlStr_lll = kkk_url_lll
        AAA_webView_BBB.kkk_share_lll.kkk_localType_lll = kkk_type_lll
        AAA_webView_BBB.kkk_share_lll.CCC_show_DDD(1)
    }
    @MainActor@objc func CCC_cleanGameListView_DDD() {
        kkk_gameListView_lll?.CCC_clean_DDD()
    }
    @MainActor@objc func CCC_removeGameListView_DDD() {
        kkk_gameListView_lll?.CCC_hide_DDD()
    }
    @MainActor@objc func CCC_showGameListView_DDD(_ noty : Notification) {
        let kkk_roomId_lll = noty.object as! Int
        if AAA_webView_BBB.kkk_share_lll.kkk_roomId_lll == kkk_roomId_lll && AAA_webView_BBB.kkk_share_lll.kkk_localType_lll == 0 {
            AAA_webView_BBB.kkk_share_lll.CCC_show_DDD(1)
        }else {
            if kkk_gameListView_lll == nil {
                kkk_gameListView_lll = AAA_gameListView_BBB.CCC_loadViews_DDD()
            }
            kkk_gameListView_lll.CCC_show_DDD(kkk_roomId_lll)
        }
    }
    
    
    @MainActor @objc func CCC_showWebView_DDD(_ noty : Notification) {
        let kkk_dic_lll = noty.object as! NSDictionary
        kkk_type_lll = kkk_dic_lll.CCC_keyInt_DDD("kkk_type_lll")
        kkk_url_lll = kkk_dic_lll.CCC_keyStr_DDD("kkk_url_lll")
        let kkk_titleKey_lll = kkk_dic_lll.CCC_keyStr_DDD("kkk_title_lll")
        let kkk_title_lll = AAA_GeneralOutModel_BBB.CCC_string_DDD(kkk_titleKey_lll)
        if kkk_type_lll == 0 || kkk_type_lll == 3 {
            let kkk_con_lll = AAA_webControl_BBB()
            kkk_con_lll.kkk_url_lll = kkk_url_lll
            kkk_con_lll.kkk_title_lll = kkk_title_lll
            kkk_con_lll.kkk_type_lll = kkk_type_lll
            UIView.CCC_push_DDD(kkk_con_lll)
        }else if kkk_type_lll == 1 {
            let kkk_con_lll = AAA_webControl_BBB()
            kkk_con_lll.kkk_url_lll = kkk_url_lll
            kkk_con_lll.kkk_title_lll = kkk_title_lll
            kkk_con_lll.kkk_type_lll = kkk_type_lll
            UIView.CCC_push_DDD(kkk_con_lll)
        }else if kkk_type_lll == 2 {
            
        }
//        0 默认游戏大厅，全屏网页
//        1 半屏网页，主要直播间或者语聊房使用
//        2 固定高度网页，主要家族点击的网页
//        3 全屏网页，退出需发送充值成功通知
    }
    
    
    
    nonisolated(unsafe) static let kkk_share_lll : AAA_webModel_BBB = AAA_webModel_BBB()
}
