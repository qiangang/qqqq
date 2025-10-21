//
//  AAA_GeneralOutModel_BBB.swift
//  Module_General
//
//  Created by Frankie on 19/05/2025.
//

import UIKit
import RongIMLibCore
import AgoraRtcKit
import AVFAudio







nonisolated(unsafe) public var kkk_agora_lll : AgoraRtcEngineKit?



public class AAA_GeneralOutModel_BBB: NSObject {
    
    //语聊房声音大小修改后需缓存，可使用MMM_localVoiceVolumNum_NNN
    //每次进语聊房或者语聊房声音大小改变都需要修改
    //MMM_localVoiceVolumNum_NNN
    
    //关闭举报弹窗通知
    //MMM_closeReportViewNoty_NNN
    
    
    /*
     初始化
     AAA_StringModel_BBB 初始化本地字符串
     */
    public class func CCC_config_DDD() {
        AAA_StringModel_BBB.CCC_checkModel_DDD()
        _ = AAA_webModel_BBB.kkk_share_lll
        _ = AAA_notyCenterModel_BBB.kkk_share_lll
        kkk_bundles_lll = Bundle.module
        kkk_WIDTH_lll = UIScreen.main.bounds.width
        kkk_HEIGHT_lll = UIScreen.main.bounds.height
    }
    
    
    public class func CCC_regRongMsg_DDD() {
        RCCoreClient.shared().registerMessageType(AAA_CallingResultContent_BBB.self)
        RCCoreClient.shared().registerMessageType(AAA_PresentMessageContent_BBB.self)
        RCCoreClient.shared().registerMessageType(AAA_SysMessageContent_BBB.self)
        RCCoreClient.shared().registerMessageType(AAA_inviteLiveModel_BBB.self)
        RCCoreClient.shared().registerMessageType(AAA_inviteTransferModel_BBB.self)
        RCCoreClient.shared().registerMessageType(AAA_SysContent_BBB.self)
        RCCoreClient.shared().registerMessageType(AAA_intentPorp_BBB.self)
        RCCoreClient.shared().registerMessageType(AAA_inviteTypeLiveModel_BBB.self)
        RCCoreClient.shared().registerMessageType(RCGroupNotificationMessage.self)
    }
    
    
    
    public class func CCC_showNewGame_DDD() {
        AAA_webView_BBB.kkk_share_lll.CCC_hidePlay_DDD()
    }
    
    /*
     关闭全屏动画
        商店、背包动画
        直播语聊动画
     */
    public class func CCC_closeAnimation_DDD() {
        Task { @MainActor in
            kkk_generalOut_lll.CCC_stopSvga_DDD(kkk_svgaPlayer_lll)
            AAA_MP4View_BBB.CCC_hides_DDD()
        }
    }
    
    
    
    /*
     播放全屏动画
     */
    @MainActor public class func CCC_playAnimation_DDD(_ animation : String, _ audio : String? = "") {
        if animation.lowercased().contains("mp4") {
            AAA_MP4View_BBB.CCC_showMp4View_DDD(animation)
        }
        
        if animation.lowercased().contains("svga") {
            if kkk_svgaPlayer_lll == nil {
                kkk_svgaPlayer_lll = UIView()
                kkk_svgaPlayer_lll!.backgroundColor = .clear
                kkk_svgaPlayer_lll!.frame = CGRectMake(0, 0, kkk_WIDTH_lll, kkk_HEIGHT_lll)
                kkk_generalOut_lll.CCC_overSvga_DDD { tag in
                    if kkk_svgaPlayer_lll?.tag == tag {
                        kkk_generalOut_lll.CCC_destroySvga_DDD(kkk_svgaPlayer_lll)
                        kkk_svgaPlayer_lll?.removeFromSuperview()
                        kkk_svgaPlayer_lll = nil
                    }
                }
            }
            kkk_Window_lll!.addSubview(kkk_svgaPlayer_lll!)
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback)
                try AVAudioSession.sharedInstance().setActive(true)
            }catch{}
            if let audioStr = audio {
                AAA_musicPlayer_BBB.kkk_share_lll.CCC_playAudio_DDD(audioStr) {
                    kkk_generalOut_lll.CCC_showSvga_DDD(kkk_svgaPlayer_lll!, 1, animation)
                }
            }
            
        }
    }
    
    
    //停止语聊房迷你弹窗的动画
    //关闭直播语聊的小窗
    class func CCC_closeMiniWindow_DDD() {
        "".CCC_postNoty_DDD("MMM_stopMiniwindowSvgaNoty_NNN", "")
        "".CCC_postNoty_DDD("MMM_removeMiniWindowNoty_NNN", "")
    }
    
    /*
     查看大图
     array(图片数组，可为UIImage或者URL字符串)
     index当前图片位置
     save，是否显示保存按钮，默认显示保存按钮
     */
    @MainActor public class func CCC_showImage_DDD(_ array : Any, _ index : Int, _ save : Bool? = true) {
        AAA_ShowBigImgController_BBB.kkk_share_lll.kkk_showSaveBtn_lll = save!
        AAA_ShowBigImgController_BBB.kkk_share_lll.CCC_show_DDD(array as! NSArray, index)
    }
    
    
    /*
     显示文本提示弹窗
     key为字符串
     */
    @MainActor public class func CCC_showTitle_DDD(_ key : String) {
        var kkk_string_lll = AAA_GeneralOutModel_BBB.CCC_string_DDD(key)
        if kkk_string_lll.count == 0 {
            kkk_string_lll = key
        }
        AAA_WaitView_BBB.kkk_share_lll.CCC_show_DDD(kkk_string_lll)
    }
    
    
    /*
     显示等待转圈动画
     */
    @MainActor public class func CCC_showWait_DDD() {
        DispatchQueue.main.async {
            AAA_WaitView_BBB.kkk_share_lll.CCC_show_DDD()
        }
    }
    
    
    /*
     隐藏等待转圈动画
     */
    @MainActor public class func CCC_hideWait_DDD() {
        AAA_WaitView_BBB.kkk_share_lll.CCC_hide_DDD()
    }
    
    
    /*
     获取颜色
     */
    public class func CCC_color_DDD(_ key : String, _ alpha : Double? = 1) -> UIColor {
        return CCC_colors_DDD(CCC_string_DDD(key), CGFloat(alpha!))
    }
    
    
    /*
     获取CG颜色
     */
    public class func CCC_cgColor_DDD(_ key : String, _ alpha : Double? = 1) -> CGColor {
        return CCC_CGcolor_DDD(CCC_string_DDD(key), CGFloat(alpha!))
    }
    
    
    
    /*
     获取字符串
     */
    public class func CCC_string_DDD(_ key : String) -> String {
        var kkk_string_lll = AAA_StringModel_BBB.CCC_checkStr_DDD(key)
        if kkk_string_lll.count == 0 {
            kkk_string_lll = key
        }
        return kkk_string_lll
    }
    
    
}

//获取等级图标
public func CCC_levelMini_DDD(_ level : Int) -> UIImage {
    let kkk_name_lll = CCC_levelMiniName_DDD(level)
    return UIImage.CCC_localImage_DDD(kkk_name_lll)
}


// FUNCMARK
// FUNCMARK
//获取等级图标名字
public func CCC_levelMiniName_DDD(_ level : Int) -> String {
    var kkk_levelName_lll = ""
    if level <= 0 {
        kkk_levelName_lll = kkk_leveIconArray_lll.first!
    }else {
        if level >= kkk_leveIconArray_lll.count {
            kkk_levelName_lll = kkk_leveIconArray_lll.last!
        }else if level != -1 {
            kkk_levelName_lll = kkk_leveIconArray_lll[level]
        }
    }
    return kkk_levelName_lll
}
// FUNCMARK




//判断字符串是否为空
public func CCC_IsNullString_DDD(_ kkk_value_lll: String?) -> Bool {
    if (nil == kkk_value_lll) {
        return true
    }else{
        if let kkk_myValue_lll  = kkk_value_lll{
            return kkk_myValue_lll == "" || kkk_myValue_lll == "(null)" || kkk_myValue_lll == "<null>" || 0 == kkk_myValue_lll.count
        }else{
            return true
        }
    }
}

//删除所有subview
@MainActor public func CCC_deleteAllControl_DDD(_ kkk_control_lll: UIView) ->() {
    for kkk_cntroll_lll in kkk_control_lll.subviews {
        kkk_cntroll_lll.removeFromSuperview()
    }
}

public typealias kkk_BtnCallBack_lll = (_ btn:UIButton) -> Void
public typealias kkk_IndexCallBack_lll = (_ idx:Int) -> Void

///获取 约束高度   view
@MainActor public func CCC_contentViewFittingSize_DDD(_ contentView:UIView) -> CGSize{
    let kkk_contentViewWidth_lll = CGRectGetWidth(contentView.frame)
    let kkk_widthFenceConstraint_lll = NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: kkk_contentViewWidth_lll)
    contentView.addConstraint(kkk_widthFenceConstraint_lll)
    let kkk_fittingSize_lll = contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    contentView.removeConstraint(kkk_widthFenceConstraint_lll)
    return kkk_fittingSize_lll
}


//MARK: ================== 通知相关
class AAA_notyCenterModel_BBB: NSObject {
    
    
    
    
    //前往个人中心，我的背包
    class func CCC_showBackpackView_DDD() {
        CCC_postNoty_DDD("MMM_showBackpackControlNoty_NNN", "")
    }
    
    //前往任务中心
    class func CCC_showTaskView_DDD() {
        CCC_postNoty_DDD("MMM_showRewardControlNoty_NNN", "")
    }
    
    //拉黑成功通知
    public class func CCC_blockNoty_DDD (_ uid : Int, _ block : Bool) {
        self.CCC_postNoty_DDD("MMM_WhetherDetailsAreBlocked_NNN", block)
        if block {
            self.CCC_postNoty_DDD("MMM_closeVoiceRoomNoty_NNN", "\(uid)")
            self.CCC_postNoty_DDD("MMM_reloadBlockVoiceViewNoty_NNN", "")
            self.CCC_postNoty_DDD("MMM_closeVideoRoomNoty_NNN", "\(uid)")
            self.CCC_postNoty_DDD("MMM_reportOrBlockUserNoty_NNN", uid)
        }
    }
    
    
    //举报通知
    public class func CCC_reportNoty_DDD (_ uid : String, _ target : String) {
        CCC_postNoty_DDD("MMM_closeReportViewNoty_NNN", "")
        //拉黑通知，主播详情、语聊房等界面需返回
        CCC_postNoty_DDD("MMM_WhetherDetailsAreBlocked_NNN", true)
        //拉黑通知关闭语聊房
        CCC_postNoty_DDD("MMM_closeVoiceRoomNoty_NNN", uid)
        //拉黑通知，关闭语聊房用户列表
        CCC_postNoty_DDD("MMM_reloadBlockVoiceViewNoty_NNN", uid)
        //拉黑通知关闭直播间
        CCC_postNoty_DDD("MMM_closeVideoRoomNoty_NNN", uid)
        
        //通知刷新引流
        CCC_postNoty_DDD("MMM_reportOrBlockUserNoty_NNN", target)
    }
    
    //前往语聊首页
    class func CCC_showVoiceListNpty_DDD() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MMM_showVoiceListNoty_NNN"), object: nil)
    }
    
    
    //关闭某些弹窗
    @MainActor class func CCC_closeOtherMiniWimdowNoty_DDD() {
        AAA_GeneralOutModel_BBB.CCC_hideWait_DDD()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MMM_closeSomeWindowNotyNoty_NNN"), object: nil)
    }
    
    
    
    //弹出充值页面通知
    class func CCC_showRechargeViewNoty_DDD(_ type : Int) {
        var kkk_str_lll = AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_Recharges_NNN")
        if type == 1 {
            kkk_str_lll = AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_donotHaveCoin_NNN")
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MMM_showRechargeViewNoty_NNN"), object: kkk_str_lll)
    }
    
    
    
    //弹出用户详情页通知
    class func CCC_showAnchorDetailViewNoty_DDD(_ uid : Int) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MMM_showUserDetailView_NNN"), object: uid)
    }
    
    
    //加入直播通知通知
    class func CCC_joinLiveRoomNoty_DDD(_ uid : Int) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MMM_joinLiveRoomNoty_NNN"), object: ["kkk_uid_lll" : uid, "kkk_from_lll" : 7])
    }
    
    //加入语聊通知通知
    class func CCC_joinChatRoomNoty_DDD(_ uid : Int) {
        let kkk_dic_lll = [
            "kkk_rooID_lll" : uid,
            "kkk_roomType_lll" : 0,
            "kkk_inviteType_lll" : 7,
        ]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MMM_joinRoomPlayNoty_NNN"), object: kkk_dic_lll)
    }
    
    
    //基于General的SDK需初始化
    nonisolated(unsafe) static let kkk_share_lll : AAA_notyCenterModel_BBB = AAA_notyCenterModel_BBB()
    
    
    override init() {
        super.init()
        
        CCC_addNoty_DDD(#selector(CCC_closeNormalTipView_DDD), "MMM_closeNormalTipViewNoty_NNN")
        CCC_addNoty_DDD(#selector(CCC_showNormalTipView_DDD), "MMM_showNormalTipViewNoty_NNN")
        //收到关闭弹窗的通知，关闭查看大图的界面（退出登录等）
        CCC_addNoty_DDD(#selector(CCC_closeBigImageView_DDD), "MMM_ClosePopover_NNN")
        CCC_addNoty_DDD(#selector(CCC_showMp4View_DDD), "MMM_playMp4Noty_NNN")
        CCC_addNoty_DDD(#selector(CCC_closeMp4View_DDD), "MMM_closeMp4Noty_NNN")
        CCC_addNoty_DDD(#selector(CCC_showWebControl_DDD(_ :)), "MMM_showWebControlNoty_NNN")
    }
    @MainActor @objc func CCC_showWebControl_DDD(_ noty : NSNotification) {
        let kkk_url_lll = noty.object as! String
        let kkk_con_lll = AAA_webControl_BBB()
        kkk_con_lll.kkk_url_lll = kkk_url_lll
        kkk_con_lll.kkk_title_lll = ""
        UIView.CCC_push_DDD(kkk_con_lll)
    }
    @MainActor @objc func CCC_closeMp4View_DDD(_ noty : NSNotification) {
        AAA_MP4View_BBB.CCC_hides_DDD()
    }
    @MainActor @objc func CCC_showMp4View_DDD(_ noty : NSNotification) {
        CCC_showMp4_DDD(noty.object as! String)
    }
    @MainActor @objc func CCC_closeBigImageView_DDD() {
        AAA_ShowBigImgController_BBB.kkk_share_lll.CCC_hide_DDD()
    }
    @MainActor @objc func CCC_showNormalTipView_DDD() {
        DispatchQueue.main.async {
            AAA_WaitView_BBB.kkk_share_lll.CCC_show_DDD()
        }
    }
    @MainActor @objc func CCC_closeNormalTipView_DDD() {
        AAA_WaitView_BBB.kkk_share_lll.CCC_hide_DDD()
    }
    
    
    
}
