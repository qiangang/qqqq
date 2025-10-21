//
//  AAA_FunctionalConflictView_BBB.swift
//  Taleo_General
//
//  Created by Ben on 25/9/2025.
//

import UIKit

public class AAA_FunctionalConflictView_BBB: UIView {
    public typealias kkk_BtnsCallBack_lll = () -> Void

    public var kkk_callBtnab_lll:kkk_BtnsCallBack_lll?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        width = kkk_WIDTH_lll
        height = kkk_HEIGHT_lll
    }
    @IBAction func CCC_continueBtnClick_DDD(_ sender: UIButton) {
        self.kkk_callBtnab_lll?()
        self.removeFromSuperview()
    }
    
    @IBAction func CCC_CancalBtnClick_DDD(_ sender: UIButton) {
        kkk_MakePhoneCallBtn_lll = false
        self.removeFromSuperview()
    }
}
