//
//  AAA_baseView_BBB.swift
//  Wohoo
//
//  Created by Frankie on 29/08/2024.
//

import UIKit

open class AAA_baseView_BBB: UIView {
    
    
    
    // FUNCMARK
    public var kkk_showView_lll = UIView()
    // FUNCMARK
    // FUNCMARK
    public var kkk_type_lll = 1
    // FUNCMARK
    // FUNCMARK
    //大于1 则点击空白只会关闭键盘
    public var kkk_closeType_lll = 1
    // FUNCMARK
    // FUNCMARK
    
    @objc open func CCC_hide_DDD() {
        if kkk_type_lll == 1 || kkk_type_lll == 3 {
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self = self else {return}
                self.alpha = 0
            }completion: { [weak self] Bool in
                guard let self = self else {return}
                self.removeFromSuperview()
            }
        }else if kkk_type_lll == 2 || kkk_type_lll == 4 {
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self = self else {return}
                self.kkk_showView_lll.y = self.height
            }completion: { [weak self] Bool in
                guard let self = self else {return}
                self.removeFromSuperview()
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    ///1渐变 2底部 3渐变背景 4 底部背景
    open func CCC_show_DDD(_ view : UIView) {
        kkk_showView_lll = self.viewWithTag(0) ?? UIView()
        self.backgroundColor = .clear
        if kkk_type_lll == 1 {
            self.alpha = 0
            view.addSubview(self)
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self = self else {return}
                self.alpha = 1
            }
        }else if kkk_type_lll == 2 {
            kkk_showView_lll.y = self.height
            self.alpha = 1
            view.addSubview(self)
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self = self else {return}
                self.kkk_showView_lll.y = self.height - self.kkk_showView_lll.height
            }
        }else if kkk_type_lll == 3 {
            self.backgroundColor = CCC_colors_DDD(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_232323_color"), 0.6)
            self.alpha = 0
            view.addSubview(self)
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self = self else {return}
                self.alpha = 1
            }
        }else if kkk_type_lll == 4 {
            self.backgroundColor = CCC_colors_DDD(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_232323_color"), 0.6)
            kkk_showView_lll.y = self.height
            self.alpha = 1
            view.addSubview(self)
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self = self else {return}
                self.kkk_showView_lll.y = self.height - self.kkk_showView_lll.height
            }
        }else if kkk_type_lll == 6 {
            self.alpha = 1
            view.addSubview(self)
        }
    }
    // FUNCMARK
    // FUNCMARK
    ///1渐变 2底部 3渐变背景 4 底部背景
    public func CCC_showInTag_DDD(_ view : UIView, _ tag : Int) {
        kkk_showView_lll = self.viewWithTag(0) ?? UIView()
        self.backgroundColor = .clear
        if kkk_type_lll == 1 {
            self.alpha = 0
            view.insertSubview(self, at: tag)
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self = self else {return}
                self.alpha = 1
            }
        }else if kkk_type_lll == 2 {
            kkk_showView_lll.y = self.height
            self.alpha = 1
            view.insertSubview(self, at: tag)
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self = self else {return}
                self.kkk_showView_lll.y = self.height - self.kkk_showView_lll.height
            }
        }else if kkk_type_lll == 3 {
            self.backgroundColor = CCC_colors_DDD(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_232323_color"), 0.6)
            self.alpha = 0
            view.insertSubview(self, at: tag)
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self = self else {return}
                self.alpha = 1
            }
        }else if kkk_type_lll == 4 {
            self.backgroundColor = CCC_colors_DDD(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_232323_color"), 0.6)
            kkk_showView_lll.y = self.height
            self.alpha = 1
            view.insertSubview(self, at: tag)
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self = self else {return}
                self.kkk_showView_lll.y = self.height - self.kkk_showView_lll.height
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    open override func awakeFromNib() {
        super.awakeFromNib()
        CCC_configs_DDD()
        CCC_addNoty_DDD(#selector(CCC_hideNoteView_DDD), "MMM_hideKeyWindShow_NofificationStr_NNN")
    }
    
    @objc func CCC_hideNoteView_DDD(){
        self.CCC_hide_DDD()
    }
    func CCC_configs_DDD() {
        self.frame = CGRectMake(0, 0, kkk_WIDTH_lll, kkk_HEIGHT_lll)
        self.tag = 4
        let kkk_closeBtn_lll = UIButton()
        kkk_closeBtn_lll.backgroundColor = .clear
        kkk_closeBtn_lll.CCC_defaults_DDD(self, #selector(CCC_hideView_DDD))
        kkk_closeBtn_lll.frame = CGRectMake(0, 0, self.width, self.height)
        kkk_closeBtn_lll.tag = 10
        self.insertSubview(kkk_closeBtn_lll, at: 0)
        CCC_addSysNoty_DDD(#selector(CCC_showBoard_DDD), UIResponder.keyboardWillShowNotification)
        CCC_addSysNoty_DDD(#selector(CCC_hideBoard_DDD), UIResponder.keyboardWillHideNotification)
    }
    // FUNCMARK
    // FUNCMARK
    @objc func CCC_hideView_DDD() {
        if kkk_closeType_lll == 1 {
            CCC_hide_DDD()
        }else{
            endEditing(true)
        }
    }
    // FUNCMARK
    // FUNCMARK
    @objc func CCC_showBoard_DDD() {
        kkk_closeType_lll = 2
    }
    // FUNCMARK
    // FUNCMARK
    @objc func CCC_hideBoard_DDD() {
        kkk_closeType_lll = 1
    }
    // FUNCMARK
    
    
}
