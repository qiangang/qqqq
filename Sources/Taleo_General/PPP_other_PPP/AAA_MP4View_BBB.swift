//
//  AAA_MP4View_BBB.swift
//  Wohoo
//
//  Created by Frankie on 24/02/2025.
//

import UIKit
import Package_net
import AVFAudio



/// 播放MP4
public func CCC_showMp4_DDD(_ video : String) {
    CCC_stopMusic_DDD()
    AAA_MP4View_BBB.CCC_showMp4View_DDD(video)
}
// FUNCMARK
// FUNCMARK
/// 停止播放svga
public func CCC_stopSvga_DDD() {
    Task { @MainActor in
        kkk_generalOut_lll.CCC_stopSvga_DDD(kkk_svgaPlayer_lll)
        AAA_MP4View_BBB.CCC_hides_DDD()
    }
}
/// 播放svga
public func CCC_showSvga_DDD(_ svga : String, _ audio : String? = "") {
    CCC_stopMusic_DDD()
    Task { @MainActor in
        if kkk_svgaPlayer_lll == nil {
            kkk_svgaPlayer_lll = UIView()
            kkk_generalOut_lll.CCC_overSvga_DDD { tag in
                if kkk_svgaPlayer_lll?.tag == tag {
                    kkk_generalOut_lll.CCC_destroySvga_DDD(kkk_svgaPlayer_lll)
                    kkk_svgaPlayer_lll?.removeFromSuperview()
                    kkk_svgaPlayer_lll = nil
                }
            }
        }
        kkk_svgaPlayer_lll!.frame = CGRectMake(0, 0, kkk_Window_lll!.width, kkk_Window_lll!.height)
        kkk_Window_lll!.addSubview(kkk_svgaPlayer_lll!)
        kkk_generalOut_lll.CCC_showSvga_DDD(kkk_svgaPlayer_lll, 1, svga)
    }
}


public class AAA_MP4View_BBB: UIView {
    
    let kkk_mp4Player_lll : UIView = {
        let kkk_mp4Player_lll = UIView()
        kkk_mp4Player_lll.isUserInteractionEnabled = false
        return kkk_mp4Player_lll
    }()
    
    
    public class func CCC_showMp4View_DDD(_ url : String) {

        Task { @MainActor in
            AAA_MP4View_BBB.kkk_share_lll.CCC_hides_DDD()
            AAA_MP4View_BBB.kkk_share_lll.CCC_showMp4View_DDD(url)
        }
    }
    public class func CCC_hides_DDD() {
        AAA_MP4View_BBB.kkk_share_lll.CCC_hides_DDD()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = false
        self.frame = CGRectMake(0, 0, kkk_WIDTH_lll, kkk_HEIGHT_lll)
        self.addSubview(kkk_mp4Player_lll)
        
        kkk_generalOut_lll.CCC_overMP4_DDD { [weak self] tag in
            
            if self?.kkk_mp4Player_lll.tag == tag {
                self?.kkk_isRepeatClick_lll = false
                self?.removeFromSuperview()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func CCC_hides_DDD() {
        AAA_musicPlayer_BBB.kkk_share_lll.CCC_stop_DDD()
        removeFromSuperview()
        kkk_generalOut_lll.CCC_destroyMP4_DDD(kkk_mp4Player_lll)
    }
    
    public var kkk_isRepeatClick_lll = false
    public func CCC_showMp4View_DDD(_ url : String) {
        if kkk_isRepeatClick_lll == false && url.count > 0 {
            AAA_MP4View_BBB.kkk_share_lll.CCC_hides_DDD()
            kkk_isRepeatClick_lll = true
//            AAA_GeneralOutModel_BBB.CCC_showWait_DDD()
            AAA_WaitView_BBB.kkk_share_lll.CCC_show_DDD()
            kkk_server_lll.CCC_downloadData_DDD(url) { string in
                if string.count > 0 {
                    DispatchQueue.main.async {[self] in
                        AAA_GeneralOutModel_BBB.CCC_hideWait_DDD()

                        if kkk_isRepeatClick_lll == true {
                            kkk_Window_lll?.addSubview(self)
                            kkk_mp4Player_lll.frame = CGRectMake(0, 0, self.width, self.height)
                            do {
                                try AVAudioSession.sharedInstance().setCategory(.playback)
                                try AVAudioSession.sharedInstance().setActive(true)
                            }catch{}
                            AAA_musicPlayer_BBB.kkk_share_lll.CCC_playAudio_DDD(string) { [weak self] in
                                kkk_generalOut_lll.CCC_showMp4_DDD(self?.kkk_mp4Player_lll, string)
                            } _: { [weak self] in
                                kkk_generalOut_lll.CCC_showMp4_DDD(self?.kkk_mp4Player_lll, string)
                            }
                        }
                    }
                }else {
                    AAA_GeneralOutModel_BBB.CCC_hideWait_DDD()
                    AAA_WaitView_BBB.kkk_share_lll.CCC_hide_DDD()
                }
            }
        }
    }
    
    public override func removeFromSuperview() {
        super.removeFromSuperview()
        kkk_isRepeatClick_lll = false
    }
    
    
    
    public static let kkk_share_lll: AAA_MP4View_BBB = AAA_MP4View_BBB()

}
