//
//  AAA_NSObjectExtension_BBB.swift
//  Module_General
//
//  Created by Frankie on 19/05/2025.
//

import Foundation
import AVFAudio
import AVFoundation
import UIKit




let kkk_leveIconArray_lll = ["MMM_levelImageZero_NNN","MMM_levelImageOne_NNN","MMM_levelImageTwo_NNN","MMM_levelImageThree_NNN","MMM_levelImageFour_NNN","MMM_levelImageFive_NNN","MMM_levelImageSix_NNN","MMM_levelImageSeven_NNN","MMM_levelImageEight_NNN","MMM_levelImageNine_NNN","MMM_levelImageTen_NNN"]




public extension NSObject{
    
    // FUNCMARK
    func CCC_codableToJsonString_DDD() -> String {
 
        let kkk_encoder_lll = JSONEncoder()
        kkk_encoder_lll.outputFormatting = .prettyPrinted
        if let kkk_codeSelf_lll = self as? Codable {
            let kkk_data_lll = try? kkk_encoder_lll.encode(kkk_codeSelf_lll)
            return String(data: kkk_data_lll ?? Data(), encoding: .utf8) ?? ""
        } else {
            return ""
        }
    }
    func CCC_toJSONString_DDD() -> String {
        if JSONSerialization.isValidJSONObject(self) {
            do {
                let kkk_jsonData_lll: Data
                kkk_jsonData_lll = try JSONSerialization.data(withJSONObject: self, options: [])
                return String(data: kkk_jsonData_lll, encoding: .utf8) ?? ""
            } catch {
            }
        }
        return ""
    }
    
    func CCC_addNoty_DDD(_ sel : Selector, _ name : String) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: name), object: nil)
        NotificationCenter.default.addObserver(self, selector: sel, name: NSNotification.Name(rawValue: name), object: nil)
    }
    func CCC_postNoty_DDD(_ name : String, _ object : Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: name), object: object)
    }
    class func CCC_postNoty_DDD(_ name : String, _ object : Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: name), object: object)
    }
    func CCC_addSysNoty_DDD(_ sel : Selector, _ name : NSNotification.Name?) {
        NotificationCenter.default.removeObserver(self, name: name, object: nil)
        NotificationCenter.default.addObserver(self, selector: sel, name: name, object: nil)
    }
    func CCC_removeNoty_DDD() {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    
    // FUNCMARK
    @MainActor func CCC_isMicrophone_DDD(suc:@escaping @MainActor ()->Void, fail:@escaping @MainActor ()->Void){
        let kkk_mainSuc_lll = { DispatchQueue.main.async { suc() } }
        let kkk_mainFail_lll = {
            DispatchQueue.main.async { [weak self] in
                fail()
                self?.CCC_settings_DDD(1)
            }
        }
        AVAudioSession.sharedInstance().requestRecordPermission { Bool in
            if (Bool){
                kkk_mainSuc_lll()
            }else{
                kkk_mainFail_lll()
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    @MainActor func CCC_isCamera_DDD(suc:@escaping ()->Void, fail:@escaping ()->Void){
        let kkk_mainSuc_lll = { DispatchQueue.main.async { suc() } }
        let kkk_mainFail_lll = {
            DispatchQueue.main.async { [weak self] in
                fail()
                self?.CCC_settings_DDD(2)
            }
        }
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { s in
            if s {
                kkk_mainSuc_lll()
            }else{
                kkk_mainFail_lll()
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    @MainActor func CCC_isMicrophone_DDD(suc:@escaping ()->Void){
        CCC_isMicrophone_DDD {
            suc()
        } fail: {
            
        }
    }
    // FUNCMARK
    // FUNCMARK
    @MainActor func CCC_isCamera_DDD(suc:@escaping ()->Void){
        CCC_isCamera_DDD {
            suc()
        } fail: {
            
        }
    }
    // FUNCMARK
    // FUNCMARK
    @MainActor func CCC_isCanCall_DDD(suc:@escaping (_ call : Int)->Void){
        CCC_isCamera_DDD { [weak self] in
            self?.CCC_isMicrophone_DDD {
                suc(0)
            }fail: {
                
            }
        }fail: {
            
        }
    }
    // FUNCMARK
    // FUNCMARK
    @MainActor func CCC_call_DDD(suc:@escaping ()->Void, fail:@escaping ()->Void){
        CCC_isCamera_DDD { [weak self] in
            self?.CCC_isMicrophone_DDD {
                suc()
            }fail: {
                
                DispatchQueue.main.async {
                    AAA_normals_BBB.kkk_share_lll.kkk_tipView_lll.CCC_hide_DDD()
                    AAA_WaitView_BBB.kkk_share_lll.CCC_hide_DDD()
                }
                fail()
            }
        }fail: {
            DispatchQueue.main.async {
                AAA_WaitView_BBB.kkk_share_lll.CCC_hide_DDD()
            }
            fail()
        }
    }
    // FUNCMARK
    // FUNCMARK
    @MainActor func CCC_settings_DDD(_ t : Int) {
        if t == 1 {
            CCC_showConfirmTips_DDD(AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_matchMicroNoOpen_NNN")) { [weak self] in
                self?.CCC_openSettingAuthorized_DDD()
            }
        }else{
            CCC_showConfirmTips_DDD(AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_matchCameraNoOpen_NNN")) { [weak self] in
                self?.CCC_openSettingAuthorized_DDD()
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    @MainActor func CCC_openSettingAuthorized_DDD() {
        let kkk_appSettings_lll = URL(string: UIApplication.openSettingsURLString)
        UIApplication.shared.open(kkk_appSettings_lll!, options: [:]) { (success) in}
    }
    // FUNCMARK
    // FUNCMARK
    @MainActor class func CCC_showTips_DDD(_ title : String, suc:@escaping ()->Void){
        let kkk_alert_lll = UIAlertController(title: "", message: title, preferredStyle: .alert)
        let kkk_action_lll = UIAlertAction(title: AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_cancel_NNN"), style: .cancel) { UIAlertAction in
            suc()
        }
        kkk_alert_lll.addAction(kkk_action_lll)
        kkk_Window_lll!.rootViewController?.present(kkk_alert_lll, animated: true)
    }
    // FUNCMARK
    // FUNCMARK
    @MainActor func CCC_showConfirmTips_DDD(_ title : String, suc:@escaping ()->Void){
        let kkk_alert_lll = UIAlertController(title: "", message: title, preferredStyle: .alert)
        let kkk_action_lll = UIAlertAction(title: AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_cancel_NNN"), style: .cancel)
        let kkk_confirm_lll = UIAlertAction(title: AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_confirmTxt_NNN"), style: .default) { UIAlertAction in
            suc()
        }
        kkk_alert_lll.addAction(kkk_action_lll)
        kkk_alert_lll.addAction(kkk_confirm_lll)
        kkk_Window_lll!.rootViewController?.present(kkk_alert_lll, animated: true)
    }
}
