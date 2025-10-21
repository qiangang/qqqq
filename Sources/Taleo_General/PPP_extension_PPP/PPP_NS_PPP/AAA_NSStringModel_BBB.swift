//
//  AAA_StringModel_BBB.swift
//  AAA_NSStringModel_BBB.swift
//  Module_General
//
//  Created by Frankie on 19/05/2025.
//

import UIKit

public class AAA_StringModel_BBB: NSObject {

    
    class func CCC_checkStr_DDD(_ key : String) -> String {
        return AAA_StringModel_BBB.kkk_share_lll.CCC_ChenString_DDD(key)
    }
    class func CCC_checkModel_DDD() {
        return AAA_StringModel_BBB.kkk_share_lll.CCC_config_DDD()
    }
    
    
    var kkk_stringDic_lll = NSDictionary()
    
    //初始化
    func CCC_config_DDD() {
        kkk_stringDic_lll = CCC_readStringsFile_DDD()
    }

    func CCC_ChenString_DDD(_ key : String) -> String {
        return kkk_stringDic_lll.CCC_keyStr_DDD(key)
    }
    
    
    func CCC_readStringsFile_DDD() -> NSDictionary {
        var kkk_strDic_lll = NSDictionary()
        let kkk_path_lll = kkk_allImagePath_lll + "AAA_ChenLocalizable_BBB.json"
        let kkk_da_lll = NSData(contentsOfFile: kkk_path_lll)
        if kkk_da_lll == nil {
            return kkk_strDic_lll
        }
        do {
            kkk_strDic_lll = try (JSONSerialization.jsonObject(with: kkk_da_lll! as Data) as? NSDictionary) ?? NSDictionary()
        }catch{
        }
        return kkk_strDic_lll
    }
    
    nonisolated(unsafe) public static let kkk_share_lll : AAA_StringModel_BBB = AAA_StringModel_BBB()
    
}
