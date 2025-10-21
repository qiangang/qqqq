//
//  AAA_ShowBigImgController_BBB.swift
//  Wohoo
//
//  Created by Ben on 15/10/2024.
//

import UIKit
import Photos

class AAA_ShowBigImgController_BBB: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // FUNCMARK
    
    
    
    
    
    
    
    
    
    
    
    
    
    // 是否显示保存按钮
    var kkk_showSaveBtn_lll: Bool = true
    // FUNCMARK
    // FUNCMARK
    // 保存按钮
    lazy var kkk_saveBtn_lll: UIButton = {
        let kkk_button_lll = UIButton.init(type: .custom)
        kkk_button_lll.CCC_defaults_DDD(self, #selector(CCC_saveBtnClick_DDD))
        kkk_button_lll.CCC_titleRO_DDD("MMM_saveString_NNN", 13, .white)
        kkk_button_lll.frame = CGRectMake(kkk_WIDTH_lll - 84, 4 + UIDevice.CCC_safeTop_DDD(), 70, 34)
        kkk_button_lll.isHidden = true
        kkk_button_lll.backgroundColor = CCC_colors_DDD("CD873C")
        kkk_button_lll.layer.cornerRadius = 17
        kkk_button_lll.layer.masksToBounds = true
        return kkk_button_lll
    }()
    // FUNCMARK
    // FUNCMARK
    
    static let kkk_share_lll: AAA_ShowBigImgController_BBB = AAA_ShowBigImgController_BBB()
    // FUNCMARK
    // FUNCMARK

    func CCC_show_DDD(_ array : NSArray, _ index : Int) {
        kkk_saveBtn_lll.isHidden = !kkk_showSaveBtn_lll
        kkk_array_lll = array as! [Any]
        self.alpha = 0
        kkk_Window_lll!.addSubview(self)
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.alpha = 1
        }
        kkk_collect_lll.reloadData()
        UserDefaults.standard.set("MMM_IMD_NNN", forKey: "MMM_WhetherEnlarge_NNN")
        kkk_pageControl_lll.numberOfPages = kkk_array_lll.count
        kkk_pageControl_lll.currentPage = index
        kkk_collect_lll.scrollToItem(at: IndexPath.init(item: index, section: 0), at: .centeredHorizontally, animated: false)
    }
    // FUNCMARK
    // FUNCMARK
    
    var kkk_collect_lll : UICollectionView!
    // FUNCMARK
    // FUNCMARK
    var kkk_pageControl_lll : UIPageControl!
    // FUNCMARK
    // FUNCMARK
    var kkk_array_lll : [Any] = []
    // FUNCMARK
    // FUNCMARK
    
    override init(frame: CGRect) {
        super.init(frame: CGRectMake(0, 0, kkk_WIDTH_lll, kkk_HEIGHT_lll))
        
        self.backgroundColor = UIColor.black
        
        let kkk_layout_lll = AAA_CollectionPageFlowLayout_BBB.init()
        kkk_layout_lll.scrollDirection = .horizontal
        kkk_layout_lll.minimumLineSpacing = 0
        kkk_layout_lll.minimumInteritemSpacing = 0
        kkk_layout_lll.itemSize = CGSize(width: floor(kkk_WIDTH_lll), height: kkk_HEIGHT_lll)
        kkk_layout_lll.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        kkk_collect_lll = UICollectionView.init(frame: self.frame, collectionViewLayout: kkk_layout_lll)
        kkk_collect_lll.backgroundColor = .clear
        kkk_collect_lll.isScrollEnabled = true
        kkk_collect_lll.keyboardDismissMode = .onDrag
        kkk_collect_lll.alwaysBounceVertical = false
        kkk_collect_lll.showsVerticalScrollIndicator = false
        kkk_collect_lll.register(AAA_CollectionViewCell_BBB.self, forCellWithReuseIdentifier: "AAA_CollectionViewCell_BBB")
        kkk_collect_lll.delegate = self
        kkk_collect_lll.dataSource = self
        self.addSubview(kkk_collect_lll)
        
        
        kkk_pageControl_lll = UIPageControl.init()
        kkk_pageControl_lll.isUserInteractionEnabled = false
        self.addSubview(kkk_pageControl_lll)
        
        kkk_pageControl_lll.frame = CGRect(x: 0, y: kkk_HEIGHT_lll - 80, width: kkk_WIDTH_lll, height: 30)
        kkk_pageControl_lll.currentPageIndicatorTintColor = .white
        kkk_pageControl_lll.pageIndicatorTintColor = .gray

        
        let kkk_btn_lll = UIButton()
        kkk_btn_lll.CCC_defaults_DDD(self, #selector(CCC_hide_DDD))
        kkk_btn_lll.CCC_images_DDD("MMM_backIcon_NNN")
        kkk_btn_lll.frame = CGRectMake(15, UIDevice.CCC_safeTop_DDD(), 44, 44)
        self.addSubview(kkk_btn_lll)
        
        self.addSubview(kkk_saveBtn_lll)
    }
    // FUNCMARK
    // FUNCMARK
    
    // 保存图片
    @objc func CCC_saveBtnClick_DDD() {
        let kkk_index_lll = kkk_pageControl_lll.currentPage
        let kkk_str_lll = kkk_array_lll[kkk_index_lll] as? String
        if kkk_str_lll != nil {
            guard let kkk_data_lll = try? Data.init(contentsOf: URL(string: kkk_str_lll!)!) else {
                return
            }
            CCC_savePhotos_DDD(image: nil, data: kkk_data_lll)
            AAA_GeneralOutModel_BBB.CCC_showTitle_DDD(AAA_StringModel_BBB.CCC_checkStr_DDD("MMM_SuccessStr_NNN"))
        }else {
            let kkk_image_lll = kkk_array_lll[kkk_index_lll] as! UIImage
            CCC_savePhotos_DDD(image: kkk_image_lll, data: nil)
            AAA_GeneralOutModel_BBB.CCC_showTitle_DDD(AAA_StringModel_BBB.CCC_checkStr_DDD("MMM_SuccessStr_NNN"))
        }
    }
    // FUNCMARK
    // FUNCMARK
    
    func CCC_savePhotos_DDD(image: UIImage?,data: Data?) {
        PHPhotoLibrary.requestAuthorization { [weak self] (status) in
            if status == PHAuthorizationStatus.authorized || status == PHAuthorizationStatus.notDetermined {
                PHPhotoLibrary.shared().performChanges {
                    if let kkk_imgData_lll = data {
                        let kkk_req_lll = PHAssetCreationRequest.forAsset()
                        kkk_req_lll.addResource(with: .photo, data: kkk_imgData_lll, options: nil)
                    }else if let kkk_img_lll = image{
                        _ = PHAssetChangeRequest.creationRequestForAsset(from: kkk_img_lll)
                    }else{
                        return
                    }
                } completionHandler: { (finish, error) in
                };
            }else{
                self?.CCC_openSystemSettingPhotoLibrary_DDD()
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_openSystemSettingPhotoLibrary_DDD() {
        let kkk_alert_lll = UIAlertController(title:AAA_StringModel_BBB.CCC_checkStr_DDD("MMM_photoTipTitleStr_NNN"), message:AAA_StringModel_BBB.CCC_checkStr_DDD("MMM_photoTipStr_NNN"), preferredStyle: .alert)
        let kkk_confirm_lll = UIAlertAction(title:AAA_StringModel_BBB.CCC_checkStr_DDD("MMM_LGeneralsettings_NNN"), style: .default) { (_)in
            let kkk_url_lll = URL.init(string: UIApplication.openSettingsURLString)
            if  UIApplication.shared.canOpenURL(kkk_url_lll!){
                UIApplication.shared.open(kkk_url_lll!, options: [:], completionHandler: { (ist)in
                })
            }
        }
        let kkk_cancel_lll = UIAlertAction(title:AAA_StringModel_BBB.CCC_checkStr_DDD("MMM_cancel_NNN"), style: .cancel, handler:nil)
        kkk_alert_lll.addAction(kkk_cancel_lll)
        kkk_alert_lll.addAction(kkk_confirm_lll)
        CCC_present_DDD(kkk_alert_lll)
    }
    // FUNCMARK
    // FUNCMARK

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // FUNCMARK
    // FUNCMARK

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kkk_array_lll.count
    }
    // FUNCMARK
    // FUNCMARK
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let kkk_cell_lll = collectionView.dequeueReusableCell(withReuseIdentifier: "AAA_CollectionViewCell_BBB", for: indexPath) as! AAA_CollectionViewCell_BBB
        let kkk_str_lll = kkk_array_lll[indexPath.row] as? String
        if kkk_str_lll != nil {
            kkk_cell_lll.kkk_imgUrl_lll = (kkk_str_lll!)
        }else {
            kkk_cell_lll.kkk_image_lll = kkk_array_lll[indexPath.row] as? UIImage
        }
        // pan手势
        kkk_cell_lll.kkk_backRemoveCallBack_lll = { [weak self] in
            self?.CCC_hide_DDD()
        }
        // 点击手势
        kkk_cell_lll.kkk_tapMoveCallBack_lll = {[weak self] (imgView) in
            self?.CCC_hide_DDD()
        }
        kkk_cell_lll.kkk_changeAlphaCallBack_lll = { [weak self] (alpha) in
            self?.CCC_setPageControl_DDD(alpha: alpha)
        }
        return kkk_cell_lll
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_setPageControl_DDD(alpha: CGFloat) {
        self.backgroundColor = UIColor.black.withAlphaComponent(alpha)
    }
    // FUNCMARK
    // FUNCMARK
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == kkk_collect_lll ,let kkk_index_lll = kkk_collect_lll.indexPathForItem(at: kkk_collect_lll.contentOffset)?.item{
            self.kkk_pageControl_lll.currentPage = Int(kkk_index_lll)
        }
    }
    // FUNCMARK
    // FUNCMARK
    
    @objc func CCC_hide_DDD() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.alpha = 0
        } completion: { [weak self] Bool in
            UserDefaults.standard.removeObject(forKey: "MMM_WhetherEnlarge_NNN")
            self?.removeFromSuperview()
        }
    }
    
    // FUNCMARK

}


    
