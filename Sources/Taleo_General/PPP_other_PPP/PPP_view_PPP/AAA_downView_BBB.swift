//
//  AAA_downView_BBB.swift
//  Wohoo_SDK_A
//
//  Created by Frankie on 15/05/2025.
//

import UIKit


public class AAA_downView_BBB: UIView {

    
    
    let kkk_roundView_lll = UIView()
    let kkk_circleLayer_lll = CAShapeLayer()
    

    
    public func CCC_gresChange_DDD(_ progress: CGFloat) {
        CCC_updateProgress_DDD(progress)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRectMake(0, 0, 42, 42)
        self.CCC_round_DDD(21)
        self.backgroundColor = AAA_GeneralOutModel_BBB.CCC_color_DDD("color_232323_color", 0.6)
        
        kkk_roundView_lll.frame = CGRectMake(2, 2, 38, 38)
        kkk_roundView_lll.backgroundColor = .clear
        kkk_roundView_lll.CCC_round_DDD(19)
        kkk_roundView_lll.clipsToBounds = true
        self.addSubview(kkk_roundView_lll)
        
        kkk_circleLayer_lll.fillColor = UIColor.clear.cgColor
        kkk_circleLayer_lll.strokeColor = AAA_GeneralOutModel_BBB.CCC_cgColor_DDD("color_FFFFFF_color", 0.6)
        kkk_circleLayer_lll.lineWidth = 19
        kkk_circleLayer_lll.lineCap = .butt
        kkk_roundView_lll.layer.addSublayer(kkk_circleLayer_lll)
        
        CCC_updateProgress_DDD(0)
    }
    
    public func CCC_updateProgress_DDD(_ progress: CGFloat) {
        
        let kkk_startAngle_lll = -CGFloat.pi / 2
        let kkk_endAngle_lll = kkk_startAngle_lll + 2 * .pi * progress
        let kkk_center_lll = CGPoint(x: kkk_roundView_lll.bounds.midX, y: kkk_roundView_lll.bounds.midY)
        let kkk_radius_lll = min(kkk_roundView_lll.bounds.width, kkk_roundView_lll.bounds.height) / 2 - kkk_circleLayer_lll.lineWidth / 2
        
        let kkk_path_lll = UIBezierPath(arcCenter: kkk_center_lll,
                               radius: kkk_radius_lll,
                               startAngle: kkk_startAngle_lll,
                               endAngle: kkk_endAngle_lll,
                               clockwise: true)
        
        
        kkk_circleLayer_lll.path = kkk_path_lll.cgPath
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
