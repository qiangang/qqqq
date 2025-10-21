//
//  AAA_giftNumSelView_BBB.swift
//  Wohoo
//
//  Created by Frankie on 13/03/2025.
//

import UIKit


public protocol MMM_giftNumSelViewDelegate_NNN : AnyObject {
    func CCC_giftNumsChange_DDD(_ text : String)
    func CCC_giftNumsHide_DDD()
}



public class AAA_giftNumSelView_BBB: AAA_ShowBaseView_BBB {

    
    public weak var kkk_delegate_lll : MMM_giftNumSelViewDelegate_NNN!
    
    public var kkk_isChat_lll = false
    
    
    
    
    deinit {
        print("``````````````````````````",String(describing: type(of: self)),"` deinit")
        
        CCC_removeNoty_DDD()
    }
    
    
    public init(_ isChat : Bool) {
        super.init(frame: CGRectMake(0, 0, kkk_WIDTH_lll, kkk_HEIGHT_lll))
        kkk_isChat_lll = true
        
        kkk_type_lll = 5
        
        kkk_showView_lll = UIView()
        if kkk_isChat_lll == false {
            kkk_showView_lll!.backgroundColor = CCC_colors_DDD(AAA_StringModel_BBB.CCC_checkStr_DDD("color_333333_color"), 0.95)
        }else {
            kkk_showView_lll!.backgroundColor = CCC_colors_DDD("F7BF49")// CCC_colors_DDD(AAA_StringModel_BBB.CCC_checkStr_DDD("color_F5F5F5_color"))
        }
        kkk_showView_lll!.frame = CGRectMake(kkk_WIDTH_lll - 136, kkk_HEIGHT_lll - UIDevice.CCC_safeBottom_DDD() - 44 - 165, 120, 165)
        kkk_showView_lll!.CCC_round_DDD(16)
        if kkk_isChat_lll == false {
            kkk_showView_lll!.layer.borderWidth = 1
            kkk_showView_lll!.layer.borderColor = CCC_CGcolor_DDD(AAA_StringModel_BBB.CCC_checkStr_DDD("color_FFFFFF_color"), 0.2)
        }
        self.addSubview(kkk_showView_lll!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        kkk_type_lll = 5
        
        kkk_showView_lll = UIView()
        if kkk_isChat_lll == false {
            kkk_showView_lll!.backgroundColor = CCC_colors_DDD(AAA_StringModel_BBB.CCC_checkStr_DDD("color_333333_color"), 0.95)
        }else {
            kkk_showView_lll!.backgroundColor = CCC_colors_DDD(AAA_StringModel_BBB.CCC_checkStr_DDD("color_F5F5F5_color"))
        }
        kkk_showView_lll!.frame = CGRectMake(kkk_WIDTH_lll - 136, kkk_HEIGHT_lll - UIDevice.CCC_safeBottom_DDD() - 44 - 165, 120, 165)
        kkk_showView_lll!.CCC_round_DDD(16)
        if kkk_isChat_lll == false {
            kkk_showView_lll!.layer.borderWidth = 1
            kkk_showView_lll!.layer.borderColor = CCC_CGcolor_DDD(AAA_StringModel_BBB.CCC_checkStr_DDD("color_FFFFFF_color"), 0.2)
        }
        self.addSubview(kkk_showView_lll!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var kkk_array_lll : NSArray! {
        didSet {
            for i in 1...kkk_array_lll.count {
                let kkk_view_lll = kkk_showView_lll!.viewWithTag(i)
                if kkk_view_lll == nil {
                    if i == kkk_array_lll.count {
                        CCC_addInfo_DDD(i, false, kkk_array_lll[i-1] as! String)
                    }else {
                        CCC_addInfo_DDD(i, true, kkk_array_lll[i-1] as! String)
                    }
                }
            }
            kkk_showView_lll!.y = kkk_HEIGHT_lll - UIDevice.CCC_safeBottom_DDD() - 46 - CGFloat(33*kkk_array_lll.count)
            kkk_showView_lll!.height = CGFloat(33*kkk_array_lll.count)
        }
    }
    public func CCC_show_DDD(_ array : NSArray, _ view : UIView) {
        kkk_array_lll = array
        super.CCC_show_DDD(onView: view)
    }
    
    func CCC_addInfo_DDD(_ num : Int, _ line : Bool, _ name : String) {
        let kkk_btn_lll = UIButton()
        kkk_btn_lll.tag = num
        kkk_btn_lll.setTitle(name, for: .normal)
        kkk_btn_lll.adjustsImageWhenHighlighted = false
        kkk_btn_lll.backgroundColor = .clear
        kkk_btn_lll.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        kkk_btn_lll.frame = CGRectMake(0, CGFloat(num * 33) - 33, 120, 33)
        kkk_btn_lll.addTarget(self, action: #selector(CCC_changeNumSender_DDD(_ :)), for: .touchUpInside)
        kkk_btn_lll.setTitleColor(.white, for: .normal)
        kkk_showView_lll!.addSubview(kkk_btn_lll)
        
        if line == true {
            let kkk_lineView_lll = UIView()
            if kkk_isChat_lll == false {
                kkk_lineView_lll.backgroundColor = CCC_colors_DDD(AAA_StringModel_BBB.CCC_checkStr_DDD("color_FFFFFF_color"), 0.2)
            }else {
                kkk_lineView_lll.backgroundColor = CCC_colors_DDD("FFFAE6")
            }
            kkk_lineView_lll.frame = CGRectMake(10, CGFloat(num * 33) - 1, 100, 1)
            kkk_showView_lll!.addSubview(kkk_lineView_lll)
        }
    }
    
    @objc func CCC_changeNumSender_DDD(_ sender : UIButton) {
        CCC_hide_DDD()
        kkk_delegate_lll?.CCC_giftNumsChange_DDD(sender.titleLabel!.text!)
    }
    public override func CCC_hide_DDD() {
        super.CCC_hide_DDD()
        kkk_delegate_lll?.CCC_giftNumsHide_DDD()
    }
}
