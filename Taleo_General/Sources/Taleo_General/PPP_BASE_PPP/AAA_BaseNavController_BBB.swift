//
//  BaseNavitionController.swift
//  YuzhanSinatv
//
//  Created by Ben on 25/6/2024.
//

import UIKit

public class AAA_BaseNavController_BBB: UINavigationController {
    private var kkk_isBlock_lll: Bool = true
    private var kkk_tabBarIsShow_lll: Bool = false
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
        let naviBar = self.navigationBar
        
        let emptyImg = UIImage.init()
        naviBar.shadowImage = emptyImg
        naviBar.setBackgroundImage(emptyImg, for: .default)
        
        self.navigationBar.isHidden = true
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        sendAlphaViewToBack()
        
    }
    
    public override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
    
    private func sendAlphaViewToBack() {
        self.view.bringSubviewToFront(self.navigationBar)
    }
    internal func updateNavigationView(){
        if self.topViewController?.isKind(of: AAA_BaseController_BBB.self) == true {
            let v = self.topViewController! as! AAA_BaseController_BBB
            
            let kkk_array_lll = [
                "AAA_UserPhotoWallImgController_BBB",
                "AAA_MyWalletController_BBB",
                "AAA_webControl_BBB",
                "AAA_ChatListController_BBB",
            ]
            
            kkk_isBlock_lll = true
            var kkk_hideNavi_lll = false
            let kkk_className_lll = String(describing: type(of: v))
            if kkk_className_lll == "AAA_VideoShowController_BBB" {
                kkk_isBlock_lll = false
                kkk_hideNavi_lll = true
            }else if kkk_array_lll.contains(kkk_className_lll) {
                kkk_hideNavi_lll = true
            }else if self.children.count == 1 {
                kkk_hideNavi_lll = true
            }
            
            self.setNavigationBarHidden(kkk_hideNavi_lll, animated: true)
            sendAlphaViewToBack()
        }
    }
    
    
}
extension AAA_BaseNavController_BBB:UINavigationControllerDelegate{
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = self.viewControllers.count > 0 ? true : false
        super.pushViewController(viewController, animated: animated)
    }
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool){
        if viewController is AAA_BaseController_BBB{
            if let vc = viewController as? AAA_BaseController_BBB{
                
                kkk_isBlock_lll = true
                var kkk_hideNavi_lll = false
                let kkk_className_lll = String(describing: type(of: self))
                if kkk_className_lll == "AAA_VideoShowController_BBB" {
                    kkk_isBlock_lll = false
                    kkk_hideNavi_lll = true
                }
                if self.children.count != 1 {
                    kkk_hideNavi_lll = true
                }
//                navigationController.setNavigationBarHidden(kkk_hideNavi_lll, animated: animated)
                
                if animated{
                    UIView.animate(withDuration: 0.35) {
                        self.sendAlphaViewToBack()
                    }
                }else{
                    self.sendAlphaViewToBack()
                }
            }
        }
    }
    
    
    
    
}
extension AAA_BaseNavController_BBB:UIGestureRecognizerDelegate{
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return kkk_isBlock_lll
    }
}
