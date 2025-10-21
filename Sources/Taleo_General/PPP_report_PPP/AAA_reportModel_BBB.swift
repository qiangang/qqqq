//
//  AAA_reportModel_BBB.swift
//  Module_General
//
//  Created by Frankie on 19/05/2025.
//

import UIKit

class AAA_reportModel_BBB: NSObject {

    
    
    
    // FUNCMARK
    var kkk_id_lll: Int!
    // FUNCMARK
    // FUNCMARK
    var kkk_name_lll: String!
    // FUNCMARK
    // FUNCMARK
    
    
    init(_ dic : NSDictionary) {
        super.init()
        
        kkk_id_lll = dic.CCC_keyInt_DDD(kkk_idStr_lll)
        kkk_name_lll = dic.CCC_keyStr_DDD(kkk_nameStr_lll)
    }
    // FUNCMARK
    // FUNCMARK
    
    class func CCC_array_DDD(_ array : NSArray) -> NSArray {
        let kkk_list_lll = NSMutableArray()
        for kkk_num_lll in 0..<array.count {
            let kkk_dic_lll = array[kkk_num_lll] as? NSDictionary
            if kkk_dic_lll != nil {
                let kkk_model_lll = AAA_reportModel_BBB(kkk_dic_lll!)
                kkk_list_lll.add(kkk_model_lll)
            }
        }
        return kkk_list_lll
    }
    // FUNCMARK
    
}

