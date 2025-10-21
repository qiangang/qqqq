//
//  AAA_mutableAttributeExtension_BBB.swift
//  Module_General
//
//  Created by Frankie on 21/05/2025.
//

import UIKit
import SDWebImage



public extension NSMutableAttributedString {
    
    // FUNCMARK
    func CCC_addAtt_DDD(_ font : UIFont, _ col : UIColor, _ msg : String) {
        let kkk_msgAtt_lll = NSMutableAttributedString(string: msg)
        let kkk_range_lll = NSRange(location: 0, length: msg.utf16.count)
        kkk_msgAtt_lll.addAttribute(.font, value: font, range: kkk_range_lll)
        kkk_msgAtt_lll.addAttribute(.foregroundColor, value: col, range: kkk_range_lll)
        if kkk_range_lll.length == 0 {
            kkk_msgAtt_lll.addAttribute(.font, value: font, range: NSRange(location: 0, length: msg.utf16.count))
            kkk_msgAtt_lll.addAttribute(.foregroundColor, value: col, range: NSRange(location: 0, length: msg.count))
        }
        self.insert(kkk_msgAtt_lll, at: 0)
    }
    // FUNCMARK
    // FUNCMARK
    
    func CCC_addImg_DDD(_ image : String, _ y : CGFloat, _ size : CGSize){
        let kkk_msgAtt_lll = NSMutableAttributedString(string: " ")
        let kkk_attach_lll = NSTextAttachment()
        if image.contains("/") == true {
            kkk_attach_lll.image = UIImage(contentsOfFile: image)
        }else {
            kkk_attach_lll.image = UIImage.CCC_localImage_DDD(image)
        }
        kkk_attach_lll.bounds = CGRectMake(0, y, size.width, size.height)
        let kkk_imgsAttach_lll = NSMutableAttributedString(attachment: kkk_attach_lll)
        kkk_msgAtt_lll.insert(kkk_imgsAttach_lll, at: 0)
        self.insert(kkk_msgAtt_lll, at: 0)
    }
    @MainActor func CCC_addURLImg_DDD(_ image : String, _ y : CGFloat, _ size : CGSize){
        let kkk_msgAtt_lll = NSMutableAttributedString(string: " ")
        let imageView = UIImageView()
        imageView.sd_setImage(with:  URL(string: image))
        let kkk_attach_lll = NSTextAttachment()
        kkk_attach_lll.image = imageView.image
        kkk_attach_lll.bounds = CGRectMake(0, y, size.width, size.height)
        let kkk_imgsAttach_lll = NSMutableAttributedString(attachment: kkk_attach_lll)
        kkk_msgAtt_lll.insert(kkk_imgsAttach_lll, at: 0)
        self.insert(kkk_msgAtt_lll, at: 0)
    }
    // FUNCMARK
    // FUNCMARK
    
    @MainActor func CCC_addLocalImg_DDD(_ image : String, _ y : CGFloat, _ size : CGSize){
        let kkk_imageView_lll = UIImageView()
        kkk_imageView_lll.image = UIImage(contentsOfFile: image)
        kkk_imageView_lll.contentMode = .scaleAspectFill
        kkk_imageView_lll.layer.cornerRadius = 30
        kkk_imageView_lll.clipsToBounds = true
        let kkk_msgAtt_lll = NSMutableAttributedString(string: " ")
        let kkk_attach_lll = NSTextAttachment()
        kkk_attach_lll.image = CCC_reloadImage_DDD(kkk_imageView_lll)
        kkk_attach_lll.bounds = CGRectMake(0, y, size.width, size.height)
        let kkk_imgsAttach_lll = NSMutableAttributedString(attachment: kkk_attach_lll)
        kkk_msgAtt_lll.insert(kkk_imgsAttach_lll, at: 0)
        self.insert(kkk_msgAtt_lll, at: 0)
    }
    // FUNCMARK
    // FUNCMARK
    @MainActor func CCC_reloadImage_DDD(_ view : UIImageView) -> UIImage {
        let kkk_views_lll = UIView()
        kkk_views_lll.frame = CGRectMake(0, 0, 60, 60)
        view.frame = CGRectMake(0, 0, 60, 60)
        kkk_views_lll.addSubview(view)
        kkk_views_lll.backgroundColor = .clear
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 60, height: 60), false, 0.0)
        defer { UIGraphicsEndImageContext() }
        kkk_views_lll.layer.render(in: UIGraphicsGetCurrentContext()!)
        let kkk_image_lll = UIGraphicsGetImageFromCurrentImageContext()
        return kkk_image_lll!
    }
    // FUNCMARK
    // FUNCMARK
    
    func CCC_addImg_DDD(_ image : String, _ local : Int){
        let kkk_msgAtt_lll = NSMutableAttributedString(string: " ")
        let kkk_attach_lll = NSTextAttachment()
        if image.contains("/") == true {
            kkk_attach_lll.image = UIImage(contentsOfFile: image)
        }else {
            kkk_attach_lll.image = UIImage.CCC_localImage_DDD(image)
        }
        kkk_attach_lll.bounds = CGRectMake(0, -4, 16, 16)
        let kkk_imgsAttach_lll = NSMutableAttributedString(attachment: kkk_attach_lll)
        kkk_msgAtt_lll.insert(kkk_imgsAttach_lll, at: 0)
        self.insert(kkk_msgAtt_lll, at: local)
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_addImgs_DDD(_ image : UIImage, _ y : CGFloat, _ size : CGSize){
        let kkk_msgAtt_lll = NSMutableAttributedString(string: " ")
        let kkk_attach_lll = NSTextAttachment()
        kkk_attach_lll.image = image
        kkk_attach_lll.bounds = CGRectMake(0, y, size.width, size.height)
        let kkk_imgsAttach_lll = NSMutableAttributedString(attachment: kkk_attach_lll)
        kkk_msgAtt_lll.insert(kkk_imgsAttach_lll, at: 0)
        self.insert(kkk_msgAtt_lll, at: 0)
    }
    // FUNCMARK
    // FUNCMARK
    
    func CCC_addRRAtt_DDD(_ font : Int, _ col : UIColor, _ msg : String) {
        CCC_addAtt_DDD(AAA_Font_BBB.CCC_RR_DDD(font), col, msg)
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_addRMAtt_DDD(_ font : Int, _ col : UIColor, _ msg : String) {
        CCC_addAtt_DDD(AAA_Font_BBB.CCC_RM_DDD(font), col, msg)
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_addMMAtt_DDD(_ font : Int, _ col : UIColor, _ msg : String) {
        CCC_addAtt_DDD(AAA_Font_BBB.CCC_MM_DDD(font), col, msg)
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_addROAtt_DDD(_ font : Int, _ col : UIColor, _ msg : String) {
        CCC_addAtt_DDD(AAA_Font_BBB.CCC_RO_DDD(font), col, msg)
    }
    // FUNCMARK
    // FUNCMARK
    
    
    func CCC_addCallLine_DDD(_ color : UIColor, _ length : Int) {
        let kkk_underlineAtt_lll : [NSAttributedString.Key: Any] = [.underlineStyle : NSUnderlineStyle.single.rawValue, .underlineColor : color]
        self.addAttributes(kkk_underlineAtt_lll, range: NSRange(location: 1, length: length - 1))
    }
    // FUNCMARK
    // FUNCMARK
    
    @MainActor func CCC_addPromptAtt_DDD(_ font : Int, _ col : UIColor, _ msg : String,_ isSelf : Bool) {
        let kkk_newMsg_lll = msg + " "
        let kkk_mutableString_lll = NSMutableAttributedString(string: kkk_newMsg_lll)
        let kkk_range_lll = NSRange(location: 0, length: kkk_mutableString_lll.string.utf16.count)
        kkk_mutableString_lll.addAttribute(.font, value: UIFont.systemFont(ofSize: CGFloat(14)), range: kkk_range_lll)
        if isSelf == true {
            kkk_mutableString_lll.addAttribute(.foregroundColor, value: UIColor.white, range: kkk_range_lll)
        }else{
            kkk_mutableString_lll.addAttribute(.foregroundColor, value: col, range: kkk_range_lll)
        }
        
        let kkk_label_lll = UILabel()
        kkk_label_lll.attributedText = kkk_mutableString_lll
        kkk_label_lll.frame = CGRectMake(0, 0, 100, 500)
        kkk_label_lll.sizeToFit()

        let kkk_msgAtt_lll = NSTextAttachment()
        kkk_msgAtt_lll.bounds = CGRect(x: 0, y: -5, width: kkk_label_lll.width + 10, height: 20)
        let kkk_imageView_lll = UIView()
        kkk_imageView_lll.layer.cornerRadius = 10
        kkk_imageView_lll.layer.masksToBounds = true
        if isSelf == true {
            kkk_imageView_lll.backgroundColor = AAA_GeneralOutModel_BBB.CCC_color_DDD("color_1456F0_color")
        }else{
            kkk_imageView_lll.backgroundColor = .clear
        }

        kkk_label_lll.frame = CGRectMake(5, 0, kkk_label_lll.width, 20)
        kkk_imageView_lll.addSubview(kkk_label_lll)
        kkk_imageView_lll.frame = CGRect(x: 0, y: 0, width: kkk_label_lll.width + 10, height: 20)
        UIGraphicsBeginImageContextWithOptions(kkk_imageView_lll.bounds.size, false, 0)
        kkk_imageView_lll.layer.render(in: UIGraphicsGetCurrentContext()!)
        let kkk_image_lll = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        kkk_msgAtt_lll.image = kkk_image_lll
        let kkk_attachmentString_lll = NSAttributedString(attachment: kkk_msgAtt_lll)
        self.insert(kkk_attachmentString_lll, at: 0)
    }
    // FUNCMARK
    

}
