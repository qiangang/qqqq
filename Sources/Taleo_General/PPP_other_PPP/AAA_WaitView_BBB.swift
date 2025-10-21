

import UIKit


@MainActor
class AAA_WaitView_BBB: UIView {
    
    // FUNCMARK
    let kkk_label_lll = UILabel()
    // FUNCMARK
    // FUNCMARK
    
    var kkk_willShow_lll = false
    // FUNCMARK
    // FUNCMARK
    var kkk_isShow_lll = false
    // FUNCMARK
    // FUNCMARK
    var kkk_isShowText_lll = false
    // FUNCMARK
    // FUNCMARK
    
    let kkk_aniView_lll = UIView()
    let kkk_anisView_lll = UIView()
    // FUNCMARK
    // FUNCMARK
    var kkk_time_lll = 10
    // FUNCMARK
    var kkk_timer_lll : Timer!
    
    
    // FUNCMARK
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRectMake(0, 0, UIScreen.main.bounds.width, 0)
        
        kkk_label_lll.frame = CGRectMake(0, 0, 20, 20)
        kkk_label_lll.CCC_RMdets_DDD("", 14, .white)
        kkk_label_lll.CCC_round_DDD(8)
        kkk_label_lll.textAlignment = .center
        kkk_label_lll.numberOfLines = 0
        kkk_label_lll.isHidden = true
        self.kkk_label_lll.backgroundColor = CCC_colors_DDD("F7BF49")//AAA_GeneralOutModel_BBB.CCC_color_DDD("color_000000_color", 0.7)
        self.addSubview(kkk_label_lll)
        
        kkk_aniView_lll.frame = CGRectMake(UIScreen.main.bounds.width/2 - 26, UIScreen.main.bounds.height/2 - 26, 52, 52)
        kkk_aniView_lll.CCC_round_DDD(11)
        kkk_aniView_lll.backgroundColor = CCC_colors_DDD("F7BF49")
        kkk_aniView_lll.layer.borderWidth = 2
        kkk_aniView_lll.layer.borderColor = CCC_colors_DDD("ED9D5C").cgColor
        kkk_aniView_lll.isHidden = true
        self.addSubview(kkk_aniView_lll)
        
        
        kkk_aniView_lll.addSubview(kkk_anisView_lll)
        kkk_anisView_lll.frame = .init(x: 10, y: 10, width: 32, height: 32)
        kkk_generalOut_lll.CCC_loadSvga_DDD(kkk_anisView_lll, 0, "MMM_LoadingTheVideoSvga_NNN")
    }
    // FUNCMARK
    // FUNCMARK
    
    @objc func CCC_timeChange_DDD() {
        kkk_time_lll -= 1
        if kkk_time_lll == 0 && kkk_isShow_lll == true {
            CCC_hide_DDD()
        }
    }
    // FUNCMARK
    // FUNCMARK
    required init?(coder: NSCoder) {
        fatalError("")
    }
    // FUNCMARK
    // FUNCMARK
    @objc func CCC_show_DDD(maxTime:Int = 10,_ addsView:UIView? = kkk_Window_lll,_ type:Int = 0) {
        kkk_time_lll = maxTime
        kkk_isShow_lll = true
        kkk_generalOut_lll.CCC_connSvga_DDD(kkk_aniView_lll)
        kkk_generalOut_lll.CCC_connSvga_DDD(kkk_anisView_lll)
        if kkk_timer_lll == nil {
            kkk_timer_lll = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CCC_timeChange_DDD), userInfo: nil, repeats: true)
        }
        DispatchQueue.main.async {
            self.frame = CGRectMake(0, 0, UIScreen.main.bounds.width, 0)
            self.kkk_aniView_lll.isHidden = false
            self.kkk_anisView_lll.isHidden = false
            self.kkk_label_lll.isHidden = true
            self.kkk_willShow_lll = true
            self.alpha = 0
            UIView.animate(withDuration: 0.2) {
                self.alpha = 1
            }
            addsView?.addSubview(self)
            if type == 1 {
                self.kkk_aniView_lll.top = 250 / 2
            }else{
                self.kkk_aniView_lll.top = UIScreen.main.bounds.height/2 - 26
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    @objc func CCC_show_DDD(_ str : String) {
        kkk_isShow_lll = false
        kkk_generalOut_lll.CCC_connSvga_DDD(kkk_aniView_lll)
        kkk_generalOut_lll.CCC_connSvga_DDD(kkk_anisView_lll)
        if kkk_timer_lll == nil {
            kkk_timer_lll = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CCC_timeChange_DDD), userInfo: nil, repeats: true)
        }
        DispatchQueue.main.async {
            if str.count == 0 {
                self.CCC_hide_DDD()
                return
            }
            self.kkk_aniView_lll.isHidden = true
            self.kkk_anisView_lll.isHidden = true
            self.kkk_label_lll.text = str
            self.kkk_label_lll.isHidden = false
            self.kkk_label_lll.frame = CGRectMake(0, 0, UIScreen.main.bounds.width - 60, 1000)
            self.kkk_label_lll.textColor = .white
            self.kkk_label_lll.sizeToFit()
            self.kkk_label_lll.frame = CGRectMake(0, 0, self.kkk_label_lll.width + 20, self.kkk_label_lll.height + 20)
            self.frame = CGRectMake(UIScreen.main.bounds.width/2 - self.kkk_label_lll.width/2, UIScreen.main.bounds.height/2 - self.kkk_label_lll.height/2, self.kkk_label_lll.width, self.kkk_label_lll.height)
            self.alpha = 0
            UIView.animate(withDuration: 0.2) {
                self.alpha = 1
            }
            kkk_Window_lll?.addSubview(self)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.CCC_hide_DDD()
            }
        }
    }
    // FUNCMARK
    // FUNCMARK
    @objc func CCC_hide_DDD() {
        kkk_isShow_lll = false
        kkk_generalOut_lll.CCC_stopSvga_DDD(kkk_aniView_lll)
        kkk_generalOut_lll.CCC_stopSvga_DDD(kkk_anisView_lll)
        kkk_timer_lll?.invalidate()
        kkk_timer_lll = nil
        self.alpha = 0
        self.removeFromSuperview()
    }
    // FUNCMARK
    // FUNCMARK
    static let kkk_share_lll: AAA_WaitView_BBB = AAA_WaitView_BBB()
    // FUNCMARK
    

}
