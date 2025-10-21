


import UIKit




open class AAA_BaseViewController_BBB: AAA_BaseController_BBB {
    
    
    
//    
    public var kkk_naviView_lll = UIView() {
        didSet {
            kkk_naviView_lll.backgroundColor = .clear
        }
    }
    // FUNCMARK
    // FUNCMARK
    public let kkk_navBtnHei_lll = UIDevice.CCC_naviHeight_DDD() - UIDevice.CCC_safeTop_DDD()
    // FUNCMARK
    // FUNCMARK
    let kkk_navSafeHei_lll = UIDevice.CCC_safeTop_DDD()
    // FUNCMARK
    // FUNCMARK
    public let kkk_titlesLabel_lll = UILabel()
    // FUNCMARK
    // FUNCMARK
    public let kkk_btn_lll = UIButton()
    // FUNCMARK
    // FUNCMARK
//    
    
    
    deinit {
        CCC_removeNoty_DDD()
        let kkk_className_lll = String(describing: type(of: self))
        print("``````````````",kkk_className_lll,"```remove noty")
    }
    
    // FUNCMARK
    // FUNCMARK
    @objc open func CCC_back_DDD() {
        navigationController?.popViewController(animated: true)
    }
    // FUNCMARK
    // FUNCMARK
    @objc func CCC_dis_DDD() {
        navigationController?.dismiss(animated: true)
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_pushs_DDD(_ con : UIViewController) {
        let kkk_tabs_lll = kkk_Window_lll?.rootViewController
        if kkk_tabs_lll != nil {
            if kkk_tabs_lll!.isKind(of: UITabBarController.self) {
                
                let kkk_navis_lll : UINavigationController = (kkk_tabs_lll as! UITabBarController).selectedViewController as! UINavigationController
                kkk_navis_lll.pushViewController(con , animated: true)
            }else if kkk_tabs_lll!.isKind(of: UINavigationController.self) {
                (kkk_tabs_lll as! UINavigationController).pushViewController(con , animated: true)
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_present_DDD(_ con : UIViewController) {
        let kkk_tabs_lll = kkk_Window_lll?.rootViewController
        if kkk_tabs_lll != nil {
            if kkk_tabs_lll!.isKind(of: UITabBarController.self) {
                
                let kkk_navis_lll : UINavigationController = (kkk_tabs_lll as! UITabBarController).selectedViewController as! UINavigationController
                kkk_navis_lll.present(con, animated: true)
            }else if kkk_tabs_lll!.isKind(of: UINavigationController.self) {
                (kkk_tabs_lll as! UINavigationController).present(con, animated: true)
            }
        }
    }
    
    open func CCC_title_DDD(_ string : String) {}
    // FUNCMARK
    // FUNCMARK
    func CCC_naviPush_DDD(_ con : UIViewController) {
        self.navigationController?.pushViewController(con, animated: true)
    }
    // FUNCMARK
    // FUNCMARK
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //移除举报UI
        AAA_notyCenterModel_BBB.CCC_closeOtherMiniWimdowNoty_DDD()
    }
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if self.isMovingFromParent {
            CCC_dismiss_DDD()
        } else if self.isBeingDismissed {
            CCC_dismiss_DDD()
        } else if let navigationController = self.navigationController,!navigationController.viewControllers.contains(self) {
            CCC_dismiss_DDD()
        }
    }
    
    open func CCC_dismiss_DDD() {
        
    }
    
}

