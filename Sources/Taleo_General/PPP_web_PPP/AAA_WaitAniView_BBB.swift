

import UIKit


class AAA_WaitAniView_BBB: UIView {
    
    
    // FUNCMARK
    var kkk_willShow_lll = false
    // FUNCMARK
    // FUNCMARK
    var kkk_isAni_lll = false
    // FUNCMARK
    // FUNCMARK
    
    deinit {
        CCC_removeNoty_DDD()
        kkk_generalOut_lll.CCC_destroySvga_DDD(self)
    }
    // FUNCMARK
    // FUNCMARK
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRectMake(UIScreen.main.bounds.width/2 - 22, UIScreen.main.bounds.height/2 - 22, 44, 44)
        kkk_generalOut_lll.CCC_loadSvga_DDD(self, 0, "MMM_LoadingTheVideoSvga_NNN")
    }
    // FUNCMARK
    // FUNCMARK
    required init?(coder: NSCoder) {
        fatalError("")
    }
    // FUNCMARK
    // FUNCMARK
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        kkk_isAni_lll = false
    }
    // FUNCMARK
    // FUNCMARK
    @objc func CCC_hide_DDD() {
        kkk_isAni_lll = false
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.alpha = 0
            }completion: { [weak self] Bool in
                self?.removeFromSuperview()
            }
        }
    }
    // FUNCMARK
    

}
