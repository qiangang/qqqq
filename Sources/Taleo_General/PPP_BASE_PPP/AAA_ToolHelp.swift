//
//  AAA_ToolHelp.swift
//  Module_General
//
//  Created by Ben on 4/9/2025.
//

import Foundation
import UIKit

@MainActor internal var selfs: UIViewController {
    let Controller = kkk_Window_lll?.rootViewController
    return pushControl(Controller!)
}
@MainActor private func pushControl(_ controllers:UIViewController) -> UIViewController{
    var Controller:UIViewController
    var VC = controllers
    if(VC.presentedViewController != nil) {
        VC = controllers.presentedViewController!
    }
    if controllers.isKind(of:UITabBarController.classForCoder()) {
        Controller = pushControl((controllers as! UITabBarController).selectedViewController!)
    }else if controllers.isKind(of:UINavigationController.classForCoder()){
        Controller = pushControl((controllers as! UINavigationController).visibleViewController!)
    }else{
        Controller = VC
    }
    return Controller
}
public var kkk_MakePhoneCallBtn_lll:Bool = false
