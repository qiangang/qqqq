//
//  AAA_gameMusicModel_BBB.swift
//  VDCFramework
//
//  Created by Frankie on 14/05/2024.
//

import UIKit
import Package_net

class AAA_gameMusicModel_BBB: NSObject {
    
    
    // FUNCMARK
    let kkk_list_lll = NSMutableArray()
    // FUNCMARK
    // FUNCMARK
    let kkk_allDic_lll = NSMutableDictionary()
    // FUNCMARK
    // FUNCMARK
    let kkk_playList_lll = NSMutableArray()
    // FUNCMARK
    // FUNCMARK
    let kkk_dic_lll = NSMutableDictionary()
    // FUNCMARK
    // FUNCMARK
    
    var kkk_bgVolume_lll = 80
    // FUNCMARK
    // FUNCMARK
    var kkk_volume_lll = 80
    // FUNCMARK
    // FUNCMARK
    

    class func CCC_musicInfo_DDD(_ dic : NSDictionary) {
        
        
        
        AAA_musicPlayer_BBB.kkk_share_lll.CCC_setAgoraConfig_DDD()
        let kkk_type_lll = dic[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_typeKey_NNN")] as! Int
        if kkk_type_lll == 1000 {
            let kkk_infoDic_lll = dic[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_dataKey_NNN")] as! NSDictionary
            let kkk_localVersion_lll = UserDefaults.standard.object(forKey: "v") ?? ""
            let kkk_version_lll = String(format: "%@", kkk_infoDic_lll["v"] as! CVarArg)
            let kkk_downList_lll : NSArray = kkk_infoDic_lll[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_listKey_NNN")] as! NSArray
            if kkk_version_lll.count != 0 && kkk_version_lll != kkk_localVersion_lll as! String {
                //清空
                let kkk_manager_lll = FileManager()
                let kkk_savePath_lll = NSHomeDirectory().appending("/Library/Caches/")
                for kkk_nums_lll in 0..<kkk_downList_lll.count {
                    let kkk_musicDic_lll = kkk_downList_lll[kkk_nums_lll] as! NSDictionary
                    let kkk_urls_lll = NSURL(string: kkk_musicDic_lll[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_uriKey_NNN")] as! String)
                    let kkk_removePath_lll = kkk_savePath_lll + kkk_urls_lll!.lastPathComponent!
                    do{
                        try kkk_manager_lll.removeItem(atPath: kkk_removePath_lll)
                    }catch{}
                }
            }
            CCC_musicList_DDD(kkk_downList_lll)
            UserDefaults.standard.set(kkk_version_lll, forKey: "v")
        }else if kkk_type_lll == 1001 {
            let kkk_infoDic_lll = dic[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_dataKey_NNN")] as! NSDictionary
            AAA_gameMusicModel_BBB.kkk_share_lll.kkk_bgVolume_lll = kkk_infoDic_lll[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_volume0Key_NNN")] as! Int
            AAA_gameMusicModel_BBB.kkk_share_lll.kkk_volume_lll = kkk_infoDic_lll[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_volume1Key_NNN")] as! Int
            
            let kkk_stopList_lll = AAA_gameMusicModel_BBB.kkk_share_lll.kkk_allDic_lll.allKeys as NSArray
            for kkk_numbers_lll in 0..<kkk_stopList_lll.count {
                let kkk_stopId_lll = kkk_stopList_lll[kkk_numbers_lll]
                let kkk_stopType_lll = AAA_gameMusicModel_BBB.kkk_share_lll.kkk_allDic_lll[kkk_stopId_lll] as! Int
                if kkk_stopType_lll == 0 {
                    kkk_agora_lll!.setVolumeOfEffect(Int32(kkk_stopId_lll as! String)!, withVolume: Int32(AAA_gameMusicModel_BBB.kkk_share_lll.kkk_bgVolume_lll))
                }else{
                    kkk_agora_lll!.setVolumeOfEffect(Int32(kkk_stopId_lll as! String)!, withVolume: Int32(AAA_gameMusicModel_BBB.kkk_share_lll.kkk_volume_lll))
                }
            }
        }else if kkk_type_lll == 1002 {
            let kkk_infoDic_lll = dic[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_dataKey_NNN")] as! NSDictionary
            let kkk_key_lll = kkk_infoDic_lll[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_keyKey_NNN")] as! NSString
            let kkk_justArray_lll = kkk_key_lll.components(separatedBy: "_") as NSArray
            if kkk_justArray_lll.count > 1 {
                let kkk_justKey_lll = kkk_justArray_lll.lastObject as! NSString
                let kkk_path_lll : String = AAA_gameMusicModel_BBB.kkk_share_lll.kkk_dic_lll[kkk_key_lll] as! String
                let kkk_loops_lll = kkk_infoDic_lll[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_isLoopKey_NNN")] as! Bool
                if kkk_path_lll.count > 0{
                    var kkk_gain_lll = 0
                    if kkk_loops_lll == true {
                        kkk_gain_lll = -1
                    }
                    let kkk_numbers_lll = Int32(kkk_justKey_lll as String) ?? 0
                    kkk_agora_lll!.playEffect(kkk_numbers_lll, filePath: kkk_path_lll, loopCount: kkk_gain_lll, pitch: 1, pan: 1, gain: AAA_gameMusicModel_BBB.kkk_share_lll.kkk_bgVolume_lll, startPos: 0)
                    AAA_gameMusicModel_BBB.kkk_share_lll.kkk_playList_lll.add(kkk_numbers_lll)
                }else{
                    var kkk_gain_lll = 0
                    if kkk_loops_lll == true {
                        kkk_gain_lll = -1
                    }
                    let kkk_numbers_lll = Int32(kkk_justKey_lll as String) ?? 0
                    kkk_agora_lll!.playEffect(kkk_numbers_lll, filePath: kkk_path_lll, loopCount: kkk_gain_lll, pitch: 1, pan: 1, gain: AAA_gameMusicModel_BBB.kkk_share_lll.kkk_bgVolume_lll, startPos: 0)
                    AAA_gameMusicModel_BBB.kkk_share_lll.kkk_playList_lll.add(kkk_numbers_lll)
                    for kkk_number_lll in 0..<AAA_gameMusicModel_BBB.kkk_share_lll.kkk_list_lll.count {
                        let kkk_playDic_lll = AAA_gameMusicModel_BBB.kkk_share_lll.kkk_list_lll[kkk_number_lll] as! NSDictionary
                        let kkk_keys_lll = kkk_playDic_lll[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_keyKey_NNN")] as! NSString
                        if kkk_keys_lll == kkk_key_lll {
                            let kkk_urls_lll = kkk_playDic_lll[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_uriKey_NNN")] as! NSString
                            kkk_agora_lll!.playEffect(kkk_numbers_lll, filePath: kkk_urls_lll as String, loopCount: kkk_gain_lll, pitch: 1, pan: 1, gain: AAA_gameMusicModel_BBB.kkk_share_lll.kkk_bgVolume_lll, startPos: 0)
                            AAA_gameMusicModel_BBB.kkk_share_lll.kkk_playList_lll.add(kkk_numbers_lll)
                        }
                    }
                }
            }
        }else if kkk_type_lll == 1003 {
            let kkk_infoDic_lll = dic[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_dataKey_NNN")] as! NSDictionary
            let kkk_key_lll = kkk_infoDic_lll[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_keyKey_NNN")] as! NSString
            let kkk_justArray_lll = kkk_key_lll.components(separatedBy: "_") as NSArray
            if kkk_justArray_lll.count > 1 {
                let kkk_path_lll : String = AAA_gameMusicModel_BBB.kkk_share_lll.kkk_dic_lll[kkk_key_lll] as! String
                if kkk_path_lll.count > 0{
                    let kkk_numbers_lll = Int32(kkk_key_lll as String) ?? 0
                    kkk_agora_lll!.stopEffect(kkk_numbers_lll)
                }
            }else if kkk_key_lll.length == 0 {
                let kkk_types_lll = kkk_infoDic_lll[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_typeKey_NNN")] as! Int
                let kkk_stopList_lll = AAA_gameMusicModel_BBB.kkk_share_lll.kkk_allDic_lll.allKeys as NSArray
                for kkk_numbers_lll in 0..<kkk_stopList_lll.count {
                    let kkk_stopId_lll = kkk_stopList_lll[kkk_numbers_lll]
                    let kkk_stopType_lll = AAA_gameMusicModel_BBB.kkk_share_lll.kkk_allDic_lll[kkk_stopId_lll] as! Int
                    if kkk_types_lll == kkk_stopType_lll {
                        kkk_agora_lll!.stopEffect(Int32(kkk_stopId_lll as! String) ?? 0)
                    }
                }
            }
        }else if kkk_type_lll == 1004 {
            let kkk_infoDic_lll = dic[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_dataKey_NNN")] as! NSDictionary
            let kkk_key_lll = kkk_infoDic_lll[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_keyKey_NNN")] as! NSString
            let kkk_justArray_lll = kkk_key_lll.components(separatedBy: "_") as NSArray
            if kkk_justArray_lll.count > 1 {
                let kkk_path_lll : String = AAA_gameMusicModel_BBB.kkk_share_lll.kkk_dic_lll[kkk_key_lll] as! String
                if kkk_path_lll.count > 0{
                    let kkk_numbers_lll = Int32(kkk_key_lll as String) ?? 0
                    kkk_agora_lll!.stopEffect(kkk_numbers_lll)
                }
            }else if kkk_key_lll.length == 0 {
                let kkk_types_lll = kkk_infoDic_lll[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_typeKey_NNN")] as! Int
                let kkk_stopList_lll = AAA_gameMusicModel_BBB.kkk_share_lll.kkk_allDic_lll.allKeys as NSArray
                for kkk_numbers_lll in 0..<kkk_stopList_lll.count {
                    let kkk_stopId_lll = kkk_stopList_lll[kkk_numbers_lll]
                    let kkk_stopType_lll = AAA_gameMusicModel_BBB.kkk_share_lll.kkk_allDic_lll[kkk_stopId_lll] as! Int
                    if kkk_types_lll == kkk_stopType_lll {
                        kkk_agora_lll!.stopEffect(Int32(kkk_stopId_lll as! String) ?? 0)
                    }
                }
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    
    
    class func CCC_musicList_DDD(_ array : NSArray) {
        AAA_gameMusicModel_BBB.kkk_share_lll.kkk_list_lll.addObjects(from: array as! [Any])
        if AAA_gameMusicModel_BBB.kkk_share_lll.kkk_list_lll.count > 0 {
            let kkk_downDic_lll = AAA_gameMusicModel_BBB.kkk_share_lll.kkk_list_lll[0] as! NSDictionary
            AAA_gameMusicModel_BBB.kkk_share_lll.kkk_list_lll.removeObject(at: 0)
            kkk_server_lll.CCC_downloadData_DDD(kkk_downDic_lll[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_uriKey_NNN")] as! String) { string in
                let kkk_key_lll = kkk_downDic_lll[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_keyKey_NNN")] as! NSString
                let kkk_justArray_lll = kkk_key_lll.components(separatedBy: "_") as NSArray
                if kkk_justArray_lll.count > 1 {
                    let kkk_justKey_lll = kkk_justArray_lll[1] as! NSString
                    AAA_gameMusicModel_BBB.kkk_share_lll.kkk_dic_lll.setObject(string, forKey: kkk_key_lll)
                    AAA_gameMusicModel_BBB.kkk_share_lll.kkk_allDic_lll.setObject(kkk_downDic_lll[AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_typeKey_NNN")] as Any, forKey:kkk_justKey_lll as NSCopying)
                }
                CCC_musicList_DDD(NSArray())
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    
    class func CCC_viewHide_DDD() {
        AAA_musicPlayer_BBB.kkk_share_lll.CCC_setAgoraConfig_DDD()
        for kkk_nums_lll in 0..<AAA_gameMusicModel_BBB.kkk_share_lll.kkk_playList_lll.count {
            let kkk_numbers_lll = AAA_gameMusicModel_BBB.kkk_share_lll.kkk_playList_lll[kkk_nums_lll] as! Int32
            kkk_agora_lll!.stopEffect(kkk_numbers_lll)
        }
        AAA_gameMusicModel_BBB.kkk_share_lll.kkk_playList_lll.removeAllObjects()
    }
    // FUNCMARK
    // FUNCMARK
    
    override init() {
        super.init()
    }
    // FUNCMARK
    // FUNCMARK
    nonisolated(unsafe) static var kkk_share_lll : AAA_gameMusicModel_BBB = AAA_gameMusicModel_BBB()
    // FUNCMARK

}

