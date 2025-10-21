//
//  AAA_gameListView_BBB.swift
//  Module_General
//
//  Created by Frankie on 22/05/2025.
//

import UIKit
import Package_net


class AAA_gameListView_BBB: AAA_baseView_BBB, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
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
    
    
    
    let kkk_widths_lll = (kkk_WIDTH_lll - 90.0)/3.0
    var kkk_webView_lll : AAA_webView_BBB!
    let kkk_list_lll = NSMutableArray()
    var kkk_titleList_lll : [String] = []
    var kkk_isLoads_lll = false
    var kkk_aniView_lll : AAA_WaitAniView_BBB!
    var kkk_localId_lll = -1
    var kkk_titleSelIndex_lll = 0
    var kkk_roomIds_lll = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CCC_configs_DDD()
    }
    override func CCC_configs_DDD() {
        self.frame = CGRectMake(0, 0, kkk_WIDTH_lll, kkk_HEIGHT_lll)
        
        
        kkk_type_lll = 2
        
        kkk_titleCollect_lll.CCC_regCell_DDD("AAA_gameTitleCell_BBB", kkk_bundles_lll)
        kkk_titleCollect_lll.delegate = self
        kkk_titleCollect_lll.dataSource = self
        
        
        kkk_collect_lll.delegate = self
        kkk_collect_lll.dataSource = self
        kkk_collect_lll.CCC_regCell_DDD("AAA_voiceGameCell_BBB", kkk_bundles_lll)
        
        kkk_titleLabel_lll.text = AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_game_NNN")
        
        CCC_noty_DDD()
    }
    func CCC_noty_DDD() {
        CCC_addNoty_DDD(#selector(CCC_clean_DDD), "MMM_gamelistClean_NNN")
        CCC_addNoty_DDD(#selector(CCC_hide_DDD), "MMM_gameRIsClose_NNN")
    }
    @objc func CCC_clean_DDD() {
        kkk_server_lll.CCC_cancelRequest_DDD()
        kkk_list_lll.removeAllObjects()
        kkk_titleList_lll.removeAll()
        kkk_collect_lll.reloadData()
        kkk_titleCollect_lll.reloadData()
        kkk_localId_lll = -1
        kkk_webView_lll?.kkk_roomId_lll = 0
        AAA_webView_BBB.kkk_share_lll.CCC_hidePlay_DDD()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return kkk_titleList_lll.count
        }
        if kkk_list_lll.count == 0 {return 0}
        return (kkk_list_lll[kkk_titleSelIndex_lll] as! NSArray).count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 1 {
            return 0
        }
        return (UIScreen.main.bounds.width - 304)/3
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
        let kkk_dics_lll = (kkk_list_lll[kkk_titleSelIndex_lll] as! NSArray)[indexPath.item] as! NSDictionary
        kkk_cell_lll.kkk_utImageView_lll.CCC_imageUrl_DDD(kkk_dics_lll.CCC_keyStr_DDD(kkk_iconStr_lll))
        kkk_cell_lll.kkk_utNameLabel_lll.text = kkk_dics_lll.CCC_keyStr_DDD(kkk_nameStr_lll)
        return kkk_cell_lll
    }
    @IBAction func CCC_closeView_DDD(_ sender: Any) {
        super.CCC_hide_DDD()
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
            let kkk_dic_lll = (kkk_list_lll[indexPath.section] as! NSArray)[indexPath.item] as! NSDictionary
            
            let kkk_url_lll = URL(string: kkk_dic_lll[kkk_linkStr_lll] as! String)!
            var kkk_carve_lll : CGFloat = (kkk_dic_lll[kkk_mini_ratioStr_lll] ?? 1.00) as! CGFloat
            if kkk_carve_lll == 0 {
                kkk_carve_lll = 1
            }
            
            
                AAA_webView_BBB.kkk_share_lll.CCC_hidePlay_DDD()
                AAA_webView_BBB.kkk_share_lll.kkk_ratio_lll = kkk_carve_lll
                AAA_webView_BBB.kkk_share_lll.kkk_roomId_lll = kkk_roomIds_lll
                AAA_webView_BBB.kkk_share_lll.kkk_playId_lll = kkk_dic_lll.CCC_keyInt_DDD(kkk_idStr_lll)
                AAA_webView_BBB.kkk_share_lll.kkk_urlStr_lll = kkk_dic_lll[kkk_linkStr_lll] as! String
                AAA_webView_BBB.kkk_share_lll.kkk_isShowFromList_lll = true
            AAA_webView_BBB.kkk_share_lll.kkk_localType_lll = 0
                AAA_webView_BBB.kkk_share_lll.CCC_show_DDD(1)
                CCC_hide_DDD()
            
            
            CCC_hide_DDD()
        }
    }
    
    func CCC_show_DDD(_ roomId : Int) {
        kkk_roomIds_lll = roomId
        kkk_localId_lll = roomId
        if AAA_webView_BBB.kkk_share_lll.kkk_roomId_lll != 0 && AAA_webView_BBB.kkk_share_lll.kkk_roomId_lll == roomId && AAA_webView_BBB.kkk_share_lll.kkk_localType_lll == 0 {
            AAA_webView_BBB.kkk_share_lll.CCC_show_DDD(1)
        }else {
            CCC_loadData_DDD(roomId)
            CCC_show_DDD(kkk_Window_lll!)
        }
    }
    func CCC_loadData_DDD(_ roomId : Int) {
        var kkk_dic_lll = [String: Any]()
        kkk_dic_lll[kkk_posStr_lll] = 2
        kkk_dic_lll[kkk_allRoomIDStr_lll] = roomId
        kkk_server_lll.CCC_getVoiceGameList_DDD(kkk_dic_lll as NSDictionary) { [weak self] array in
            self?.kkk_list_lll.removeAllObjects()
            self?.kkk_titleList_lll.removeAll()
            for kkk_dics_lll in array {
                self?.kkk_list_lll.add((kkk_dics_lll as! NSDictionary).CCC_keyArray_DDD(kkk_utsStr_lll))
                self?.kkk_titleList_lll.append((kkk_dics_lll as! NSDictionary).CCC_keyStr_DDD(kkk_titleStr_lll))
            }
            self?.kkk_collect_lll.reloadData()
            self?.kkk_titleCollect_lll.reloadData()
        }
    }
}
