//
//  AAA_UIBUttonExtension_BBB.swift
//  Module_General
//
//  Created by Frankie on 19/05/2025.
//

import UIKit
import SDWebImage


public extension UIButton {
    
    // FUNCMARK
    @IBInspectable var CCC_localLanguage_DDD: String {
        set {
            self.setTitle(AAA_GeneralOutModel_BBB.CCC_string_DDD(newValue), for: .normal)
        }
        get {
            return self.titleLabel?.text ?? ""
        }
    }
    
    @IBInspectable var kkk_localImage_lll: String {
        set {
            self.setImage(UIImage.CCC_localImage_DDD(newValue), for: .normal)
        }
        get {
            return ""
        }
    }
    // FUNCMARK
    // FUNCMARK
    @IBInspectable var kkk_selImage_lll: String {
        set {
            self.setImage(UIImage.CCC_localImage_DDD(newValue), for: .selected)
        }
        get {
            return ""
        }
    }
    // FUNCMARK
    // FUNCMARK
    @IBInspectable var kkk_backImage_lll: String {
        set {
            self.setBackgroundImage(UIImage.CCC_localImage_DDD(newValue), for: .normal)
        }
        get {
            return ""
        }
    }
    // FUNCMARK
    // FUNCMARK
    @IBInspectable var kkk_backSelImage_lll: String {
        set {
            self.setBackgroundImage(UIImage.CCC_localImage_DDD(newValue), for: .selected)
        }
        get {
            return ""
        }
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_images_DDD(_ image : String) {
        self.setImage(UIImage.CCC_localImage_DDD(image), for: .normal)
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_familyImage_DDD(_ image : Int) {
        if image >= 4 {
            self.kkk_localImage_lll = "MMM_familyLevelFourthImage_NNN"
        }else if image == 3 {
            self.kkk_localImage_lll = "MMM_familyLevelThirdImage_NNN"
        }else if image == 2 {
            self.kkk_localImage_lll = "MMM_familyLevelSecondImage_NNN"
        }else {
            self.kkk_localImage_lll = "MMM_familyLevelFirstImage_NNN"
        }
    }
    // FUNCMARK
    // FUNCMARK
    // FUNCMARK
    // FUNCMARK
    func CCC_selectImages_DDD(_ image : String) {
        self.setImage(UIImage.CCC_localImage_DDD(image), for: .selected)
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_sameImage_DDD(_ image : String, _ wid : CGFloat) {
        CCC_images_DDD(image)
        self.imageEdgeInsets = UIEdgeInsets(top: self.height/2 - wid/2, left: self.width/2 - wid/2, bottom: self.height/2 - wid/2, right: self.width/2 - wid/2)
    }
    // FUNCMARK
    // FUNCMARK
    
    func CCC_image_DDD(_ image : String, _ placeholder : String) {
        if image.count > 0 {
            let kkk_url_lll = URL(string: image)
            self.sd_setImage(with: kkk_url_lll, for: .normal, placeholderImage: UIImage.CCC_localImage_DDD(placeholder))
        }else{
            self.setImage(UIImage.CCC_localImage_DDD(placeholder), for: .normal)
        }
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_images_DDD(_ image : String, _ placeImage : UIImage) {
        if image.count > 0 {
            let kkk_url_lll = URL(string: image)
            self.sd_setImage(with: kkk_url_lll, for: .normal, placeholderImage: placeImage)
        }else{
            self.setImage(placeImage, for: .normal)
        }
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_avatar_DDD(_ avatar : String) {
        if avatar.count > 0 {
            let kkk_url_lll = URL(string: avatar)
            if self.imageView?.image != nil {
                self.sd_setImage(with: kkk_url_lll, for: .normal, placeholderImage: UIImage.CCC_localImage_DDD("MMM_headPlaceHolder_NNN"))
            }else {
                self.sd_setImage(with: kkk_url_lll, for: .normal, placeholderImage: UIImage.CCC_localImage_DDD("MMM_headPlaceHolder_NNN"))
            }
        }else{
            self.setImage(UIImage.CCC_localImage_DDD("MMM_headPlaceHolder_NNN"), for: .normal)
        }
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_imageUrl_DDD(_ image : String) {
        if image.count > 0 {
            let kkk_url_lll = URL(string: image)
            self.sd_setImage(with: kkk_url_lll, for: .normal, placeholderImage: UIImage())
        }else{
            self.setImage(UIImage(), for: .normal)
        }
    }
    // FUNCMARK
    // FUNCMARK
    @IBInspectable var CCC_imageContentMode_DDD:Int{
        set {
            imageView?.contentMode = UIView.ContentMode(rawValue: newValue)!
        }
        get {
            return imageView!.contentMode.rawValue
        }
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_defaults_DDD(_ target: Any, _ sel : Selector) {
        self.adjustsImageWhenHighlighted = false
        self.backgroundColor = .clear
        self.addTarget(target, action:sel, for: .touchUpInside)
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_defaultBtns_DDD(_ round : CGFloat, _ image : String) {
        self.adjustsImageWhenHighlighted = false
        self.backgroundColor = .clear
        if round != 0 {
            self.layer.cornerRadius = round
            self.clipsToBounds = true
            self.layer.masksToBounds = true
        }
        if image.count > 0 {
            kkk_localImage_lll = image
        }
    }
    
    
    
    func CCC_titleRO_DDD(_ title : String, _ font : Int, _ color : UIColor) {
        var kkk_str_lll = AAA_GeneralOutModel_BBB.CCC_string_DDD(title)
        if kkk_str_lll.count == 0 {
            kkk_str_lll = title
        }
        self.setTitle(kkk_str_lll, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = AAA_Font_BBB.CCC_RO_DDD(font)
    }
    
    func CCC_titleRM_DDD(_ title : String, _ font : Int, _ color : UIColor) {
        var kkk_str_lll = AAA_GeneralOutModel_BBB.CCC_string_DDD(title)
        if kkk_str_lll.count == 0 {
            kkk_str_lll = title
        }
        self.setTitle(kkk_str_lll, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = AAA_Font_BBB.CCC_MM_DDD(font)
    }
    
    
    func CCC_backImages_DDD(_ image : String) {
        self.setBackgroundImage(UIImage.CCC_localImage_DDD(image), for: .normal)
    }
    
    
    
    func CCC_avatar_DDD(_ avatar : String, _ kkk_widths_lll : CGFloat) {
        if avatar.count > 0 {
            let kkk_url_lll = URL(string: avatar)
            if self.imageView?.image != nil {
                self.sd_setImage(with: kkk_url_lll, for: .normal)
            }else {
                self.sd_setImage(with: kkk_url_lll, for: .normal, placeholderImage: UIImage.CCC_localImage_DDD("MMM_headPlaceHolder_NNN"))
            }
        }else{
            self.setImage(UIImage.CCC_localImage_DDD("MMM_headPlaceHolder_NNN"), for: .normal)
        }
    }
    
    private func CCC_normal_DDD(_ image : String, _ imageWidth : CGFloat? = 0, _ placeholder : String? = "", _ imageHeight : CGFloat? = 0, suc:@escaping (_ press : CGFloat)->Void) {
        var kkk_img_lll : UIImage? = nil
        if placeholder!.count != 0 {
            kkk_img_lll = UIImage.CCC_localImage_DDD(placeholder!)
        }
        if image.count > 0 {
            let kkk_url_lll = URL(string: image)
            self.sd_setImage(with: kkk_url_lll, for: .normal, placeholderImage: kkk_img_lll) { receivedSize, totalSize, url in
                DispatchQueue.main.async {
                    suc(CGFloat(receivedSize)/CGFloat(totalSize))
                }
            } completed: { image, error, type, url in
                DispatchQueue.main.async { [weak self] in
                    self?.setImage(image, for: .normal)
                    suc(1)
                }
            }
            
        }else{
            if placeholder!.count > 0 {
                kkk_localImage_lll = placeholder!
            }
        }
    }
    
}


