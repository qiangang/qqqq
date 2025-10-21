//
//  AAA_NSArrayExtension_BBB.swift
//  Module_General
//
//  Created by Frankie on 20/05/2025.
//

import UIKit

public extension Array {

    
    func CCC_toJson_DDD() -> String {
        do {
            let kkk_data_lll = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: kkk_data_lll, encoding: .utf8) ?? ""
        }catch {}
        return ""
    }
    
    func CCC_toModelJson_DDD<T: NSObject>(_ type:T.Type) -> String {
        var kkk_arr_lll = [[String: Any]]()
        for kkk_model_lll in self {
            let kkk_dic_lll = (kkk_model_lll as! T).CCC_codableToJsonString_DDD().CCC_toDic_DDD()
            kkk_arr_lll.append(kkk_dic_lll)
        }
        
        return kkk_arr_lll.CCC_toJson_DDD()
        
    }
    
    func CCC_toModelArray_DDD<T: NSObject>(_ type:T.Type) ->[T] {
            
        var kkk_modelArray_lll = [T]()
        for kkk_people_lll in self {
            if let kkk_dic_lll = kkk_people_lll as? [String : Any] {
                kkk_modelArray_lll.append(kkk_dic_lll.CCC_toModel_DDD(type))
            }
        }
        return kkk_modelArray_lll

    }
    
}
