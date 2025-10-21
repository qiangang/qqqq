//
//  AAA_PlaceholoderView_BBB.swift
//  VDCFramework
//
//  Created by Frankie on 2024/1/8.
//

import UIKit
import Package_net

open class AAA_PlaceholoderView_BBB: UIView {
    
    
    deinit {
        CCC_removeNoty_DDD()
    }
    
    
    // FUNCMARK
    public let kkk_imageView_lll = UIImageView()
    // FUNCMARK
    // FUNCMARK
    public let kkk_titleLabel_lll = UILabel()
    // FUNCMARK
    // FUNCMARK
    var kkk_scrollView_lll : UIScrollView?
    // FUNCMARK
    //是否是主播墙，主播墙有两个cell，引流，不算在内
    public var kkk_isWall_lll = false
    
    // FUNCMARK
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRectMake(0, 0, 240, 226)
        self.backgroundColor = .clear
        self.clipsToBounds = false
        self.alpha = 0
        CCC_configPlaceholderView_DDD()
        CCC_addNoty_DDD(#selector(CCC_netStateChange_DDD), "MMM_netStateChangeNoty_NNN")
    }
    
    @objc func CCC_netStateChange_DDD() {
        
        if kkk_server_lll.CCC_getNetState_DDD() == true {
            CCC_hasNet_DDD()
        }else {
            CCC_noNet_DDD()
        }
    }
    // FUNCMARK
    // FUNCMARK
    @objc func CCC_hasNet_DDD() {
        kkk_imageView_lll.kkk_localImage_lll = "MMM_banner_placeholderStr_NNN"
        kkk_titleLabel_lll.text = AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_nocontentavailable_NNN")
    }
    // FUNCMARK
    // FUNCMARK
    @objc func CCC_noNet_DDD() {
        kkk_imageView_lll.kkk_localImage_lll = "MMM_nonetImage_NNN"
        kkk_titleLabel_lll.text = AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_noNetTipStr_NNN")
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_configPlaceholderView_DDD() {
        kkk_imageView_lll.frame = CGRectMake(85, 0, 70, 70)
        kkk_imageView_lll.kkk_localImage_lll = "MMM_banner_placeholderStr_NNN"
        kkk_imageView_lll.backgroundColor = .clear
        self.addSubview(kkk_imageView_lll)
        
        kkk_titleLabel_lll.frame = CGRectMake(0, 70, 240, 46)
        kkk_titleLabel_lll.CCC_RMdet_DDD("MMM_nocontentavailable_NNN", 14, "CD873C")
        kkk_titleLabel_lll.textAlignment = .center
        self.addSubview(kkk_titleLabel_lll)
    }
    
    // FUNCMARK
    // FUNCMARK
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // FUNCMARK
    // FUNCMARK
    public override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        if newSuperview != nil && newSuperview?.isKind(of: UIScrollView.self) == false {
            return
        }
        if newSuperview == nil {
            return
        }
        CCC_removeObservers_DDD()
        
        if newSuperview != nil {
            kkk_scrollView_lll = (newSuperview as! UIScrollView)
            CCC_addObservers_DDD()
        }
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_addObservers_DDD() {
        kkk_scrollView_lll?.addObserver(self, forKeyPath: "contentSize", options: [NSKeyValueObservingOptions.new , NSKeyValueObservingOptions.old], context: nil)
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_removeObservers_DDD() {
        if kkk_scrollView_lll != nil{
            kkk_scrollView_lll?.removeObserver(self, forKeyPath: "contentSize")
            kkk_scrollView_lll = nil
        }
    }
    // FUNCMARK
    // FUNCMARK
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if self.isUserInteractionEnabled == false {
            return;
        }
        if keyPath == "contentSize"{
            if kkk_isWall_lll == false {
                if CCC_totalDataCount_DDD() > 0 {
                    self.alpha = 0
                }else{
                    self.alpha = 1
                }
            }else {
                if CCC_totalWallDataCount_DDD() > 0 {
                    self.alpha = 0
                }else {
                    self.alpha = 1
                }
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_totalDataCount_DDD() -> Int {
        var kkk_totalCount_lll = 0
        if kkk_scrollView_lll!.isKind(of: UITableView.self) {
            let kkk_tableViews_lll = kkk_scrollView_lll as! UITableView
            for kkk_number_lll in 0..<kkk_tableViews_lll.numberOfSections {
                kkk_totalCount_lll += kkk_tableViews_lll.numberOfRows(inSection: kkk_number_lll)
            }
        }
        if kkk_scrollView_lll!.isKind(of: UICollectionView.self) {
            let kkk_collectionViews_lll = kkk_scrollView_lll as! UICollectionView
            for kkk_number_lll in 0..<kkk_collectionViews_lll.numberOfSections {
                kkk_totalCount_lll += kkk_collectionViews_lll.numberOfItems(inSection: kkk_number_lll)
            }
        }
        var kkk_more_lll = 0.0
        if kkk_isWall_lll == true {
            kkk_more_lll = 150
        }
        self.x = kkk_scrollView_lll!.width/2 - 120
        self.y = kkk_scrollView_lll!.height/2 - 90 + kkk_more_lll
        return kkk_totalCount_lll;
    }
    func CCC_totalWallDataCount_DDD() -> Int {
        if kkk_scrollView_lll == nil {
            return 0
        }
        var kkk_totalCount_lll = 0
        if kkk_scrollView_lll!.isKind(of: UITableView.self) {
            let kkk_tableViews_lll = kkk_scrollView_lll as! UITableView
            for kkk_number_lll in 0..<kkk_tableViews_lll.numberOfSections {
                kkk_totalCount_lll += kkk_tableViews_lll.numberOfRows(inSection: kkk_number_lll)
            }
        }
        if kkk_scrollView_lll!.isKind(of: UICollectionView.self) {
            let kkk_collectionViews_lll = kkk_scrollView_lll as! UICollectionView
            for kkk_number_lll in 0..<kkk_collectionViews_lll.numberOfSections {
                if kkk_number_lll == kkk_collectionViews_lll.numberOfSections - 1 {
                    kkk_totalCount_lll += kkk_collectionViews_lll.numberOfItems(inSection: kkk_number_lll)
                }
            }
        }
        var kkk_more_lll = 0.0
        if kkk_isWall_lll == true {
            kkk_more_lll = 100
        }
        self.x = kkk_scrollView_lll!.width/2 - 120
        self.y = kkk_scrollView_lll!.height/2 - 90 + kkk_more_lll + 100
        return kkk_totalCount_lll;
    }
    // FUNCMARK
    // FUNCMARK
    public func CCC_showFindRoomBtn_DDD() {
        let kkk_btn_lll = UIButton()
        kkk_btn_lll.CCC_defaults_DDD(self, #selector(CCC_showVoiceListSender_DDD))
        kkk_btn_lll.setTitle(AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_voiceFindRoosStr_NNN"), for: .normal)
        kkk_btn_lll.setTitleColor(.black, for: .normal)
        kkk_btn_lll.titleLabel!.font = AAA_Font_BBB.CCC_MM_DDD(15)
        kkk_btn_lll.frame = CGRectMake(0, 182, 240, 44)
        _ = kkk_btn_lll.CCC_layers_DDD(true, 22, [AAA_GeneralOutModel_BBB.CCC_string_DDD("color_74FE7B_color"), AAA_GeneralOutModel_BBB.CCC_string_DDD("color_D3F366_color")])
        kkk_btn_lll.isHidden = true
        self.addSubview(kkk_btn_lll)
    }
    // FUNCMARK
    // FUNCMARK
    @objc func CCC_showVoiceListSender_DDD() {
        AAA_notyCenterModel_BBB.CCC_showVoiceListNpty_DDD()
    }
    // FUNCMARK
    
}

