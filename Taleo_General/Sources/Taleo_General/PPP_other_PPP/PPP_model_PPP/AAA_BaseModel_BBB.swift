//
//  AAA_BaseModel_BBB.swift
//  Wohoo
//
//  Created by Ben on 19/11/2024.
//

import UIKit

@objcMembers
open class AAA_BaseModel_BBB: NSObject {
    // FUNCMARK
    public override init() {
        super.init()
    }
    // FUNCMARK
    // FUNCMARK
    public init(dict:Any) {
        super.init()
        setValuesForKeys(dict as! [String : Any])
    }
    // FUNCMARK
    // FUNCMARK
    open override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
    // FUNCMARK
    // FUNCMARK
    ///重写
    open override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    // FUNCMARK
    // FUNCMARK
    ///是否 字符串
    public func isString(_ value: Any) -> Bool {
        return value is String
    }
    // FUNCMARK
    // FUNCMARK
    ///是否 数组
    public func isArray(_ value: Any) -> Bool {
        return value is [Any]
    }
    // FUNCMARK
}
