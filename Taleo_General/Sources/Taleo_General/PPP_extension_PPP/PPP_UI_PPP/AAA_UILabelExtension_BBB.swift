//
//  AAA_UILabelExtension_BBB.swift
//  Module_General
//
//  Created by Frankie on 19/05/2025.
//

import UIKit

public extension UILabel {
    
    func CCC_RMdets_DDD(_ title : String, _ font : Int, _ color : UIColor) {
        CCC_det_DDD(title, font, "")
        self.textColor = color
        self.font = .systemFont(ofSize: CGFloat(font), weight: .bold)
    }
    func CCC_RMdet_DDD(_ title : String, _ font : Int, _ color : String) {
        CCC_det_DDD(title, font, color)
        self.font = AAA_Font_BBB.CCC_RM_DDD(font)
    }
    
    
    
    func CCC_det_DDD(_ title : String, _ font : Int, _ color : String) {
        if title.count > 0 {
            self.text = AAA_GeneralOutModel_BBB.CCC_string_DDD(title)
        }
        if color.count > 6 {
            self.textColor = AAA_GeneralOutModel_BBB.CCC_color_DDD(color)
        }else if color.count == 6 {
            self.textColor = CCC_colors_DDD(color)
        }
        self.font = UIFont.systemFont(ofSize: CGFloat(font))
    }
    
    func CCC_ROdets_DDD(_ title : String, _ font : Int, _ color : UIColor) {
        CCC_det_DDD(title, font, "")
        self.textColor = color
        self.font = .systemFont(ofSize: CGFloat(font), weight: .bold)
    }
    func CCC_MMdet_DDD(_ title : String, _ font : Int, _ color : String) {
        CCC_det_DDD(title, font, color)
        self.font = AAA_Font_BBB.CCC_MM_DDD(font)
    }
    // FUNCMARK
    @IBInspectable var CCC_localLanguage_DDD: String {
        set {
            self.text = AAA_GeneralOutModel_BBB.CCC_string_DDD(newValue)
         }
        get {
            return self.text ?? ""
        }
    }
    
    
    func CCC_ROdet_DDD(_ title : String, _ font : Int, _ color : String) {
        CCC_det_DDD(title, font, color)
        self.font = AAA_Font_BBB.CCC_RO_DDD(font)
    }
    func CCC_RRdet_DDD(_ title : String, _ font : Int, _ color : String) {
        CCC_det_DDD(title, font, color)
        self.font = AAA_Font_BBB.CCC_RR_DDD(font)
    }
    // FUNCMARK
    
}

public class AAA_Font_BBB: NSObject {
    
    // FUNCMARK
    class func CCC_RM_DDD(_ font : Int) -> UIFont {
        return .systemFont(ofSize: CGFloat(font), weight: .semibold)
    }
    // FUNCMARK
    // FUNCMARK
    class func CCC_MM_DDD(_ font : Int) -> UIFont {
        return .systemFont(ofSize: CGFloat(font), weight: .medium)
    }
    // FUNCMARK
    // FUNCMARK
    class func CCC_RA_DDD(_ font : Int) -> UIFont {
        return .systemFont(ofSize: CGFloat(font), weight: .heavy)
    }
    // FUNCMARK
    // FUNCMARK
    class func CCC_RO_DDD(_ font : Int) -> UIFont {
        return .systemFont(ofSize: CGFloat(font), weight: .bold)
    }
    // FUNCMARK
    // FUNCMARK
    class func CCC_RL_DDD(_ font : Int) -> UIFont {
        return .systemFont(ofSize: CGFloat(font), weight: .light)
    }
    // FUNCMARK
    // FUNCMARK
    class func CCC_RR_DDD(_ font : Int) -> UIFont {
        return .systemFont(ofSize: CGFloat(font), weight: .regular)
    }
    // FUNCMARK
    // FUNCMARK
    class func CCC_RB_DDD(_ font : Int) -> UIFont {
        return .systemFont(ofSize: CGFloat(font), weight: .black)
    }
    // FUNCMARK

}
