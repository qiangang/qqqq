//
//  AAA_gameTitleCell_BBB.swift
//  Module_General
//
//  Created by Frankie on 12/08/2025.
//

import UIKit

class AAA_gameTitleCell_BBB: UICollectionViewCell {

    @IBOutlet weak var kkk_titleLabel_lll: UIButton!
    @IBOutlet weak var kkk_localView_lll: UIView!
    
    
    var kkk_isSelecteds_lll : Bool! {
        didSet {
            kkk_titleLabel_lll.isSelected = kkk_isSelecteds_lll
            kkk_localView_lll.isHidden = !kkk_isSelecteds_lll
        }
    }

    
    
}
