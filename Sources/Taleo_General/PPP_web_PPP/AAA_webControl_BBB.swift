//
//  AAA_webControl_BBB.swift
//  Module_General
//
//  Created by Frankie on 21/05/2025.
//

import UIKit

class AAA_webControl_BBB: AAA_BaseViewController_BBB {
    
    
    var kkk_url_lll = ""
    var kkk_title_lll = ""
    //type为3 需要在退出时发出充值成功的通知
    var kkk_type_lll = 0
    var kkk_webView_lll : AAA_webView_BBB!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        kkk_webView_lll = AAA_webView_BBB.CCC_loadViews_DDD()
        kkk_webView_lll.kkk_urlStr_lll = kkk_url_lll
        kkk_webView_lll.CCC_show_DDD(0)
        kkk_webView_lll.CCC_showTitle_DDD(kkk_title_lll)
        view.addSubview(kkk_webView_lll)
        
        kkk_webView_lll.CCC_loadUrl_DDD()
        
        view.backgroundColor = .white
    }
    

    
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //离开界面移除，防止界面未销毁，收到回调弹出充值页面等功能
        kkk_webView_lll.CCC_removeWebJs_DDD()
        if kkk_type_lll == 3 {
            CCC_postNoty_DDD("MMM_IAPSuccess_NotificationStr_NNN", "")
        }
    }
    // FUNCMARK
    // FUNCMARK
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        kkk_webView_lll.CCC_configWebJs_DDD()
    }
}
