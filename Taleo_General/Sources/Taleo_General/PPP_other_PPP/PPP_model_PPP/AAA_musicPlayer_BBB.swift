//
//  AAA_musicPlayer_BBB.swift
//  Viddi
//
//  Created by Frankie on 23/04/2024.
//

import UIKit
import AVFAudio
import Package_net
import AgoraRtcKit




class AAA_musicPlayer_BBB: NSObject,AVAudioPlayerDelegate {
    
    
    // FUNCMARK
    
    var kkk_musicHandler_lll: (()->Void)?
    // FUNCMARK
    // FUNCMARK
    func CCC_playAudio_DDD(_ url : String,_ handler: @escaping ()->Void) {
        CCC_playAudio_DDD(url) {
            handler()
        } _: {
            handler()
        }
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_playAudio_DDD(_ url : String,_ handler: @escaping ()->Void,_ fail: @escaping ()->Void) {
        CCC_stopMusic_DDD()
        Task { @MainActor in
            CCC_play_DDD(url) {
                handler()
            }
        }
    }
    
    
    // FUNCMARK
    // FUNCMARK
    
    func CCC_setAgoraConfig_DDD() {
        let kkk_str_lll = kkk_Defaults_lll.object(forKey: "MMM_mylogininfosaveStr_NNN")
        if kkk_str_lll != nil && kkk_agora_lll == nil {
            let kkk_strs_lll : String = kkk_str_lll as! String
            let kkk_dic_lll = kkk_strs_lll.CCC_toDic_DDD() as NSDictionary
            let kkk_agoraID_lll = kkk_dic_lll.CCC_keyStr_DDD(kkk_agora_app_idStr_lll)
            kkk_agora_lll = AgoraRtcEngineKit.sharedEngine(withAppId: kkk_agoraID_lll, delegate: nil)
        }
    }
        
    
    func CCC_play_DDD(_ url : String,_ handler: @escaping ()->Void) {
        kkk_server_lll.CCC_downloadData_DDD(url) { [weak self] string in
            if string.count != 0 {
                self?.CCC_setAgoraConfig_DDD()
                //获取语聊房声音大小
                let kkk_effect_lll = UserDefaults.standard.object(forKey: "MMM_localVoiceVolumNum_NNN") ?? 80
                kkk_agora_lll!.playEffect(103, filePath: string, loopCount: 0, pitch: 1, pan: 1, gain: kkk_effect_lll as! Int, publish: false, startPos: 0)
            }
            handler()
        }
    }
    
    
    func CCC_stop_DDD() {
        CCC_setAgoraConfig_DDD()
        kkk_agora_lll?.stopEffect(103)
    }
    // FUNCMARK
    // FUNCMARK
    class var kkk_share_lll: AAA_musicPlayer_BBB{
        struct Static {
            nonisolated(unsafe) static let kkk_PlayMusicModels_lll : AAA_musicPlayer_BBB = AAA_musicPlayer_BBB()
        }
        return Static.kkk_PlayMusicModels_lll
    }
    // FUNCMARK
    
    
}
func CCC_stopMusic_DDD() {
    AAA_musicPlayer_BBB.kkk_share_lll.CCC_stop_DDD()
}
