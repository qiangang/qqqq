//
//  AAA_AlertView_BBB.swift
//  Wohoo
//
//  Created by Rory on 2024/8/27.
//

import UIKit

class AAA_AlertView_BBB : AAA_ShowBaseView_BBB {
    
    
    // FUNCMARK
    private var kkk_actions_lll:(()->Void)? = nil
    // FUNCMARK
    // FUNCMARK
    private var kkk_actionCancel_lll:(()->Void)? = nil
    // FUNCMARK
    // FUNCMARK
    private var kkk_types_lll = 0
    // FUNCMARK
    // FUNCMARK
    private var kkk_contentLabel_lll : UILabel!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        kkk_type_lll = 4
        CCC_addNoty_DDD(#selector(CCC_hideNoteView_DDD), "MMM_hideKeyWindShow_NofificationStr_NNN")
    }
    
    @objc func CCC_hideNoteView_DDD(){
        self.removeFromSuperview()
    }
    // FUNCMARK
    // FUNCMARK
    
    init(_ icon : String, _ iconUrls : String, _ title : String, _ content : String, _ confirm : String, _ cancel : String, actionTop:(()->Void)? = nil, action:(()->Void)? = nil) {
        
        super.init(frame: CGRectMake(0, 0, kkk_WIDTH_lll, kkk_HEIGHT_lll))
        kkk_actions_lll = actionTop
        kkk_actionCancel_lll = action
        
        //白色底板
        kkk_showView_lll = UIView()
        kkk_showView_lll?.frame = CGRectMake(38, 0, kkk_WIDTH_lll - 76, 20)
        kkk_showView_lll?.CCC_round_DDD(24)
        kkk_showView_lll?.backgroundColor = .white
        self.addSubview(kkk_showView_lll!)
        
        //图标
        var kkk_y_lll = CCC_images_DDD(icon, iconUrls)
        //标题
        kkk_y_lll = CCC_titles_DDD(title, kkk_y_lll, 16)
        //详情
        kkk_y_lll = CCC_titles_DDD(content, kkk_y_lll, 14)
        //确认按钮
        kkk_y_lll = CCC_buttons_DDD(confirm, "MMM_loginButtonBg_NNN", kkk_y_lll, 1, true)
        if cancel.count > 0 {
            //取消按钮，没有文本则不显示
            kkk_y_lll = CCC_buttons_DDD(cancel, "", kkk_y_lll, 2, false)
        }else {
            kkk_y_lll += 10
        }
        if kkk_contentLabel_lll.text?.count == 0 {
            kkk_contentLabel_lll.text = content
        }
        kkk_y_lll -= 10
        
        kkk_showView_lll?.frame = CGRectMake(38, kkk_HEIGHT_lll/2 - kkk_y_lll/2, kkk_WIDTH_lll - 76, kkk_y_lll)
        CCC_show_DDD()
    }
    // FUNCMARK
    // FUNCMARK
    private func CCC_titles_DDD(_ str : String, _ y : CGFloat, _ font : Int) -> CGFloat {
        if str.count == 0 {
            return y
        }
        let kkk_label_lll = UILabel()
        kkk_label_lll.frame = CGRectMake(10, y, kkk_showView_lll!.width - 20, 500)
        kkk_label_lll.CCC_RMdet_DDD(str, font, AAA_StringModel_BBB.CCC_checkStr_DDD("color_111111_color"))
        if kkk_label_lll.text!.count == 0 {
            kkk_label_lll.text = str
        }
        kkk_label_lll.textAlignment = .center
        kkk_label_lll.numberOfLines = 0
        kkk_label_lll.sizeToFit()
        kkk_label_lll.frame = CGRectMake(10, y, kkk_showView_lll!.width - 20, kkk_label_lll.height)
        kkk_showView_lll!.addSubview(kkk_label_lll)
        kkk_contentLabel_lll = kkk_label_lll
        return kkk_label_lll.bottom + 20
    }
    // FUNCMARK
    // FUNCMARK
    private func CCC_buttons_DDD(_ title : String,_ image : String, _ y : CGFloat, _ tag : Int, _ back : Bool) -> CGFloat {
        if title.count == 0 {
            return y
        }
        let kkk_btn_lll = UIButton()
        kkk_btn_lll.frame = CGRectMake(33, y, kkk_showView_lll!.width - 66, 46)
        kkk_btn_lll.CCC_rounds_DDD(23)
        kkk_btn_lll.CCC_backImages_DDD(image)
        kkk_btn_lll.CCC_defaults_DDD(self, #selector(CCC_click_DDD(_ :)))
        if back == true {
            kkk_btn_lll.CCC_titleRO_DDD(title, 14, .black)
        }else {
            kkk_btn_lll.CCC_titleRO_DDD(title, 14, CCC_colors_DDD(AAA_StringModel_BBB.CCC_checkStr_DDD("color_A1A1A1_color")))
        }
        kkk_btn_lll.tag = tag
        kkk_showView_lll!.addSubview(kkk_btn_lll)
        return kkk_btn_lll.bottom + 10
    }
    // FUNCMARK
    // FUNCMARK
    @objc func CCC_click_DDD(_ sender : UIButton) {
        if sender.tag == 1 {
            kkk_actions_lll?()
        }else {
            kkk_actionCancel_lll?()
        }
        CCC_hide_DDD()
    }
    // FUNCMARK
    // FUNCMARK
    private func CCC_images_DDD(_ icon : String, _ iconUrls : String) -> Double {
        let kkk_imgs_lll = UIImageView()
        kkk_imgs_lll.frame = CGRectMake((kkk_showView_lll!.width - 92)/2, 20, 92, 92)
        kkk_imgs_lll.CCC_round_DDD(20)
        kkk_showView_lll?.addSubview(kkk_imgs_lll)
        if icon.count > 0 {
            kkk_imgs_lll.kkk_localImage_lll = icon
            return 130
        }else if iconUrls.count > 0 {
            kkk_imgs_lll.CCC_imageUrl_DDD(iconUrls)
            return 130
        }
        return 20
    }
    // FUNCMARK
    // FUNCMARK
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // FUNCMARK
    
    
}


