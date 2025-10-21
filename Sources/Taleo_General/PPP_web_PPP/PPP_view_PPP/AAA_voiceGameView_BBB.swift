//
//  AAA_voiceGameView_BBB.swift
//  Wohoo
//
//  Created by Frankie on 28/08/2024.
//

import UIKit
import Package_net

class AAA_voiceGameView_BBB: AAA_baseView_BBB, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // FUNCMARK
    @IBOutlet weak var kkk_baseView_lll: UIView!
    // FUNCMARK
    // FUNCMARK
    @IBOutlet weak var kkk_collect_lll: UICollectionView!
    // FUNCMARK
    // FUNCMARK
    @IBOutlet weak var kkk_titleLabel_lll: UILabel!
    // FUNCMARK
    @IBOutlet weak var kkk_titleCollect_lll: UICollectionView!
    // FUNCMARK
    @IBOutlet weak var kkk_titleLayout_lll: UICollectionViewFlowLayout! {
        didSet {
            kkk_titleLayout_lll.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    var kkk_roomId_lll = 1
    // FUNCMARK
    // FUNCMARK
    var kkk_allList_lll = NSMutableArray()
    // FUNCMARK
    // FUNCMARK
    var kkk_titleList_lll : [String] = []
    // FUNCMARK
    // FUNCMARK
    let kkk_carve_lll = (UIScreen.main.bounds.width - 304)/3
    // FUNCMARK
    // FUNCMARK
    var kkk_isLoads_lll = false
    // FUNCMARK
    // FUNCMARK
    var kkk_titleSelIndex_lll = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.width = kkk_WIDTH_lll
        self.height = kkk_HEIGHT_lll
        CCC_configs_DDD()
    }
    override func CCC_configs_DDD() {
        kkk_type_lll = 2
        
        
        kkk_titleCollect_lll.CCC_regCell_DDD("AAA_gameTitleCell_BBB", kkk_bundles_lll)
        kkk_titleCollect_lll.delegate = self
        kkk_titleCollect_lll.dataSource = self
        
        
        kkk_collect_lll.delegate = self
        kkk_collect_lll.dataSource = self
        kkk_collect_lll.CCC_regCell_DDD("AAA_voiceGameCell_BBB", kkk_bundles_lll)
        
        kkk_titleLabel_lll.text = AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_game_NNN")
        
        CCC_addNoty_DDD(#selector(CCC_hide_DDD), "MMM_gameRIsClose_NNN")
    }
    // FUNCMARK
    // FUNCMARK
    override func CCC_show_DDD(_ view: UIView) {
        super.CCC_show_DDD(view)
        if kkk_allList_lll.count == 0 {
            CCC_loadGame_DDD()
        }
    }
    // FUNCMARK
    // FUNCMARK
    @IBAction func CCC_closeView_DDD(_ sender: Any) {
        CCC_hide_DDD()
    }
    // FUNCMARK
    // FUNCMARK
    override func CCC_hide_DDD() {
        super.CCC_hide_DDD()
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_loadGame_DDD() {
        var kkk_dic_lll = [String: Any]()
        kkk_dic_lll[kkk_posStr_lll] = 3
        kkk_dic_lll[kkk_allRoomIDStr_lll] = kkk_roomId_lll
        kkk_server_lll.CCC_getVoiceGameList_DDD(kkk_dic_lll as NSDictionary) { [weak self] array in
            self?.kkk_allList_lll.removeAllObjects()
            self?.kkk_titleList_lll.removeAll()
            for kkk_dics_lll in array {
                self?.kkk_allList_lll.add((kkk_dics_lll as! NSDictionary).CCC_keyArray_DDD(kkk_utsStr_lll))
                self?.kkk_titleList_lll.append((kkk_dics_lll as! NSDictionary).CCC_keyStr_DDD(kkk_titleStr_lll))
            }
            self?.kkk_collect_lll.reloadData()
            self?.kkk_titleCollect_lll.reloadData()
        }
    }
    // FUNCMARK
    // FUNCMARK
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return kkk_titleList_lll.count
        }
        if kkk_allList_lll.count == 0 {return 0}
        return (kkk_allList_lll[kkk_titleSelIndex_lll] as! NSArray).count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 1 {
            return 0
        }
        return kkk_carve_lll
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 1 {
            return 24
        }
        return 0
    }
    // FUNCMARK
    // FUNCMARK
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            let kkk_cell_lll = collectionView.dequeueReusableCell(withReuseIdentifier: "AAA_gameTitleCell_BBB", for: indexPath) as! AAA_gameTitleCell_BBB
            kkk_cell_lll.kkk_titleLabel_lll.setTitle(kkk_titleList_lll[indexPath.item], for: .normal)
            kkk_cell_lll.kkk_isSelecteds_lll = kkk_titleSelIndex_lll == indexPath.item
            return kkk_cell_lll
        }
        let kkk_cell_lll = collectionView.dequeueReusableCell(withReuseIdentifier: "AAA_voiceGameCell_BBB", for: indexPath) as! AAA_voiceGameCell_BBB
        let kkk_dics_lll = (kkk_allList_lll[kkk_titleSelIndex_lll] as! NSArray)[indexPath.item] as! NSDictionary
        kkk_cell_lll.kkk_utImageView_lll.CCC_imageUrl_DDD(kkk_dics_lll.CCC_keyStr_DDD(kkk_iconStr_lll))
        kkk_cell_lll.kkk_utNameLabel_lll.text = kkk_dics_lll.CCC_keyStr_DDD(kkk_nameStr_lll)
        return kkk_cell_lll
    }
    // FUNCMARK
    // FUNCMARK
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            if kkk_titleSelIndex_lll != indexPath.item {
                kkk_titleSelIndex_lll = indexPath.item
                kkk_collect_lll.reloadData()
                kkk_titleCollect_lll.reloadData()
            }
        }else {
            AAA_webView_BBB.kkk_share_lll.CCC_hidePlay_DDD()
            let kkk_dic_lll = (kkk_allList_lll[indexPath.section] as! NSArray)[indexPath.item] as! NSDictionary
            var kkk_carve_lll : CGFloat = (kkk_dic_lll[kkk_mini_ratioStr_lll] ?? 1.00) as! CGFloat
            if kkk_carve_lll == 0 {
                kkk_carve_lll = 1
            }
            let kkk_urls_lll = kkk_dic_lll.CCC_keyStr_DDD(kkk_linkStr_lll)
            AAA_webView_BBB.kkk_share_lll.kkk_ratio_lll = kkk_carve_lll
            AAA_webView_BBB.kkk_share_lll.kkk_roomId_lll = kkk_roomId_lll
            AAA_webView_BBB.kkk_share_lll.kkk_playId_lll = kkk_dic_lll.CCC_keyInt_DDD(kkk_idStr_lll)
            AAA_webView_BBB.kkk_share_lll.kkk_urlStr_lll = kkk_urls_lll
            AAA_webView_BBB.kkk_share_lll.kkk_isShowFromList_lll = true
            AAA_webView_BBB.kkk_share_lll.kkk_localType_lll = 0
            AAA_webView_BBB.kkk_share_lll.CCC_show_DDD(1)
            CCC_hide_DDD()
        }
    }
    
    
    
    // FUNCMARK
    // FUNCMARK
    
    func CCC_clears_DDD() {
        kkk_allList_lll.removeAllObjects()
        kkk_titleList_lll.removeAll()
        kkk_collect_lll!.reloadData()
        AAA_webView_BBB.kkk_share_lll.kkk_roomId_lll = 0
    }
    // FUNCMARK
}
