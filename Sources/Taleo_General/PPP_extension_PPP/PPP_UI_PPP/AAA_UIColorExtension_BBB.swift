//
//  AAA_UIColorExtension_BBB.swift
//  Module_General
//
//  Created by Frankie on 19/05/2025.
//

import UIKit


public func CCC_CGcolor_DDD(_ color : String, _ alpha : CGFloat? = 1) -> CGColor {
    return CCC_colors_DDD(color, alpha).cgColor
}
// FUNCMARK
// FUNCMARK
public func CCC_colors_DDD(_ color : String, _ alpha : CGFloat? = 1) -> UIColor {
    if color.count < 6 {
        return .clear
    }
    let kkk_color1_lll = color.CCC_substring_DDD(start: 0, 2)
    let kkk_num1_lll = UInt8(kkk_color1_lll, radix: 16) ?? 0
    let kkk_color2_lll = color.CCC_substring_DDD(start: 2, 4)
    let kkk_num2_lll = UInt8(kkk_color2_lll, radix: 16) ?? 0
    let kkk_color3_lll = color.CCC_substring_DDD(start: 4, 6)
    let kkk_num3_lll = UInt8(kkk_color3_lll, radix: 16) ?? 0
    let kkk_carve_lll = UIColor(red: CGFloat(kkk_num1_lll)/255.0, green: CGFloat(kkk_num2_lll)/255.0, blue: CGFloat(kkk_num3_lll)/255.0, alpha: alpha!)
    return kkk_carve_lll
}
// FUNCMARK
