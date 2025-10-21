//
//  AAA_webView_BBB.swift
//  Module_General
//
//  Created by Frankie on 21/05/2025.
//

import UIKit
import WebKit
import AVFAudio

class AAA_webView_BBB: UIView, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    

    @IBOutlet weak var kkk_heightCOnst_lll: NSLayoutConstraint!
    @IBOutlet weak var kkk_webHeightConst_lll: NSLayoutConstraint!
    @IBOutlet weak var kkk_topHeiConst_lll: NSLayoutConstraint!
    @IBOutlet weak var kkk_titleLabel_lll: UILabel!
    @IBOutlet weak var kkk_webBackView_lll: UIView!
    @IBOutlet weak var kkk_botConst_lll: NSLayoutConstraint!
    
    var kkk_webs_lll: WKWebView!
    
    let kkk_config_lll = WKWebViewConfiguration()
    let MMM_handArray_NNN = ["MMM_rechargeStr_NNN","MMM_clickRechargeStr_NNN","MMM_newTppCloseStr_NNN","MMM_tapRechargeStr_NNN","MMM_autoRechargeStr_NNN","MMM_callHandlerStr_NNN","MMM_OpenGameSuccStr_NNN","MMM_DestroyStr_NNN","MMM_GoToRoomStr_NNN","MMM_GameRechargeStr_NNN","MMM_GameLoadedStr_NNN","MMM_AudioFunStr_NNN"]
    var kkk_aniView_lll : AAA_WaitAniView_BBB?
    //0 全屏，直接退出controller，否则底部隐藏
    var kkk_type_lll = 0
    //默认0,1表示点击的小banner
    var kkk_localType_lll = 0
    var kkk_roomId_lll = 0 {
        didSet {
            print("")
        }
    }
    var kkk_playId_lll = 0
    var kkk_urlStr_lll = ""
    var kkk_ratio_lll = 0.0 {
        didSet {
            if kkk_ratio_lll == 0 {
                kkk_ratio_lll = 1
            }
        }
    }
    var kkk_isLoaded_lll = false
    var kkk_isShowFromList_lll = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CCC_configs_DDD()
    }
    func CCC_configs_DDD() {
        self.frame = CGRectMake(0, 0, kkk_WIDTH_lll, kkk_HEIGHT_lll)
        kkk_heightCOnst_lll.constant = kkk_HEIGHT_lll
        kkk_botConst_lll.constant = -kkk_HEIGHT_lll
        
        

    }
    func CCC_noty_DDD() {
        CCC_addNoty_DDD(#selector(CCC_coinSuc_DDD), "MMM_IAPSuccess_NotificationStr_NNN")
        CCC_addNoty_DDD(#selector(CCC_coinSuc_DDD), "MMM_myCoinIsChangeFromGift_NNN")
    }
    
    @objc func CCC_coinSuc_DDD() {
        if kkk_isLoaded_lll == true {
            let kkk_str_lll = (kkk_Defaults_lll.object(forKey: "MMM_mylogininfosaveStr_NNN") as? String) ?? ""
            let kkk_dic_lll = kkk_str_lll.CCC_toDic_DDD() as NSDictionary
            let kkk_wallets_lll = kkk_dic_lll.CCC_keyStr_DDD(kkk_walletStr_lll)
            let kkk_walletAmount_lll = kkk_dic_lll.CCC_keyStr_DDD(kkk_walletAmountStr_lll)
            kkk_webs_lll?.evaluateJavaScript(String(format: "%@", AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_NativeToJsStr_NNN")),completionHandler: { a, err in
            })
            kkk_webs_lll?.evaluateJavaScript(String(format: "%@(%@)",AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_updateWalletStr_NNN"), kkk_walletAmount_lll),completionHandler: { a, err in
            })
            kkk_webs_lll?.evaluateJavaScript(String(format: "%@'%@'})",AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_walletUpdateStr_NNN"), kkk_wallets_lll),completionHandler: { a, err in
            })
        }
    }
    
    
    func CCC_show_DDD(_ type : Int) {
        kkk_type_lll = type
        if kkk_webs_lll == nil {
            CCC_webConfig_DDD()
            CCC_showTitle_DDD(kkk_titleLabel_lll.text ?? "")
            CCC_loadUrl_DDD()
        }
        CCC_noty_DDD()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        }catch{}
        if type == 0 {
            kkk_heightCOnst_lll.constant = kkk_HEIGHT_lll
            kkk_webHeightConst_lll.constant = kkk_HEIGHT_lll
            kkk_webBackView_lll.backgroundColor = .white
            kkk_botConst_lll.constant = 0
            kkk_Window_lll?.addSubview(self)
            kkk_webs_lll.CCC_constrains_DDD(0, -UIDevice.CCC_safeBottom_DDD(), 0, 0)
        }else {
            kkk_heightCOnst_lll.constant = kkk_WIDTH_lll/kkk_ratio_lll + UIDevice.CCC_safeBottom_DDD()
            kkk_webHeightConst_lll.constant = kkk_heightCOnst_lll.constant
            kkk_webBackView_lll.backgroundColor = .black
            kkk_Window_lll?.addSubview(self)
            kkk_botConst_lll.constant = 0
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.layoutIfNeeded()
            }
            kkk_webs_lll.CCC_constrains_DDD(0, -UIDevice.CCC_safeBottom_DDD(), 0, 0)
        }
        CCC_addNoty_DDD(#selector(CCC_hideNoteView_DDD), "MMM_hideKeyWindShow_NofificationStr_NNN")
    }
    
    @objc func CCC_hideNoteView_DDD(){
        self.removeFromSuperview()
    }
    //传入标题，控制是否展示导航栏
    func CCC_showTitle_DDD(_ string : String) {
        if string.count == 0 {
            kkk_topHeiConst_lll.constant = 0
        }else {
            kkk_topHeiConst_lll.constant = UIDevice.CCC_safeTop_DDD() + 44
            if kkk_type_lll == 0 {
                kkk_webHeightConst_lll.constant = kkk_webHeightConst_lll.constant - kkk_topHeiConst_lll.constant
            }
        }
        kkk_titleLabel_lll.text = string
    }
    func CCC_configWebWaitviews_DDD() {
        kkk_aniView_lll = AAA_WaitAniView_BBB()
        kkk_aniView_lll!.y = self.height/2 - 20
        kkk_aniView_lll?.backgroundColor = .clear
        kkk_aniView_lll?.kkk_isAni_lll = true
        self.addSubview(kkk_aniView_lll!)
    }
    
    @IBAction func CCC_back_DDD(_ sender: Any) {
        CCC_hide_DDD(sender)
    }
    
    func CCC_webConfig_DDD() {
        kkk_config_lll.allowsInlineMediaPlayback = true
        kkk_config_lll.mediaTypesRequiringUserActionForPlayback = .video
        CCC_removeWebJs_DDD()
        kkk_webs_lll?.removeFromSuperview()
        kkk_webs_lll = nil
        kkk_webs_lll = WKWebView()
        kkk_webs_lll.backgroundColor = .red
        kkk_webBackView_lll.addSubview(kkk_webs_lll)
        CCC_configWebJs_DDD()
        kkk_webs_lll.configuration.allowsInlineMediaPlayback = true
        kkk_webs_lll.configuration.mediaTypesRequiringUserActionForPlayback = .video
        kkk_webs_lll.navigationDelegate = self
        kkk_webs_lll.uiDelegate = self
        kkk_webs_lll.backgroundColor = .clear
        kkk_webs_lll.scrollView.backgroundColor = .clear
        kkk_webs_lll.isOpaque = false
        if kkk_urlStr_lll.count != 0 {
            AAA_GeneralOutModel_BBB.CCC_showWait_DDD()
            kkk_webs_lll.load(URLRequest(url: URL(string: kkk_urlStr_lll)!))
        }
        CCC_coinSuc_DDD()
    }
    
    func CCC_loadUrl_DDD() {
        if kkk_urlStr_lll.count > 0 {
            if kkk_webs_lll != nil {
                kkk_isLoaded_lll = false
                if kkk_urlStr_lll.hasPrefix("http") == false {
                    kkk_urlStr_lll = "http://" + kkk_urlStr_lll
                }
                let kkk_url_lll = URL(string: kkk_urlStr_lll)!
                kkk_webs_lll.load(URLRequest(url: kkk_url_lll))
                CCC_loadSuc_DDD()
            }
        }
    }
    
    func CCC_configWebJs_DDD() {
        for string in MMM_handArray_NNN {
            kkk_webs_lll?.configuration.userContentController.removeScriptMessageHandler(forName: AAA_GeneralOutModel_BBB.CCC_string_DDD(string))
        }
        for string in MMM_handArray_NNN {
            kkk_webs_lll?.configuration.userContentController.add(self, name: AAA_GeneralOutModel_BBB.CCC_string_DDD(string))
        }
    }
    func CCC_removeWebJs_DDD() {
        for string in MMM_handArray_NNN {
            kkk_webs_lll?.configuration.userContentController.removeScriptMessageHandler(forName: AAA_GeneralOutModel_BBB.CCC_string_DDD(string))
        }
    }
    
    
    
    
    
    @IBAction func CCC_hide_DDD(_ sender: Any) {
        CCC_postNoty_DDD("MMM_gameRIsClose_NNN", "")
        AAA_GeneralOutModel_BBB.CCC_hideWait_DDD()

        if kkk_type_lll == 0 {
            UIView.CCC_back_DDD()
        }else {
            AAA_webModel_BBB.kkk_share_lll.kkk_gameListView_lll?.CCC_hide_DDD()
            kkk_botConst_lll.constant = -kkk_heightCOnst_lll.constant
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.layoutIfNeeded()
            } completion: { [weak self] Bool in
                self?.removeFromSuperview()
            }
        }
    }
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        AAA_WaitView_BBB.kkk_share_lll.CCC_hide_DDD()
        kkk_aniView_lll?.removeFromSuperview()
        CCC_loadSuc_DDD()
    }
    // FUNCMARK
    // FUNCMARK
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        if kkk_aniView_lll != nil {
            kkk_aniView_lll?.removeFromSuperview()
        }
        kkk_isLoaded_lll = false
    }
    // FUNCMARK
    // FUNCMARK
    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        if kkk_aniView_lll != nil {
            kkk_aniView_lll?.removeFromSuperview()
        }
        kkk_isLoaded_lll = false
    }
    
    
    // FUNCMARK
    // FUNCMARK
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_DestroyStr_NNN") {
            CCC_gobacks_DDD()
        }else if message.name == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_rechargeStr_NNN") || message.name == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_autoRechargeStr_NNN") {
            CCC_showCoinsView_DDD(1)
        }else if message.name == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_clickRechargeStr_NNN") || message.name == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_tapRechargeStr_NNN") {
            CCC_showCoinsView_DDD(3)
        }else if message.name == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_newTppCloseStr_NNN") {
            CCC_gobacks_DDD()
        }else if message.name == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_GameRechargeStr_NNN") {
            CCC_showCoinsView_DDD(3)
        }else if message.name == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_AudioFunStr_NNN") {
            let kkk_array_lll = message.body as! NSArray
            if kkk_array_lll.count > 0{
                let kkk_str_lll = kkk_array_lll.firstObject as! String
                if kkk_str_lll.count != 0 {
                    let kkk_dics_lll = kkk_str_lll.CCC_toDic_DDD()
                    AAA_gameMusicModel_BBB.CCC_musicInfo_DDD(kkk_dics_lll as NSDictionary)
                }
            }
        }else if message.name == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_callHandlerStr_NNN"){
            let kkk_type_lll = (message.body as? String) ?? ""
            if kkk_type_lll == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_closeWindowStr_NNN") {
                CCC_gobacks_DDD()
            }else if kkk_type_lll == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_autoRechargeStr_NNN") {
                CCC_showCoinsView_DDD(1)
            }else if (kkk_type_lll == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_tapRechargeStr_NNN") || kkk_type_lll == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_GameRechargeStr_NNN")) {
                CCC_showCoinsView_DDD(3)
            }else if kkk_type_lll == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_toTaskStr_NNN") {
                AAA_notyCenterModel_BBB.CCC_showTaskView_DDD()
            }else if kkk_type_lll == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_toBackpackStr_NNN") {
                AAA_notyCenterModel_BBB.CCC_showBackpackView_DDD()
            }else {
                let kkk_types_lll = message.body as? NSArray
                if kkk_types_lll != nil && kkk_types_lll!.count == 2 {
                    let kkk_det_lll = kkk_types_lll![0] as! String
                    if kkk_det_lll == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_toDetailsStr_NNN") {
                        let kkk_uid_lll = kkk_types_lll![1] as! String
                        AAA_notyCenterModel_BBB.CCC_showAnchorDetailViewNoty_DDD(Int(kkk_uid_lll)!)
                    }else if kkk_det_lll == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_toChatroomStr_NNN") {
                        if kkk_types_lll!.count > 1 {
                            let kkk_roomId_lll = kkk_types_lll![1] as! String
                            if kkk_roomId_lll.count > 0 {
                                AAA_notyCenterModel_BBB.CCC_joinChatRoomNoty_DDD(Int(kkk_roomId_lll)!)
                            }
                        }
                    }else if kkk_det_lll == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_toLiveRoomStr_NNN") {
                        if kkk_types_lll!.count > 1 {
                            let kkk_roomId_lll = kkk_types_lll![1] as! String
                            if kkk_roomId_lll.count > 0 {
                                AAA_notyCenterModel_BBB.CCC_joinLiveRoomNoty_DDD(Int(kkk_roomId_lll)!)
                            }
                        }
                    }
                }
            }
        }else if message.name == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_GameLoadedStr_NNN") || message.name == AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_OpenGameSuccStr_NNN") {
            CCC_loadSuc_DDD()
        }
    }
    
    func CCC_loadSuc_DDD() {
        if kkk_isLoaded_lll == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                self?.kkk_webs_lll?.evaluateJavaScript(AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_showGameStr_NNN"),completionHandler: { a, err in
                })
            }
        }
    }
    
    func CCC_gobacks_DDD() {
        kkk_roomId_lll = 0
        if kkk_webs_lll != nil && kkk_webs_lll.canGoBack {
            kkk_webs_lll.goBack()
        }else {
            CCC_hide_DDD("")
        }
    }
    func CCC_showCoinsView_DDD(_ type : Int) {
        AAA_notyCenterModel_BBB.CCC_showRechargeViewNoty_DDD(type)
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        
        kkk_webs_lll?.evaluateJavaScript(AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_hideGameStr_NNN"),completionHandler: { a, err in
        })
        CCC_removeNoty_DDD()
    }
    func CCC_hidePlay_DDD() {
        self.removeFromSuperview()
        kkk_aniView_lll?.removeFromSuperview()
        kkk_type_lll = 0
        kkk_playId_lll = 0
        kkk_urlStr_lll = ""
        kkk_roomId_lll = 0
        kkk_isLoaded_lll = false
        kkk_ratio_lll = 0.0
        kkk_webs_lll?.removeFromSuperview()
        kkk_webs_lll = nil
    }
    
    static let kkk_share_lll : AAA_webView_BBB = AAA_webView_BBB.CCC_loadViews_DDD()
}
