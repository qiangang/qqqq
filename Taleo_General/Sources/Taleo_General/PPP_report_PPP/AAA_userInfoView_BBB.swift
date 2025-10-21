//
//  AAA_userInfoView_BBB.swift
//  Wohoo_SDK
//
//  Created by Frankie on 05/03/2025.
//

import UIKit

class AAA_userInfoView_BBB: UIView {
    
    @IBOutlet weak var kkk_genderView_lll: UIView!
    @IBOutlet weak var kkk_genderIcon_lll: UIImageView!
    @IBOutlet weak var kkk_ageLabel_lll: UILabel!
    

    @IBOutlet weak var kkk_avatarView_lll: UIImageView!
    
    @IBOutlet weak var kkk_nameLabel_lll: UILabel!
    @IBOutlet weak var kkk_idLabel_lll: UILabel!
    
    @IBAction func CCC_copySender_DDD(_ sender: Any) {
        let kkk_past_lll = UIPasteboard.general
        kkk_past_lll.string = kkk_idLabel_lll.text
        AAA_GeneralOutModel_BBB.CCC_showTitle_DDD("MMM_SuccessStr_NNN")
    }
    
    
    func CCC_info_DDD(_ avatar : String,_ name : String,_ uid : String,_ gender:Int, _ age:Int) {
        if CCC_IsNullString_DDD(avatar){
            
        }else{
            kkk_avatarView_lll.CCC_avatar_DDD(avatar)
        }
        kkk_nameLabel_lll.text = name
        kkk_idLabel_lll.text = uid
        kkk_ageLabel_lll.text = "\(age)"
        kkk_genderView_lll.isHidden = age == 0
        if gender == 1 {
            kkk_genderIcon_lll.kkk_localImage_lll = "MMM_maleIcon_NNN"
            kkk_genderView_lll.CCC_getLightlightColor_DDD(.Left, [CCC_colors_DDD("5236FF").cgColor,CCC_colors_DDD("8692FF").cgColor])
        } else {
            kkk_genderIcon_lll.kkk_localImage_lll = "MMM_femaleIcon_NNN"
            kkk_genderView_lll.CCC_getLightlightColor_DDD(.Left, [CCC_colors_DDD("FF264D").cgColor,CCC_colors_DDD("FF2D92").cgColor])

        }
    }
}
