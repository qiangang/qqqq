//
//  AAA_generalOutModel_BBB.swift
//  Module_general
//AAA_generalProtocol_BBB
//  Created by Frankie on 27/05/2025.
//

import UIKit



public protocol AAA_generalOutProtocol_BBB {
    //MARK: MP4相关
    ///展示MP4并播放，外部调用，仅播放一次
    func CCC_showMp4_DDD(_ completion : @escaping (_ view : UIView, _ path : String) -> Void)
    
    ///暂停播放，播放完成后自动销毁，外部调用
    func CCC_destroyMP4_DDD(_ completion : @escaping (_ view : UIView) -> Void)
        
    ///MP4播放完成回调，spm或者需要播放svga完成回调的地方调用，主要是spm内部调用
    func CCC_overMP4_DDD(_ completion : @escaping (_ tag : Int) -> Void)
    
    
    
    ///展示MP4并播放，主要是spm内部调用
    ///path 为下载资源后的本地地址
    func CCC_showMp4_DDD(_ view: UIView?, _ path: String)
    
    ///销毁svga，主要是spm内部调用
    func CCC_destroyMP4_DDD(_ view : UIView?)
    
    ///播放完成，由外部调用，spm内部不调用，在MP4播放完成的代理、播放失败的代理里面调用
    func CCC_overMP4_DDD(_ tag : Int)
    
    
    
    //MARK: SVGA 相关
    ///展示svga并播放，外部调用
    func CCC_showSvga_DDD(_ completion : @escaping (_ view : UIView, _ loops : Int, _ path : String) -> Void)
    
    ///暂停播放，外部调用
    func CCC_stopSvga_DDD(_ completion : @escaping (_ view : UIView) -> Void)
    
    ///继续播放，外部调用
    func CCC_connSvga_DDD(_ completion : @escaping (_ view : UIView) -> Void)
    
    ///销毁svga，外部调用
    func CCC_destroySvga_DDD(_ completion : @escaping (_ view : UIView) -> Void)
    
    ///加载svga，不播放，等待后续需要时播放，外部调用
    func CCC_loadSvga_DDD(_ completion : @escaping (_ view : UIView, _ loops: Int, _ path: String) -> Void)
    
    ///svga播放完成回调，spm或者需要播放svga完成回调的地方调用，主要是spm内部调用
    func CCC_overSvga_DDD(_ completion : @escaping (_ tag : Int) -> Void)
    
    
    
    ///展示svga并播放，主要是spm内部调用
    ///如果是下载的zip包解压出来的svga，传入svga名字即可
    ///如果是头像框座驾等网络资源，需下载后传入带本地文件夹路径的名字
    ///也可以直接是url
    func CCC_showSvga_DDD(_ view: UIView?, _ loops: Int, _ path: String)
    
    ///暂停播放svga，主要是spm内部调用
    func CCC_stopSvga_DDD(_ view : UIView?)
    
    ///继续播放svga，主要是spm内部调用
    func CCC_connSvga_DDD(_ view : UIView?)
    
    ///销毁svga，主要是spm内部调用
    func CCC_destroySvga_DDD(_ view : UIView?)
    
    ///加载svga，不播放，等待后续需要时播放，比如语聊房声浪声浪，主要是spm内部调用
    func CCC_loadSvga_DDD(_ view: UIView?, _ loops: Int, _ path: String)
    
    ///播放完成，由外部调用，spm内部不调用，在svga的代理，播放完成的代理里面调用
    func CCC_overSvga_DDD(_ tag : Int)
    
    
    
    func CCC_popView_DDD() -> AAA_FunctionalConflictView_BBB
}




class AAA_generalOutModels_BBB: AAA_generalOutProtocol_BBB {
    
    func CCC_popView_DDD() -> AAA_FunctionalConflictView_BBB {
        return AAA_FunctionalConflictView_BBB.CCC_loadViews_DDD()
    }
    
    //播放MP4 block
    var kkk_MP4completion_lll: ((_ view : UIView, _ path : String)->Void)?
    var kkk_destroyMP4_lll: ((_ view : UIView)->Void)?
    var kkk_MP4Over_lll: ((_ tag : Int)->Void)?
    
    //MARK: MP4相关
    func CCC_showMp4_DDD(_ completion : @escaping (_ view : UIView, _ path : String) -> Void) {
        kkk_MP4completion_lll = completion
    }
    
    func CCC_destroyMP4_DDD(_ completion : @escaping (_ view : UIView) -> Void) {
        kkk_destroyMP4_lll = completion
    }
        
    func CCC_overMP4_DDD(_ completion : @escaping (_ tag : Int) -> Void) {
        kkk_MP4Over_lll = completion
    }
    
    
    
    func CCC_showMp4_DDD(_ view: UIView?, _ path: String) {
        if view == nil { return }
        kkk_MP4completion_lll!(view!, path)
    }
    
    func CCC_destroyMP4_DDD(_ view : UIView?) {
        if view == nil { return }
        kkk_destroyMP4_lll!(view!)
    }
    
    func CCC_overMP4_DDD(_ tag : Int) {
        kkk_MP4Over_lll?(tag)
    }
    
    
    //播放svga block
    var kkk_completion_lll: ((_ view : UIView, _ loops : Int, _ path : String)->Void)?
    var kkk_stop_lll: ((_ view : UIView)->Void)?
    var kkk_conn_lll: ((_ view : UIView)->Void)?
    var kkk_destroy_lll: ((_ view : UIView)->Void)?
    var kkk_load_lll: ((_ view : UIView, _ loops: Int, _ path: String)->Void)?
    var kkk_svgaOver_lll: ((_ tag : Int)->Void)?
    
    
    
    //播放svga
    func CCC_showSvga_DDD(_ completion : @escaping (_ view : UIView, _ loops : Int, _ path : String) -> Void) {
        kkk_completion_lll = completion
    }
    func CCC_stopSvga_DDD(_ completion : @escaping (_ view : UIView) -> Void) {
        kkk_stop_lll = completion
    }
    func CCC_connSvga_DDD(_ completion : @escaping (_ view : UIView) -> Void) {
        kkk_conn_lll = completion
    }
    func CCC_destroySvga_DDD(_ completion : @escaping (_ view : UIView) -> Void) {
        kkk_destroy_lll = completion
    }
    func CCC_loadSvga_DDD(_ completion : @escaping (_ view : UIView, _ loops: Int, _ path: String) -> Void) {
        kkk_load_lll = completion
    }
    func CCC_overSvga_DDD(_ completion : @escaping (_ tag : Int) -> Void) {
        kkk_svgaOver_lll = completion
    }
    
    
    
    
    
    func CCC_stopSvga_DDD(_ view : UIView?) {
        if view == nil { return }
        kkk_stop_lll!(view!)
    }
    func CCC_connSvga_DDD(_ view : UIView?) {
        if view == nil { return }
        kkk_conn_lll!(view!)
    }
    func CCC_showSvga_DDD(_ view: UIView?, _ loops: Int, _ path: String) {
        if view == nil { return }
        kkk_completion_lll!(view!, loops, path)
    }
    func CCC_destroySvga_DDD(_ view: UIView?) {
        if view == nil { return }
        kkk_destroy_lll!(view!)
    }
    func CCC_loadSvga_DDD(_ view: UIView?, _ loops: Int, _ path: String) {
        if view == nil { return }
        kkk_load_lll!(view!, loops, path)
    }
    func CCC_overSvga_DDD(_ tag : Int) {
        kkk_svgaOver_lll?(tag)
    }
    
    
    
    
}

//外部使用，播放及暂停销毁等
nonisolated(unsafe) public let kkk_generalOut_lll: AAA_generalOutProtocol_BBB = AAA_generalOutModels_BBB()



