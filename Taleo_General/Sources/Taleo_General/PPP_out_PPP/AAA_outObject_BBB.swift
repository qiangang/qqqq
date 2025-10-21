//
//  AAA_outObject_BBB.swift
//  Module_General
//
//  Created by Frankie on 11/06/2025.
//

import UIKit


public let kkk_allImagePath_lll = NSHomeDirectory().appending("/Library/Wohoo_image/")
nonisolated(unsafe) let kkk_Defaults_lll = UserDefaults.standard
nonisolated(unsafe) var kkk_bundles_lll : Bundle!
nonisolated(unsafe) public var kkk_Window_lll : UIWindow!
nonisolated(unsafe) public var kkk_WIDTH_lll : CGFloat = 0
nonisolated(unsafe) public var kkk_HEIGHT_lll : CGFloat = 0
//nonisolated(unsafe) var kkk_tipView_lll : AAA_WaitView_BBB! {
//    get { kkk_tipView_lll }
//    set { kkk_tipView_lll = AAA_WaitView_BBB() }
//}

//适配
@MainActor public var kkk_SCALEH_lll: (CGFloat) -> CGFloat = {hex in
    return CGFloat(hex) * UIScreen.main.bounds.size.height / 812;
}

/*
 声网类型
 0 没有加入语聊或者直播
 1 加入语聊房，并且没有退出
 2 加入直播间，并且没有退出
 退出直播间、语聊房，需重置为0
    注意离开房间，还有小窗，需要在小窗的情况下重置
 打电话，需退出直播语聊，所以不用进行任何操作
 */
nonisolated(unsafe) public var kkk_agoraRoomType_lll = 0



@MainActor
class AAA_normals_BBB {
     static let kkk_share_lll = AAA_normals_BBB()
    
    var kkk_tipView_lll = AAA_WaitView_BBB()
    
    
}
