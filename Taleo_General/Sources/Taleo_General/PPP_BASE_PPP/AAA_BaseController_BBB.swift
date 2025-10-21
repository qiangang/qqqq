//
//  AAA_BaseController_BBB.swift
//  YuzhanSinatv
//
//  Created by Ben on 25/6/2024.
//

import UIKit

open class AAA_BaseController_BBB: UIViewController, UINavigationControllerDelegate {
    ///导航颜色
    internal var kkk_navationColor_lll:UIColor = .clear

    ///是否隐藏导航   默认:false
    public var kkk_IsNaviBool_lll:Bool = false
    
    ///是否允许侧滑返回。默认：true
    internal var kkk_IsReturn_lll:Bool = true
    
    private lazy var CCC_navieBackground_DDD: UIView = {
        let kkk_groundView_lll = UIView()
        return kkk_groundView_lll
    }()
    public lazy var CCC_NameTitle_DDD: UILabel = {
        let kkk_crlaba_lll = UILabel()
        kkk_crlaba_lll.font = .init(name: "Bestime", size: 22.0)
        kkk_crlaba_lll.textColor = CCC_colors_DDD("CD873C")
        return kkk_crlaba_lll
    }()
    open lazy var CCC_BackBtn_DDD: UIButton = {
        let kkk_UpsideBtn_lll = UIButton()
        kkk_UpsideBtn_lll.addTarget(self, action: #selector(BackBtnItemBtnClick(_ :)), for: .touchUpInside)
        kkk_UpsideBtn_lll.kkk_localImage_lll = "UpsideIcon"
        kkk_UpsideBtn_lll.width = UIDevice.CCC_barHeight_DDD()
        kkk_UpsideBtn_lll.height = UIDevice.CCC_barHeight_DDD()
        kkk_UpsideBtn_lll.contentHorizontalAlignment = .left
        return kkk_UpsideBtn_lll
    }()
    var autoFadeNaviBoard:Bool = false {
        didSet {
            if self.navigationController != nil {
                let navi = self.navigationController! as? AAA_BaseNavController_BBB
                if navi != nil && navi!.isKind(of: AAA_BaseNavController_BBB.self){
                    navi!.updateNavigationView()
                }
            }
        }
    }
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        let kkk_className_lll = String(describing: type(of: self))
        if kkk_className_lll == "AAA_AnchorsWallController_BBB" || kkk_className_lll == "AAA_LiveController_BBB" || kkk_className_lll == "AAA_ChatListController_BBB" || kkk_className_lll == "AAA_MineMainCenterController_BBB" || kkk_className_lll == "AAA_VoiceController_BBB" {
            CCC_BackBtn_DDD.isHidden = true
        }else if kkk_className_lll == "AAA_VideoShowController_BBB" || kkk_className_lll == "AAA_ShowVc_BBB" || kkk_className_lll == "AAA_VoiceController_BBB" {
            CCC_BackBtn_DDD.isHidden = true
        }else {
        }
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: CCC_BackBtn_DDD)
        self.view.addSubview(CCC_navieBackground_DDD)
        CCC_navieBackground_DDD.addSubview(CCC_NameTitle_DDD)
        CCC_NameTitle_DDD.snp.makeConstraints { make in
            make.center.equalTo(CCC_navieBackground_DDD)
        }
        self.navigationItem.titleView = CCC_navieBackground_DDD
        ///侧滑 返回
//        let kkk_screenEdgePan_lll = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(CCC_handleScreenEdgePan_DDD(_:)))
//        kkk_screenEdgePan_lll.edges = .left
//        view.addGestureRecognizer(kkk_screenEdgePan_lll)
    }
    // FUNCMARK
    // FUNCMARK
    @objc
    private func CCC_handleScreenEdgePan_DDD(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .ended:
            self.navigationController?.popViewController(animated: true)
        default:
            break
        }
    }
    public override var preferredStatusBarStyle: UIStatusBarStyle{
        return .darkContent
     }
    @objc internal func BackBtnItemBtnClick(_ sender:UIButton){
        if self.navigationController?.visibleViewController != nil {
            self.navigationController?.popViewController(animated: true)
        }
        self.dismiss(animated: true)
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        autoFadeNaviBoard = false
    }
    
    open func CCC_SetMyNaview_DDD(){
                
        view.backgroundColor = CCC_colors_DDD("FFFAE6")
        
        let kkk_imgv1_lll = UIImageView()
        kkk_imgv1_lll.frame = CGRectMake(0, 0, self.view.width, UIDevice.CCC_naviHeight_DDD())
        kkk_imgv1_lll.image = UIImage.CCC_localImage_DDD("BackgroundNavigationIcon")
        kkk_imgv1_lll.contentMode = .scaleToFill
        view.addSubview(kkk_imgv1_lll)
        
        let kkk_imgv2_lll = UIImageView()
        kkk_imgv2_lll.frame = CGRectMake(0, UIDevice.CCC_naviHeight_DDD()-6, self.view.width, 30)
        kkk_imgv2_lll.image = UIImage.CCC_localImage_DDD("CurtainIcon")
        kkk_imgv2_lll.contentMode = .scaleToFill
        view.addSubview(kkk_imgv2_lll)
        
        let kkk_line_lll = UIView.init()
        kkk_line_lll.backgroundColor = CCC_colors_DDD("F7BF49")
        kkk_line_lll.frame = CGRectMake(0, UIDevice.CCC_naviHeight_DDD()-5, self.view.width, 5)
        view.addSubview(kkk_line_lll)
        view.sendSubviewToBack(kkk_line_lll)
        view.sendSubviewToBack(kkk_imgv1_lll)
        view.sendSubviewToBack(kkk_imgv2_lll)
    }
}

