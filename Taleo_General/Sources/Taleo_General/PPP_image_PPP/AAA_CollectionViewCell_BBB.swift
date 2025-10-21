//
//  AAA_CollectionViewCell_BBB.swift
//  Wohoo
//
//  Created by Ben on 15/10/2024.
//

import UIKit
class AAA_CollectionViewCell_BBB: UICollectionViewCell, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    
    // FUNCMARK
    lazy var kkk_backScroll_lll : UIScrollView = {
        let kkk_scroll_lll = UIScrollView.init(frame: CGRect(x: 0,y: 0, width: kkk_WIDTH_lll, height: kkk_HEIGHT_lll))
        kkk_scroll_lll.delegate = self
        kkk_scroll_lll.isPagingEnabled = false
        kkk_scroll_lll.minimumZoomScale = 1.0
        kkk_scroll_lll.maximumZoomScale = 4
        kkk_scroll_lll.showsHorizontalScrollIndicator = false
        kkk_scroll_lll.showsVerticalScrollIndicator = false
        return kkk_scroll_lll
    }()
    // FUNCMARK
    // FUNCMARK
    
    lazy var kkk_imgView_lll : UIImageView = {
        let kkk_imageView_lll = UIImageView.init()
        kkk_imageView_lll.contentMode = .scaleAspectFill
        return kkk_imageView_lll
    }()
    // FUNCMARK
    // FUNCMARK
    
    
    lazy var kkk_loading_lll: UIActivityIndicatorView = {
        let kkk_loading_lll = UIActivityIndicatorView.init()
        kkk_loading_lll.backgroundColor = .clear
        kkk_loading_lll.color = .white
        kkk_loading_lll.hidesWhenStopped = true
        kkk_loading_lll.stopAnimating()
        return kkk_loading_lll
    }()
    // FUNCMARK
    // FUNCMARK

    var kkk_imgUrl_lll: String? {
        didSet {
            guard let kkk_img_url_lll = kkk_imgUrl_lll else {
                return
            }

            kkk_loading_lll.startAnimating()
            kkk_imgView_lll.sd_setImage(with: URL(string: kkk_img_url_lll), placeholderImage: UIImage.CCC_localImage_DDD("MMM_headPlaceHolder_NNN")) { receivedSize, totalSize, url in
             } completed: { [weak self] img, error, type, url in
                  guard img != nil else {
                     return
                 }
                 guard let width = img?.size.width else {
                     return
                 }
                 guard let height = img?.size.height else {
                     return
                 }

                 guard let selfs = self else {return}
                 selfs.kkk_loading_lll.stopAnimating()
                 let w = kkk_WIDTH_lll
                 let h = kkk_WIDTH_lll / (width / height)
                 
                 if h > kkk_HEIGHT_lll {
                     DispatchQueue.main.async { [weak self] in
                         guard let self = self else {return}
                         self.kkk_backScroll_lll.contentSize = CGSize(width: kkk_WIDTH_lll, height: h)
                         self.kkk_backScroll_lll.contentOffset = CGPoint(x: 0, y: 0)
                         self.kkk_imgView_lll.frame = CGRect(x: 0, y: 0, width: w, height: h)
                     }
                     
                 }else{
                     let y = (kkk_HEIGHT_lll - h) / 2
                     DispatchQueue.main.async { [weak self] in
                         guard let self = self else {return}
                         self.kkk_backScroll_lll.contentSize = CGSize(width: kkk_WIDTH_lll, height: kkk_HEIGHT_lll)
                         self.kkk_backScroll_lll.contentOffset = CGPoint(x: 0, y: 0)
                         self.kkk_imgView_lll.frame = CGRect(x: 0, y: y, width: w, height: h)
                     }
                     
                 }
             }
        }
    }
    // FUNCMARK
    // FUNCMARK
    
    var kkk_image_lll : UIImage?  {
        didSet {
            guard let kkk_imageV_lll = kkk_image_lll else {
                return
            }
            kkk_imgView_lll.image = kkk_imageV_lll
            let w = kkk_WIDTH_lll
            let h = kkk_WIDTH_lll / (kkk_imageV_lll.size.width / kkk_imageV_lll.size.height)
            
            if h > kkk_HEIGHT_lll {
                self.kkk_backScroll_lll.contentSize = CGSize(width: kkk_WIDTH_lll, height: h)
                self.kkk_backScroll_lll.contentOffset = CGPoint(x: 0, y: 0)
                kkk_imgView_lll.frame = CGRect(x: 0, y: 0, width: w, height: h)
            }else{
                let y = (kkk_HEIGHT_lll - h) / 2
                self.kkk_backScroll_lll.contentSize = CGSize(width: kkk_WIDTH_lll, height: kkk_HEIGHT_lll)
                self.kkk_backScroll_lll.contentOffset = CGPoint(x: 0, y: 0)
                kkk_imgView_lll.frame = CGRect(x: 0, y: y, width: w, height: h)
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    
    var kkk_backRemoveCallBack_lll: (() -> Void)?
    // FUNCMARK
    // FUNCMARK
    var kkk_tapMoveCallBack_lll:((_ view: UIView) -> Void)?
    // FUNCMARK
    // FUNCMARK
    var kkk_changeAlphaCallBack_lll: ((_ value: CGFloat) -> Void)?
    // FUNCMARK
    // FUNCMARK
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.contentView.addSubview(self.kkk_backScroll_lll)

        self.kkk_backScroll_lll.addSubview(self.kkk_imgView_lll)
        self.CCC_addTapGesture_DDD(imageview: self.kkk_imgView_lll, scroll: self.kkk_backScroll_lll)
        self.CCC_addPanGesture_DDD(kkk_imgView_lll)
    
        self.contentView.addSubview(self.kkk_loading_lll)
        self.kkk_loading_lll.translatesAutoresizingMaskIntoConstraints = false
        self.kkk_loading_lll.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.kkk_loading_lll.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.kkk_loading_lll.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.kkk_loading_lll.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    // FUNCMARK
    // FUNCMARK
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // FUNCMARK
    // FUNCMARK
    
     public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.kkk_imgView_lll
    }
    // FUNCMARK
    // FUNCMARK
     
    
     
    public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        var kkk_centerX_lll = self.kkk_backScroll_lll.center.x
        var kkk_centerY_lll = self.kkk_backScroll_lll.center.y
        kkk_centerX_lll = scrollView.contentSize.width > scrollView.frame.size.width ? scrollView.contentSize.width/2 : kkk_centerX_lll
        kkk_centerY_lll = scrollView.contentSize.height > scrollView.frame.size.height ? scrollView.contentSize.height/2 : kkk_centerY_lll
        self.kkk_imgView_lll.center = CGPoint(x: kkk_centerX_lll, y: kkk_centerY_lll)
    }
    // FUNCMARK
    // FUNCMARK
    
    
    @objc func CCC_imageClick_DDD(tap:UITapGestureRecognizer) {
        
        var kkk_newscale_lll : CGFloat = 0
        
        guard let kkk_scroll_lll = tap.view?.superview as? UIScrollView else {
            return
        }
        
        if kkk_scroll_lll.zoomScale == 1.0 {
            kkk_newscale_lll = 3
        }else {
            kkk_newscale_lll = 1.0
        }
        
        let kkk_zoomRect_lll = self.CCC_zoomRectForScale_DDD(scrollview: kkk_scroll_lll,scale: kkk_newscale_lll, center: tap.location(in: tap.view))
        
        kkk_scroll_lll.zoom(to: kkk_zoomRect_lll, animated: true)
    }
    // FUNCMARK
    // FUNCMARK
    
    @objc func CCC_viewClick_DDD(tap:UITapGestureRecognizer) {
        if self.kkk_backScroll_lll.zoomScale != 1 {
            let kkk_zoomRect_lll = self.CCC_zoomRectForScale_DDD(scrollview: self.kkk_backScroll_lll,scale: 1, center: self.center)
            self.kkk_backScroll_lll.zoom(to: kkk_zoomRect_lll, animated: true)
        }else{
            
            if tap.state == .recognized {
                self.kkk_tapMoveCallBack_lll?(self.kkk_imgView_lll)
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    
    func CCC_zoomRectForScale_DDD(scrollview: UIScrollView, scale: CGFloat,center: CGPoint) -> CGRect {
        var kkk_zoomRect_lll: CGRect = CGRect()
        kkk_zoomRect_lll.size.height = scrollview.frame.size.height / scale
        kkk_zoomRect_lll.size.width = scrollview.frame.size.width / scale
        kkk_zoomRect_lll.origin.x = center.x - (kkk_zoomRect_lll.size.width / 2.0)
        kkk_zoomRect_lll.origin.y = center.y - (kkk_zoomRect_lll.size.height / 2.0)
        return kkk_zoomRect_lll
    }
    // FUNCMARK
    // FUNCMARK

     func CCC_addTapGesture_DDD(imageview: UIView,scroll: UIScrollView) {
        imageview.isUserInteractionEnabled = true
        scroll.isUserInteractionEnabled = true
        let kkk_doubleTap_lll = UITapGestureRecognizer(target: self, action: #selector(CCC_imageClick_DDD(tap:)))
        kkk_doubleTap_lll.numberOfTapsRequired = 2
        imageview.addGestureRecognizer(kkk_doubleTap_lll)
        
        let kkk_tap_lll = UITapGestureRecognizer(target: self, action: #selector(CCC_viewClick_DDD(tap:)))
        kkk_tap_lll.numberOfTapsRequired = 1
        kkk_tap_lll.numberOfTouchesRequired = 1
        imageview.addGestureRecognizer(kkk_tap_lll)
        scroll.addGestureRecognizer(kkk_tap_lll)
        
        kkk_tap_lll.require(toFail: kkk_doubleTap_lll)
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_addPanGesture_DDD(_ imgView: UIView) {
        let kkk_pan_lll = UIPanGestureRecognizer(target: self, action: #selector(CCC_panRecognizerAction_DDD(pan:)))
        imgView.addGestureRecognizer(kkk_pan_lll)
        imgView.isUserInteractionEnabled = true
        kkk_pan_lll.delegate = self
    }
    // FUNCMARK
    // FUNCMARK
    
    @objc func CCC_panRecognizerAction_DDD(pan:UIPanGestureRecognizer) {
        guard let kkk_imageview_lll = pan.view else {
            return
        }
        guard let kkk_imgSuperView_lll = kkk_imageview_lll.superview else {
            return
        }
        let translation = pan.translation(in: kkk_imageview_lll)
        if pan.state == .changed {
            kkk_imageview_lll.center = CGPoint(x: kkk_imageview_lll.center.x, y: kkk_imageview_lll.center.y + translation.y)
            pan.setTranslation(.zero, in: kkk_imgSuperView_lll)
            let kkk_alphaScale_lll = abs(kkk_imageview_lll.center.y - kkk_HEIGHT_lll / 2)
            self.kkk_changeAlphaCallBack_lll?(((kkk_HEIGHT_lll - CGFloat(kkk_alphaScale_lll)) / kkk_HEIGHT_lll))
        }else if pan.state == .ended {
            if kkk_imageview_lll.center.y > kkk_HEIGHT_lll / 2 + 60 {
                self.CCC_imagePanRemoveAnimation_DDD(false, imageview: kkk_imageview_lll)
            }else if kkk_imageview_lll.center.y < kkk_HEIGHT_lll / 2 - 60 {
                self.CCC_imagePanRemoveAnimation_DDD(true, imageview: kkk_imageview_lll)
            }else{
                let kkk_imgW_lll = kkk_WIDTH_lll
                let kkk_imgH_lll = kkk_WIDTH_lll * (kkk_imageview_lll.frame.size.height) / (kkk_imageview_lll.frame.size.width)
                let kkk_y_lll = (kkk_HEIGHT_lll - kkk_imgH_lll) / 2
                UIView.animate(withDuration: 0.3) { [weak self] in
                    self?.kkk_changeAlphaCallBack_lll?(1)
                    kkk_imageview_lll.frame = CGRect(x: 0, y: kkk_y_lll, width: kkk_imgW_lll, height: kkk_imgH_lll)
                }
            }
            
        }
    }
    // FUNCMARK
    // FUNCMARK
     
    public override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let kkk_panView_lll = gestureRecognizer.view else {
            return false
        }
         guard kkk_panView_lll.frame.size.width == kkk_WIDTH_lll else{
            return false
        }
         guard kkk_panView_lll.frame.size.height <= kkk_HEIGHT_lll else{
            return false
        }
        if gestureRecognizer.isKind(of: UIPanGestureRecognizer.self) {
            let kkk_panGesture_lll = gestureRecognizer as! UIPanGestureRecognizer
            let kkk_offset_lll = kkk_panGesture_lll.translation(in: kkk_panView_lll)
            if kkk_offset_lll.x == 0 && kkk_offset_lll.y != 0 {
                return true
            }
        }
        
        return false
    }
    // FUNCMARK
    // FUNCMARK
    
    func CCC_imagePanRemoveAnimation_DDD(_ isTop: Bool,imageview: UIView) {
        let kkk_duration_lll = 0.4
        if isTop {
             let kkk_imgW_lll = kkk_WIDTH_lll
            let kkk_imgH_lll = kkk_WIDTH_lll * (imageview.frame.size.height) / (imageview.frame.size.width)
            
            UIView.animate(withDuration: kkk_duration_lll) {
                imageview.frame = CGRect(x: 0, y: -kkk_imgH_lll , width: kkk_imgW_lll, height: kkk_imgH_lll)
            }
            
            self.kkk_backRemoveCallBack_lll?()
        }else{
            let kkk_imgW_lll = kkk_WIDTH_lll
            let kkk_imgH_lll = kkk_WIDTH_lll * (imageview.frame.size.height) / (imageview.frame.size.width)
            
            UIView.animate(withDuration: kkk_duration_lll) {
                imageview.frame = CGRect(x: 0, y: kkk_HEIGHT_lll, width: kkk_imgW_lll, height: kkk_imgH_lll)
            }
            
            self.kkk_backRemoveCallBack_lll?()
        }
    }
    // FUNCMARK
}
