//
//  AAA_UIImageExtension_BBB.swift
//  Module_General
//UIImageView
//  Created by Frankie on 19/05/2025.
//

import UIKit
import SDWebImage

public extension UIImageView {
    
    
    // FUNCMARK
    //xib加载本地图片
    @IBInspectable var kkk_localImage_lll: String {
        set {
            self.image = UIImage.CCC_localImage_DDD(newValue)
        }
        get {
            return ""
        }
    }
    
    
    //头像加载
    func CCC_avatar_DDD(_ avatar : String, _ imageWidth : CGFloat? = 0) {
        CCC_normal1_DDD(avatar, "MMM_headPlaceHolder_NNN")
    }
    //图片加载
    func CCC_imageUrl_DDD(_ avatar : String, _ imageWidth : CGFloat? = 0, _ placeholder : String? = "MMM_imagePlaceHolder_NNN") {
        CCC_normal1_DDD(avatar, placeholder)
    }
    //礼物图片加载
    func CCC_giftUrl_DDD(_ avatar : String,_ imageWidth : CGFloat? = 0) {
        CCC_normal1_DDD(avatar, "MMM_giftNormalImage_NNN")
    }
    //图片加载，带进度
    func CCC_imageUrl_DDD(_ avatar : String, _ imageWidth : CGFloat? = 0, _ placeholder : String? = "", suc:@escaping (_ press : CGFloat)->Void) {
        CCC_normal_DDD(avatar, imageWidth, placeholder) { press in
            suc(press)
        }
    }
    
    
    //点9图，聊天气泡专用加载图片
    func CCC_image9_DDD(_ image : String) {
        if image.count > 0 {
            self.sd_setImage(with: (NSURL(string: image)! as URL)) { [weak self] images, error, type, url in
                if images != nil {
                    guard let self = self else {return}
                    let kkk_images_lll = (images!).CCC_resize1_DDD(66, 33)
                    let kkk_images1_lll = kkk_images_lll.resizableImage(withCapInsets: UIEdgeInsets(top: kkk_images_lll.size.height/2, left: kkk_images_lll.size.width/2, bottom: kkk_images_lll.size.height/2, right: kkk_images_lll.size.width/2), resizingMode: UIImage.ResizingMode.stretch)
                    self.image = kkk_images1_lll
                }
            }
        }
    }
    func CCC_image9Chat_DDD(_ image : String,_ suc:@escaping ()->Void,_ fail:@escaping ()->Void) {
        if image.count > 0 {
            self.sd_setImage(with: (NSURL(string: image)! as URL)) { [weak self] images, error, type, url in
                if images != nil {
                    guard let self = self else {return}
                    let kkk_images_lll = (images!).CCC_resize1_DDD(66, 33)
                    let kkk_images1_lll = kkk_images_lll.resizableImage(withCapInsets: UIEdgeInsets(top: kkk_images_lll.size.height/2, left: kkk_images_lll.size.width/2, bottom: kkk_images_lll.size.height/2, right: kkk_images_lll.size.width/2), resizingMode: UIImage.ResizingMode.stretch)
                    self.image = kkk_images1_lll
                    suc()
                }else {
                    fail()
                }
            }
        }else {
            fail()
        }
    }
    
    //家族等级图片，传入等级
    func CCC_familyImage_DDD(_ level : Int) {
        if level >= 4 {
            self.kkk_localImage_lll = "MMM_familyLevelFourthImage_NNN"
        }else if level == 3 {
            self.kkk_localImage_lll = "MMM_familyLevelThirdImage_NNN"
        }else if level == 2 {
            self.kkk_localImage_lll = "MMM_familyLevelSecondImage_NNN"
        }else {
            self.kkk_localImage_lll = "MMM_familyLevelFirstImage_NNN"
        }
    }
    
    //cp等级图片，传入等级
    func CCC_cpLevelImg_DDD(_ level : Int){
        if level >= 6 {
            self.kkk_localImage_lll = "MMM_CPLevelImage6_NNN"
        }else if level == 5 {
            self.kkk_localImage_lll = "MMM_CPLevelImage5_NNN"
        }else if level == 4 {
            self.kkk_localImage_lll = "MMM_CPLevelImage4_NNN"
        }else if level == 3 {
            self.kkk_localImage_lll = "MMM_CPLevelImage3_NNN"
        }else if level == 2 {
            self.kkk_localImage_lll = "MMM_CPLevelImage2_NNN"
        }else {
            self.kkk_localImage_lll = "MMM_CPLevelImage1_NNN"
        }
    }
    func CCC_cpMiniLevelsImg_DDD(_ level : Int){
        if level >= 6 {
            self.kkk_localImage_lll = "MMM_Lv6estateIcon_NNN"
        }else if level == 5 {
            self.kkk_localImage_lll = "MMM_Lv5estateIcon_NNN"
        }else if level == 4 {
            self.kkk_localImage_lll = "MMM_Lv4estateIcon_NNN"
        }else if level == 3 {
            self.kkk_localImage_lll = "MMM_Lv3estateIcon_NNN"
        }else if level == 2 {
            self.kkk_localImage_lll = "MMM_Lv2estateIcon_NNN"
        }else {
            self.kkk_localImage_lll = "MMM_Lv1estateIcon_NNN"
        }
    }
    
    /*
     通用图片加载
     image 图片URL
     imageWidth 需要缩放的大小
     placeholder 占位图
     */
    @MainActor
    private func CCC_normal_DDD(_ image : String, _ imageWidth : CGFloat? = 0, _ placeholder : String? = "", _ imageHeight : CGFloat? = 0, suc:@escaping (_ press : CGFloat)->Void) {
        var kkk_img_lll : UIImage? = nil
        if placeholder!.count != 0 {
            kkk_img_lll = UIImage.CCC_localImage_DDD(placeholder!)
        }
        if image.count > 0 {
            let kkk_url_lll = URL(string: image)
            self.sd_setImage(with: kkk_url_lll, placeholderImage: kkk_img_lll) { receivedSize, totalSize, url in
                DispatchQueue.main.async {
                    suc(CGFloat(receivedSize)/CGFloat(totalSize))
                }
            } completed: { image, error, type, url in
                DispatchQueue.main.async { [weak self] in
                    suc(1)
                }
            }
            
        }else{
            if placeholder!.count > 0 {
                kkk_localImage_lll = placeholder!
            }
        }
    }
    private func CCC_normal1_DDD(_ image : String, _ placeholder : String? = "") {
        let kkk_img_lll = UIImage.CCC_localImage_DDD(placeholder!)
        self.sd_setImage(with: URL(string: image), placeholderImage: kkk_img_lll)
    }
    
    
    func CCC_avatar1_DDD(_ avatar : String) {
        if avatar.count > 0 {
            let kkk_url_lll = URL(string: avatar)
            self.sd_setImage(with: kkk_url_lll, placeholderImage: UIImage.CCC_localImage_DDD("MMM_headPlaceHolder_NNN"))
        }else{
            kkk_localImage_lll = "MMM_headPlaceHolder_NNN"
        }
    }
    
}

public extension UIImage {
    
    func CCC_resize_DDD(_ max : CGFloat) -> UIImage {
        return CCC_resize1_DDD(max, max)
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_resize1_DDD(_ width : CGFloat, _ height : CGFloat) -> UIImage {
        let kkk_scalex_lll = width / size.width
        let kkk_scaley_lll = height / size.height
        var kkk_scale_lll = kkk_scalex_lll
        if kkk_scale_lll < kkk_scaley_lll {
            kkk_scale_lll = kkk_scaley_lll
        }
        let kkk_wid_lll = size.width * kkk_scale_lll
        let kkk_hei_lll = size.height * kkk_scale_lll
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(kkk_wid_lll, kkk_hei_lll), false, 0.0)
        self.draw(in: CGRectMake(0, 0, kkk_wid_lll, kkk_hei_lll))
        self.draw(in: CGRect(origin: .zero, size: CGSizeMake(kkk_wid_lll, kkk_hei_lll)))
        let kkk_newimg_lll = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return kkk_newimg_lll!
    }
    
    class func CCC_localImage_DDD(_ image : String? = "") -> UIImage {
        if image!.count == 0 {
            return UIImage()
        }
            //STARTMARK
        #if kkk_test_lll
            //ENDMARK
        return UIImage(contentsOfFile: kkk_allImagePath_lll + image! + "@2x") ?? UIImage()
            //STARTMARK
        #else
        
        if UIImage(named: image!) == nil {
            print("图片不存在" + image!)
        }
        return UIImage(named: image!) ?? UIImage()
        #endif
            //ENDMARK
    }
}
