//
//  AAA_wallCountryCell_BBB.swift
//  Wohoo_SDK
//
//  Created by Frankie on 05/03/2025.
//

import UIKit
import SnapKit

class AAA_wallCountryCell_BBB: UICollectionViewCell {
    
    let kkk_BtnView_lll: UIButton = {
        let kkk_ml_lll = UIButton(type: .custom)
        kkk_ml_lll.backgroundColor = CCC_colors_DDD("FFFAE6")
        kkk_ml_lll.layer.cornerRadius = 23.0
        kkk_ml_lll.layer.masksToBounds = true
        kkk_ml_lll.layer.borderWidth = 2
        kkk_ml_lll.layer.borderColor = CCC_colors_DDD("F7BF49").cgColor
        kkk_ml_lll.setTitleColor(CCC_colors_DDD("F7BF49"), for: .normal)
        kkk_ml_lll.setTitleColor(CCC_colors_DDD("CD873C"), for: .selected)
        kkk_ml_lll.isHighlighted = false
        kkk_ml_lll.isEnabled = false
        return kkk_ml_lll
    }()
    let kkk_lab_lll: UILabel = {
        let kkk_lable_lll = UILabel()
        kkk_lable_lll.textColor = CCC_colors_DDD("CD873C")
        kkk_lable_lll.textAlignment = .center
        kkk_lable_lll.font = .systemFont(ofSize: 16.0, weight: .medium)
        return kkk_lable_lll
    }()
//    let kkk_titleLabel_lll = UILabel()
//    let kkk_backImgView_lll = UIImageView()
    
    var kkk_isSel_lll = false
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        kkk_backImgView_lll.backgroundColor = CCC_colors_DDD(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_F5F5F5_color"))
        self.contentView.addSubview(self.kkk_BtnView_lll)
        self.kkk_BtnView_lll.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            make.top.equalTo(0)
        }
        self.contentView.addSubview(self.kkk_lab_lll)
        self.kkk_lab_lll.snp.makeConstraints { make in
//            make.center.equalTo(self.kkk_BtnView_lll)
            make.left.equalTo(self.kkk_BtnView_lll.snp.left)
            make.right.equalTo(self.kkk_BtnView_lll.snp.right)
            make.top.bottom.equalTo(self.kkk_BtnView_lll)
        }
//        kkk_backImgView_lll.backgroundColor = CCC_colors_DDD("FFFAE6")
//        kkk_backImgView_lll.frame = CGRectMake(0, 0, self.width, self.height)
//        kkk_backImgView_lll.CCC_round_DDD(24)
//        self.addSubview(kkk_backImgView_lll)
        
//        kkk_titleLabel_lll.CCC_MMdet_DDD("", 16, AAA_GeneralOutModel_BBB.CCC_string_DDD("color_111111_color"))
//        kkk_titleLabel_lll.frame = CGRectMake(0, 0, self.width, self.height)
//        kkk_titleLabel_lll.textAlignment = .center
//        self.addSubview(kkk_titleLabel_lll)
    }
    func CCC_titles_DDD(_ localTitle : String, _ selTitle : String) {
        
//        if localTitle == selTitle {
////            kkk_backImgView_lll.kkk_localImage_lll = "MMM_loginButtonBg_NNN"
//            self.kkk_BtnView_lll.isSelected = true
//            self.kkk_BtnView_lll.backgroundColor = CCC_colors_DDD("F7BF49")
//            
//        }else {
//            self.kkk_BtnView_lll.isSelected = false
//            self.kkk_BtnView_lll.backgroundColor = CCC_colors_DDD("FFFAE6")
//
////            kkk_backImgView_lll.image = nil
//        }
//        kkk_titleLabel_lll.text = localTitle
        self.kkk_BtnView_lll.setTitle(localTitle, for: .normal)
        self.kkk_lab_lll.text = localTitle
    }
    func CCC_titles_DDD(_ title : String) {
//        kkk_titleLabel_lll.text = title
        self.kkk_BtnView_lll.setTitle(title, for: .normal)
        self.kkk_lab_lll.text = title
    }
    func CCC_selects_DDD(_ select: Bool) {
        
//        if select == true {
//            self.kkk_BtnView_lll.isSelected = true
//            self.kkk_BtnView_lll.backgroundColor = CCC_colors_DDD("F7BF49")
//        }else {
//            self.kkk_BtnView_lll.isSelected = false
//            self.kkk_BtnView_lll.backgroundColor = CCC_colors_DDD("FFFAE6")
//        }
        kkk_isSel_lll = select
    }
    func CCC_blacks_DDD() {
        if kkk_isSel_lll == true {
            self.kkk_lab_lll.isHidden = false
            self.kkk_BtnView_lll.isSelected = true
            self.kkk_BtnView_lll.setTitleColor(CCC_colors_DDD("CD873C"), for: .selected)
            self.kkk_BtnView_lll.backgroundColor = CCC_colors_DDD("F7BF49")
            
        }else {
            self.kkk_lab_lll.isHidden = true
            self.kkk_BtnView_lll.isSelected = false
            self.kkk_BtnView_lll.setTitleColor(CCC_colors_DDD("F7BF49"), for: .normal)
            self.kkk_BtnView_lll.backgroundColor = CCC_colors_DDD("FFFAE6")
        }
//        kkk_backImgView_lll.backgroundColor = CCC_colors_DDD(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_2F2F2F_color"))
//        if kkk_isSel_lll == false {
//            kkk_titleLabel_lll.CCC_MMdet_DDD("", 16, AAA_GeneralOutModel_BBB.CCC_string_DDD("color_A1A1A1_color"))
//            kkk_backImgView_lll.layer.borderWidth = 0
//        }else {
//            kkk_titleLabel_lll.CCC_MMdet_DDD("", 16, AAA_GeneralOutModel_BBB.CCC_string_DDD("color_D3F366_color"))
//            kkk_backImgView_lll.layer.borderWidth = 1
//            kkk_backImgView_lll.layer.borderColor = CCC_CGcolor_DDD(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_D3F366_color"))
//        }
//        kkk_backImgView_lll.image = nil
    }
    func CCC_whites_DDD() {
        
//        kkk_backImgView_lll.backgroundColor = CCC_colors_DDD(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_F5F5F5_color"))
//        kkk_titleLabel_lll.CCC_MMdet_DDD("", 16, AAA_GeneralOutModel_BBB.CCC_string_DDD("color_111111_color"))
//        kkk_backImgView_lll.layer.borderWidth = 0
        
        self.kkk_lab_lll.isHidden = true
        self.kkk_BtnView_lll.setTitleColor(CCC_colors_DDD("CD873C"), for: .selected)
        self.kkk_BtnView_lll.setTitleColor(CCC_colors_DDD("F7BF49"), for: .normal)
        if kkk_isSel_lll == true {
            self.kkk_BtnView_lll.setTitleColor(CCC_colors_DDD("CD873C"), for: .normal)
            self.kkk_BtnView_lll.backgroundColor = CCC_colors_DDD("F7BF49")
        }else {
            self.kkk_BtnView_lll.setTitleColor(CCC_colors_DDD("F7BF49"), for: .normal)
            self.kkk_BtnView_lll.backgroundColor = CCC_colors_DDD("FFFAE6")
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
