//
//  AAA_UIDeviceExtension_BBB.swift
//  Module_General
//
//  Created by Frankie on 19/05/2025.
//

import UIKit


public extension UIDevice {
    
    // FUNCMARK
    /// 顶部安全区高度
    static func CCC_safeTop_DDD() -> CGFloat {
        let kkk_scene_lll = UIApplication.shared.connectedScenes.first
        guard let kkk_windowScene_lll = kkk_scene_lll as? UIWindowScene else { return 0 }
        guard let kkk_window_lll = kkk_windowScene_lll.windows.first else { return 0 }
        return kkk_window_lll.safeAreaInsets.top
    }
    // FUNCMARK
    // FUNCMARK
    /// 底部安全区高度
    static func CCC_safeBottom_DDD() -> CGFloat {
        let kkk_scene_lll = UIApplication.shared.connectedScenes.first
        guard let kkk_windowScene_lll = kkk_scene_lll as? UIWindowScene else { return 0 }
        guard let kkk_window_lll = kkk_windowScene_lll.windows.first else { return 0 }
        return kkk_window_lll.safeAreaInsets.bottom
    }
    // FUNCMARK
    // FUNCMARK
    /// 顶部状态栏高度（包括安全区）
    static func CCC_statusBarHeight_DDD() -> CGFloat {
        var statusBarHeight: CGFloat = 20
        if #available(iOS 13.0, *) {
            statusBarHeight = kkk_Window_lll?.safeAreaInsets.top ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }
    
    // FUNCMARK
    // FUNCMARK
    /// 导航栏高度
    static func CCC_barHeight_DDD() -> CGFloat {
        return 44.0
    }
    // FUNCMARK
    // FUNCMARK
    /// 状态栏+导航栏的高度
    static func CCC_naviHeight_DDD() -> CGFloat {
        return UIDevice.CCC_statusBarHeight_DDD() + 44
    }
    // FUNCMARK
    // FUNCMARK
    /// 底部导航栏高度
    static func CCC_tabHeight_DDD() -> CGFloat {
        return 49.0
    }
    // FUNCMARK
    // FUNCMARK
    /// 底部导航栏高度（包括安全区）
    static func CCC_tabsHeight_DDD() -> CGFloat {
        return UIDevice.CCC_tabHeight_DDD() + UIDevice.CCC_safeBottom_DDD()
    }
    // FUNCMARK
}
