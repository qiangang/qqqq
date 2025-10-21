//
//  ShowBaseView.swift
//  Viddi
//
//  Created by Frankie on 2024/1/15.
//

import UIKit

open class AAA_ShowBaseView_BBB: UIView {
    
    
    
    // FUNCMARK
    public let kkk_alpView_lll = UIButton()
    // FUNCMARK
    // FUNCMARK
    open var kkk_showView_lll : UIView?
    // FUNCMARK
    // FUNCMARK
    open var kkk_type_lll = 1
    // FUNCMARK
    open var kkk_hideBlock_lll:(()->Void)?
    // FUNCMARK
    @objc open func CCC_hide_DDD() {
        kkk_hideBlock_lll?()
        if kkk_type_lll == 1 || kkk_type_lll == 4 {
            UIView.animate(withDuration: 0.25) {[weak self] in
                self?.alpha = 0
            }completion: {[weak self] Bool in
                self?.removeFromSuperview()
            }
        }else if kkk_type_lll == 2 {
            UIView.animate(withDuration: 0.25) {[weak self] in
                self?.kkk_alpView_lll.alpha = 0
                self?.kkk_showView_lll!.y = self!.height
            }completion: {[weak self] Bool in
                self?.removeFromSuperview()
            }
        }else if kkk_type_lll == 3 {
            UIView.animate(withDuration: 0.25) {[weak self] in
                self?.kkk_alpView_lll.alpha = 0
                self?.kkk_showView_lll!.y = self!.height
            }completion: {[weak self] Bool in
                self?.removeFromSuperview()
            }
        }else if kkk_type_lll == 5 {
            UIView.animate(withDuration: 0.25) {[weak self] in
                self?.alpha = 0
            }completion: {[weak self] Bool in
                self?.removeFromSuperview()
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    open func CCC_show_DDD() {
        CCC_show_DDD(onView: kkk_Window_lll)
    }
    // FUNCMARK
    // FUNCMARK
    //1 背景渐隐出现 2背景底部 3底部 4渐隐出现
    open func CCC_show_DDD(onView:UIView?) {
        kkk_alpView_lll.backgroundColor = CCC_colors_DDD(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_000000_color"), 0.7)
        if kkk_type_lll == 1 {
            kkk_alpView_lll.backgroundColor = CCC_colors_DDD(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_0E0F10_color"), 0.7)
            self.alpha = 0
            onView?.addSubview(self)
            UIView.animate(withDuration: 0.25) {[weak self] in
                self?.alpha = 1
            }
        }else if kkk_type_lll == 2 {
            kkk_alpView_lll.backgroundColor = CCC_colors_DDD(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_0E0F10_color"), 0.7)
            kkk_showView_lll!.y = self.height
            kkk_alpView_lll.alpha = 0
            onView?.addSubview(self)
            UIView.animate(withDuration: 0.25) {[weak self] in
                self?.kkk_alpView_lll.alpha = 1
                self?.kkk_showView_lll!.y = self!.height - self!.kkk_showView_lll!.height
            }
        }else if kkk_type_lll == 3 {
            kkk_alpView_lll.backgroundColor = .clear
            kkk_showView_lll!.y = self.height
            kkk_alpView_lll.alpha = 0
            onView?.addSubview(self)
            UIView.animate(withDuration: 0.25) {[weak self] in
                self?.kkk_alpView_lll.alpha = 1
                self?.kkk_showView_lll!.y = self!.height - self!.kkk_showView_lll!.height
            }
        }else if kkk_type_lll == 4 {
            kkk_alpView_lll.backgroundColor = .clear
            kkk_alpView_lll.alpha = 0
            onView?.addSubview(self)
            UIView.animate(withDuration: 0.25) {[weak self] in
                self?.kkk_alpView_lll.alpha = 1
            }
        }else if kkk_type_lll == 5 {
            kkk_alpView_lll.backgroundColor = .clear
            self.alpha = 0
            onView?.addSubview(self)
            UIView.animate(withDuration: 0.25) {[weak self] in
                self?.alpha = 1
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    open func CCC_configInitView_DDD() {
        kkk_alpView_lll.frame = self.frame
        kkk_alpView_lll.CCC_defaults_DDD(self, #selector(CCC_hide_DDD))
        kkk_alpView_lll.backgroundColor = CCC_colors_DDD(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_0E0F10_color"), 0.7)
     
        self.addSubview(kkk_alpView_lll)
    }
    // FUNCMARK
    // FUNCMARK
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRectMake(0, 0, UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        self.backgroundColor = .clear
        CCC_configInitView_DDD()
        CCC_addNoty_DDD(#selector(CCC_hide_DDD), "MMM_ClosePopover_NNN")
    }
    // FUNCMARK
    // FUNCMARK
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // FUNCMARK
    // FUNCMARK
    open func CCC_loadShowView_DDD() {
        if kkk_showView_lll == nil {
            kkk_showView_lll = UIView()
            kkk_showView_lll?.frame = self.frame
            self.addSubview(kkk_showView_lll!)
        }
    }
    // FUNCMARK
    // FUNCMARK
    open func CCC_showViewRoundTop_DDD() {
        kkk_showView_lll?.CCC_round_DDD(24)
        kkk_showView_lll!.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    // FUNCMARK
    
}
