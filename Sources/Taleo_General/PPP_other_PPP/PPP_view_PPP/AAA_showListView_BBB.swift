//
//  AAA_showListView_BBB.swift
//  Wohoo_SDK
//
//  Created by Frankie on 05/03/2025.
//

import UIKit

class AAA_showListView_BBB: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var kkk_isShowAlpha_lll = false {didSet{CCC_showAlphaView_DDD()}}    
    var kkk_cellSize_lll = CGSizeZero
    var kkk_leadTra_lll = 0.0
    var kkk_lineSpa_lll = 0.0
    var kkk_cellCount_lll = 0
    
    var kkk_backBtn_lll = UIButton()
    let kkk_baseView_lll = UIView()
    var kkk_collect_lll : UICollectionView!
    let kkk_titleLabel_lll = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: CGRectMake(0, 0, kkk_WIDTH_lll, kkk_HEIGHT_lll))
        self.backgroundColor = .clear
        
        kkk_backBtn_lll.frame = self.frame
        kkk_backBtn_lll.backgroundColor = .clear
        kkk_backBtn_lll.addTarget(self, action: #selector(CCC_hide_DDD), for: .touchUpInside)
        self.addSubview(kkk_backBtn_lll)
        
        kkk_baseView_lll.frame = CGRectMake(0, self.height, self.width, 0)
        kkk_baseView_lll.backgroundColor = .white
        kkk_baseView_lll.CCC_round_DDD(20)
        kkk_baseView_lll.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.addSubview(kkk_baseView_lll)
        
        kkk_titleLabel_lll.frame = CGRectMake(50, 8, kkk_WIDTH_lll - 100, 39)
        kkk_titleLabel_lll.textAlignment = .center
        kkk_titleLabel_lll.textColor = CCC_colors_DDD("CD873C")
        kkk_titleLabel_lll.font = .systemFont(ofSize: 16, weight: .bold)
        kkk_baseView_lll.addSubview(kkk_titleLabel_lll)
        
        let kkk_closeBtn_lll = UIButton()
        kkk_closeBtn_lll.CCC_images_DDD("MMM_grayCloseImage_NNN")
        kkk_closeBtn_lll.frame = CGRectMake(kkk_WIDTH_lll - 50, 6, 40, 40)
        kkk_closeBtn_lll.backgroundColor = .clear
        kkk_closeBtn_lll.addTarget(self, action: #selector(CCC_hide_DDD), for: .touchUpInside)
        kkk_baseView_lll.addSubview(kkk_closeBtn_lll)
        
        let kkk_layout_lll = UICollectionViewFlowLayout()
        kkk_layout_lll.scrollDirection = .vertical
        
        kkk_collect_lll = UICollectionView(frame: kkk_baseView_lll.frame, collectionViewLayout: kkk_layout_lll)
        kkk_baseView_lll.addSubview(kkk_collect_lll)
        kkk_collect_lll.scrollsToTop = false
        kkk_collect_lll.bounces = false
        kkk_collect_lll.showsHorizontalScrollIndicator = false
        kkk_collect_lll.showsVerticalScrollIndicator = false
        kkk_collect_lll.dataSource = self
        kkk_collect_lll.delegate = self
        kkk_collect_lll.backgroundColor = UIColor.clear
//        kkk_collect_lll.CCC_constTopLeaFrame_DDD(0, 0, 0, 0)
        CCC_configView_DDD()
        CCC_addNoty_DDD(#selector(CCC_hideNoteView_DDD), "MMM_hideKeyWindShow_NofificationStr_NNN")
    }
    
    @objc func CCC_hideNoteView_DDD(){
        self.CCC_hide_DDD()
    }
    func CCC_configView_DDD() {
        
    }
    //显示
    func CCC_show_DDD() {
        kkk_baseView_lll.y = self.height
        kkk_backBtn_lll.alpha = 0
        kkk_Window_lll?.addSubview(self)
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else {return}
            self.kkk_backBtn_lll.alpha = 1
            self.kkk_baseView_lll.y = self.height - self.kkk_baseView_lll.height
        }
    }
    //隐藏
    @objc func CCC_hide_DDD() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else {return}
            self.kkk_backBtn_lll.alpha = 0
            self.kkk_baseView_lll.y = self.height
        } completion: { [weak self] Bool in
            self?.removeFromSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func CCC_showAlphaView_DDD() {
        if kkk_isShowAlpha_lll == true {
            kkk_backBtn_lll.backgroundColor = AAA_GeneralOutModel_BBB.CCC_color_DDD("color_232323_color", 0.6)
        }else {
            kkk_backBtn_lll.backgroundColor = .clear
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kkk_cellCount_lll
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let kkk_cell_lll = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        return kkk_cell_lll
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return kkk_cellSize_lll
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: kkk_leadTra_lll, bottom: 0, right: kkk_leadTra_lll)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return kkk_lineSpa_lll
    }
}
