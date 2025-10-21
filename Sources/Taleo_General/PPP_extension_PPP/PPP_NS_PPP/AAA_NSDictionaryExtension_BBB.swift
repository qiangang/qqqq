//
//  AAA_NSDictionaryExtension_BBB.swift
//  Module_General
//
//  Created by Frankie on 19/05/2025.
//

import UIKit


public extension NSDictionary {
    
    
    
    // FUNCMARK
    func CCC_keyImage_DDD(_ key : String) -> UIImage {
        let kkk_array_lll = self.allKeys as NSArray
        if kkk_array_lll.contains(key) == true {
            let kkk_values_lll = self.object(forKey: key) as? UIImage
            if kkk_values_lll != nil {
                return kkk_values_lll!
            }
        }
        return UIImage()
    }
    // FUNCMARK
    // FUNCMARK
    
    func CCC_keyStr_DDD(_ key : String) -> String {
        let kkk_array_lll = self.allKeys as NSArray
        if kkk_array_lll.contains(key) == true {
            let kkk_values_lll = String(format: "%@", (self.object(forKey: key) ?? "") as! CVarArg)
            return kkk_values_lll
        }
        return ""
    }
    // FUNCMARK
    // FUNCMARK
    
    func CCC_keyInt_DDD(_ key : String) -> Int {
        let kkk_array_lll = self.allKeys as NSArray
        if kkk_array_lll.contains(key) == true {
            let kkk_value_lll = String(format: "%@", (self.object(forKey: key) ?? "0") as! CVarArg)
            if kkk_value_lll.count == 0 {
                return 0
            }
            var kkk_values_lll = Int(kkk_value_lll)
            if kkk_values_lll == nil {
                let kkk_doubles_lll = Double(kkk_value_lll)
                if kkk_values_lll != nil {
                    kkk_values_lll = Int(String(format: "%.0f", kkk_doubles_lll!))
                }else {
                    kkk_values_lll = 0
                }
            }
            return kkk_values_lll!
        }
        return 0
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_keyOneInt_DDD(_ key : String) -> Int {
        let kkk_array_lll = self.allKeys as NSArray
        if kkk_array_lll.contains(key) == true {
            let kkk_value_lll = String(format: "%@", (self.object(forKey: key) ?? "0") as! CVarArg)
            if kkk_value_lll.count == 0 {
                return 1
            }
            let kkk_values_lll = Int(kkk_value_lll)
            return kkk_values_lll!
        }
        return 1
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_keyThreeInt_DDD(_ key : String) -> Int {
        let kkk_array_lll = self.allKeys as NSArray
        if kkk_array_lll.contains(key) == true {
            let kkk_value_lll = String(format: "%@", (self.object(forKey: key) ?? "0") as! CVarArg)
            if kkk_value_lll.count == 0 {
                return 3
            }
            let kkk_values_lll = Int(kkk_value_lll)
            return kkk_values_lll!
        }
        return 3
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_keyEightInt_DDD(_ key : String) -> Int {
        let kkk_array_lll = self.allKeys as NSArray
        if kkk_array_lll.contains(key) == true {
            let kkk_value_lll = String(format: "%@", (self.object(forKey: key) ?? "0") as! CVarArg)
            if kkk_value_lll.count == 0 {
                return 8
            }
            let kkk_values_lll = Int(kkk_value_lll)
            return kkk_values_lll!
        }
        return 8
    }
    // FUNCMARK
    // FUNCMARK
    
    func CCC_keyFloat_DDD(_ key : String) -> Float {
        let kkk_array_lll = self.allKeys as NSArray
        if kkk_array_lll.contains(key) == true {
            let kkk_value_lll = String(format: "%@", (self.object(forKey: key) ?? "0.0") as! CVarArg)
            if kkk_value_lll.count == 0 {
                return 0.0
            }
            let kkk_values_lll = Float(kkk_value_lll)
            return kkk_values_lll!
        }
        return 0.0
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_keyDouble_DDD(_ key : String) -> Double {
        let kkk_array_lll = self.allKeys as NSArray
        if kkk_array_lll.contains(key) == true {
            let kkk_value_lll = String(format: "%@", (self.object(forKey: key) ?? "0.0") as! CVarArg)
            if kkk_value_lll.count == 0 {
                return 0.0
            }
            let kkk_values_lll = Double(kkk_value_lll)
            return kkk_values_lll!
        }
        return 0.0
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_keyOneFloat_DDD(_ key : String) -> Float {
        let kkk_array_lll = self.allKeys as NSArray
        if kkk_array_lll.contains(key) == true {
            let kkk_value_lll = String(format: "%@", (self.object(forKey: key) ?? "0.0") as! CVarArg)
            if kkk_value_lll.count == 0 {
                return 1.0
            }
            let kkk_values_lll = Float(kkk_value_lll)
            return kkk_values_lll!
        }
        return 1.0
    }
    // FUNCMARK
    // FUNCMARK
    
    func CCC_keyBool_DDD(_ key : String) -> Bool {
        let kkk_array_lll = self.allKeys as NSArray
        if kkk_array_lll.contains(key) == true {
            let kkk_values_lll = self.object(forKey: key) as? Bool
            if kkk_values_lll != nil {
                return kkk_values_lll!
            }
        }
        return false
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_keyArray_DDD(_ key : String) -> NSArray {
        let kkk_array_lll = self.allKeys as NSArray
        if kkk_array_lll.contains(key) == true {
            let kkk_values_lll = self.object(forKey: key) as? NSArray
            if kkk_values_lll != nil {
                return kkk_values_lll!
            }
        }
        return []
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_keyArr_DDD(_ key : String) -> [Any] {
        let kkk_array_lll = self.allKeys as NSArray
        if kkk_array_lll.contains(key) == true {
            let kkk_values_lll = self.object(forKey: key) as? NSArray
            if kkk_values_lll != nil {
                return kkk_values_lll! as! [Any]
            }
        }
        return []
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_keyStrNum_DDD(_ key : String) -> String {
        let kkk_array_lll = self.allKeys as NSArray
        if kkk_array_lll.contains(key) == true {
            let kkk_value_lll = String(format: "%@", (self.object(forKey: key) ?? "") as! CVarArg)
            if kkk_value_lll.count == 0 {
                return "0"
            }
            return kkk_value_lll
        }
        return "0"
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_keyDic_DDD(_ key : String) -> NSDictionary {
        let kkk_array_lll = self.allKeys as NSArray
        if kkk_array_lll.contains(key) == true {
            let kkk_values_lll = self.object(forKey: key) as? NSDictionary
            if kkk_values_lll != nil {
                return kkk_values_lll!
            }
        }
        return NSDictionary()
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_toModel_DDD<T: NSObject>(_ modelType:T.Type) -> T {
        let kkk_selfDic_lll = self as! [String : Any]
        let kkk_obj_lll = T()
        let kkk_objDic_lll = kkk_obj_lll.CCC_codableToJsonString_DDD().CCC_toDic_DDD()
        let kkk_newDic_lll = NSDictionary.CCC_handleObjDic_DDD(objDic: kkk_objDic_lll, fromJsonDic: kkk_selfDic_lll)
        
        let kkk_codeObj_lll : Codable = kkk_obj_lll as! Codable
        let kkk_objectType_lll = type(of: kkk_codeObj_lll)
        let kkk_jsondata_lll = kkk_newDic_lll.CCC_toJsonStr_DDD().data(using: .utf8)
        let kkk_model_lll = try? JSONDecoder().decode(kkk_objectType_lll,from: kkk_jsondata_lll!)
        return kkk_model_lll as? T ?? kkk_obj_lll
    }
    // FUNCMARK
    // FUNCMARK
    static func CCC_handleObjDic_DDD(objDic: [String : Any],fromJsonDic:[String : Any]) -> [String : Any] {
        var kkk_newDic_lll = objDic
        for (kkk_objKey_lll,kkk_objValue_lll) in objDic {
            for (kkk_akey_lll,kkk_value_lll) in fromJsonDic {
                if kkk_objKey_lll == kkk_akey_lll && !(kkk_value_lll is NSNull) {
                    if kkk_value_lll is [String : Any] {
                        let kkk_result_lll = NSDictionary.CCC_handleObjDic_DDD(objDic: kkk_objValue_lll as! [String : Any], fromJsonDic: kkk_value_lll as! [String : Any])
                        kkk_newDic_lll.updateValue(kkk_result_lll, forKey: kkk_objKey_lll)
                    } else if kkk_value_lll is [Any] {
                        kkk_newDic_lll.updateValue(kkk_value_lll, forKey: kkk_objKey_lll)
                        
                    } else {
                        kkk_newDic_lll.updateValue(kkk_value_lll, forKey: kkk_objKey_lll)
                    }
                }
            }
        }
        return kkk_newDic_lll
    }
    // FUNCMARK
    
    
}

public extension Dictionary {
    
    
    func CCC_toJsonStr_DDD() -> String {
        
        do {
            let kkk_data_lll = try JSONSerialization.data(withJSONObject: self,options: [])
            return String(data: kkk_data_lll, encoding: .utf8) ?? ""
        }catch {}
        return ""
        
    }
    
    func CCC_toModel_DDD<T: NSObject>(_ modelType:T.Type) -> T {
        let kkk_selfDic_lll = self as! [String : Any]
        let kkk_obj_lll = T()
        let kkk_objDic_lll = kkk_obj_lll.CCC_codableToJsonString_DDD().CCC_toDic_DDD()
        let kkk_newDic_lll = Dictionary.CCC_handleObjDic_DDD(objDic: kkk_objDic_lll, fromJsonDic: kkk_selfDic_lll)
        
        let kkk_codeObj_lll : Codable = kkk_obj_lll as! Codable
        let kkk_objectType_lll = type(of: kkk_codeObj_lll)
        let kkk_jsondata_lll = kkk_newDic_lll.CCC_toJsonStr_DDD().data(using: .utf8)
        let kkk_model_lll = try? JSONDecoder().decode(kkk_objectType_lll,from: kkk_jsondata_lll!)
        return kkk_model_lll as? T ?? kkk_obj_lll
    }
    
    static func CCC_handleObjDic_DDD(objDic: [String : Any],fromJsonDic:[String : Any]) -> [String : Any] {
        var kkk_newDic_lll = objDic
        for (kkk_objKey_lll,kkk_objValue_lll) in objDic {
            for (kkk_akey_lll,kkk_value_lll) in fromJsonDic {
                if kkk_objKey_lll == kkk_akey_lll && !(kkk_value_lll is NSNull) {
                    if kkk_value_lll is [String : Any] {
                        let kkk_result_lll = Dictionary.CCC_handleObjDic_DDD(objDic: kkk_objValue_lll as! [String : Any], fromJsonDic: kkk_value_lll as! [String : Any])
                        kkk_newDic_lll.updateValue(kkk_result_lll, forKey: kkk_objKey_lll)
                    } else if kkk_value_lll is [Any] {
                        kkk_newDic_lll.updateValue(kkk_value_lll, forKey: kkk_objKey_lll)
                        
                    } else {
                        kkk_newDic_lll.updateValue(kkk_value_lll, forKey: kkk_objKey_lll)
                    }
                }
            }
        }
        return kkk_newDic_lll
    }
}
