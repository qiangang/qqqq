//
//  AAA_UIViewExtension_BBB.swift
//  Module_General
//
//  Created by Frankie on 19/05/2025.
//

import UIKit


public typealias kkk_viewAction_lll = (UIGestureRecognizer)->()

@IBDesignable public extension UIView {
    
    
    //全圆角左右圆角上下圆角渐变色
    //圆角
    //isVertical 是否垂直，渐变色方向
    //cornerType 0全圆角   1左边圆角   2上边圆角
    //borderColors 渐变色
    func CCC_layers_DDD(_ isVertical : Bool, _ cornerType : Int, _ corner : CGFloat, _ borderWidth : CGFloat, _ borderColors : NSArray) -> CAGradientLayer {
        let kkk_colorArray_lll = NSMutableArray()
        for kkk_nums_lll in 0..<borderColors.count {
            let colors = borderColors[kkk_nums_lll]
            if colors is String {
                if (colors as AnyObject).length >= 6 {
                    kkk_colorArray_lll.add(CCC_CGcolor_DDD(colors as! String))
                }
            }else{
                kkk_colorArray_lll.add(colors)
            }
        }
        let kkk_cusLayer_lll = CAGradientLayer()
        kkk_cusLayer_lll.frame = CGRectMake(0, 0, self.width, self.height)
        kkk_cusLayer_lll.colors = (kkk_colorArray_lll as! [Any])
        if isVertical == true {
            kkk_cusLayer_lll.startPoint = CGPointMake(1, 0)
        }else{
            kkk_cusLayer_lll.startPoint = CGPointMake(0, 1)
        }
        kkk_cusLayer_lll.endPoint = CGPointMake(1, 1)
        kkk_cusLayer_lll.mask = CCC_shaps_DDD(cornerType, corner, borderWidth)
        self.layer.insertSublayer(kkk_cusLayer_lll, at: 0)
        return kkk_cusLayer_lll
    }
    //圆角边框渐变色
    func CCC_shaps_DDD(_ cornerType : Int, _ corner : CGFloat, _ borderWidth : CGFloat) -> CAShapeLayer {
        let kkk_shapLayer_lll = CAShapeLayer()
        if cornerType == 0 {
            kkk_shapLayer_lll.path = UIBezierPath(roundedRect: CGRectMake(0, 0, width, height), cornerRadius: corner).cgPath
        }else if cornerType == 1 {
            kkk_shapLayer_lll.path = UIBezierPath.init(roundedRect: CGRectMake(0, 0, self.width, self.height), byRoundingCorners: [.topLeft,.bottomLeft], cornerRadii: CGSize(width: corner, height: corner)).cgPath
        }else if cornerType == 2 {
            kkk_shapLayer_lll.path = UIBezierPath.init(roundedRect: CGRectMake(0, 0, self.width, self.height), byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: corner, height: corner)).cgPath
        }
        kkk_shapLayer_lll.lineWidth = borderWidth
        return kkk_shapLayer_lll
    }
    
    
    // FUNCMARK
    
    // FUNCMARK
    private static var kkk_keyAction_lll: Bool = false
    // FUNCMARK
    
    // FUNCMARK
    @objc dynamic var kkk_action_lll:kkk_viewAction_lll? {
        set {
            objc_setAssociatedObject(self, &UIView.kkk_keyAction_lll, newValue, .OBJC_ASSOCIATION_COPY)
        }
        get {
            if let action = objc_getAssociatedObject(self,  &UIView.kkk_keyAction_lll) as? kkk_viewAction_lll {
                return action
            }
            return nil
        }
    }
    // FUNCMARK

    // FUNCMARK
    @objc func CCC_viewTapAction_DDD(gesture: UIGestureRecognizer) {
        if kkk_action_lll != nil {
            kkk_action_lll!(gesture)
        }
    }
    // FUNCMARK

    // FUNCMARK
    func CCC_addGesture_DDD( _ kkk_gesture_lll : kkk_Gestures_lll , response:@escaping kkk_viewAction_lll) {
        
        self.isUserInteractionEnabled = true
        switch kkk_gesture_lll {
        case .tap:
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CCC_viewTapAction_DDD(gesture:)))
            tapGesture.numberOfTouchesRequired = 1
            tapGesture.numberOfTapsRequired = 1
            self.addGestureRecognizer(tapGesture)
            self.kkk_action_lll = response
        }
    }
    // FUNCMARK
    // FUNCMARK
    class func CCC_animationAlert_DDD(aview:UIView) -> Void {
        aview.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            aview.alpha = 1
        })
    }
    // FUNCMARK
    // MARK: 键盘
    @objc func CCC_closeKeyboard_DDD() {
        kkk_Window_lll!.endEditing(true)
    }
    func CCC_addCloseKeyboardTap_DDD() {
        let kkk_tap_lll = UITapGestureRecognizer(target: self, action: #selector(CCC_closeKeyboard_DDD))
        kkk_tap_lll.cancelsTouchesInView = false
        self.addGestureRecognizer(kkk_tap_lll)
    }
    func CCC_backChangeColor_DDD(_ color : NSArray, _ corner : CGFloat) {
        _ = self.CCC_layers_DDD(true, corner, color)
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    func CCC_backChangeColorH_DDD(_ color : NSArray, _ corner : CGFloat) {
        _ = self.CCC_layers_DDD(false, corner, color)
    }
    // MARK: NSLayoutConstraint
    func CCC_constrains_DDD(_ top : CGFloat,_ bottom : CGFloat,_ leading : CGFloat,_ tralling : CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: self.superview!.topAnchor, constant: top),
            self.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor, constant: leading),
            self.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor, constant: tralling),
            self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor, constant: bottom)
        ])
    }
    func CCC_constTopLeaFrame_DDD(_ top : CGFloat, _ leading : CGFloat, _ width : CGFloat, _ height : CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: self.superview!.topAnchor, constant: top),
            self.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor, constant: leading),
            self.widthAnchor.constraint(equalToConstant: width),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    @IBInspectable var MMM_bordWidth_NNN: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var MMM_bordColor_NNN: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
    }
    @IBInspectable var masksToBounds: Bool {
        set {
            layer.masksToBounds = newValue
        }
        get {
            return layer.masksToBounds
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
        
    }
    // FUNCMARK
    func CCC_allButtons_DDD() -> [UIButton] {
        var kkk_buttons_lll = self.subviews.compactMap { $0 as? UIButton }
        for kkk_subview_lll in self.subviews {
            kkk_buttons_lll += kkk_subview_lll.CCC_allButtons_DDD()
        }
        return kkk_buttons_lll
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_shadowSet_DDD(_ corner : Int, _ color : UIColor, _ opacity : CGFloat, _ wid : Int, _ hei : Int, _ radius : Int) {
        self.layer.cornerRadius = CGFloat(corner)
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = Float(opacity)
        self.layer.shadowOffset = CGSize(width: wid, height: hei)
        self.layer.shadowRadius = CGFloat(radius)
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
    // FUNCMARK
    // FUNCMARK
    
    enum kkk_Gestures_lll {
        case tap
    }
    func CCC_push_DDD(_ con : UIViewController) {
        let kkk_tabs_lll = kkk_Window_lll?.rootViewController
        if kkk_tabs_lll != nil {
            if kkk_tabs_lll!.isKind(of: UITabBarController.self) {
                
                let kkk_navis_lll : UINavigationController = (kkk_tabs_lll as! UITabBarController).selectedViewController as! UINavigationController
                kkk_navis_lll.pushViewController(con , animated: true)
            }else if kkk_tabs_lll!.isKind(of: UINavigationController.self) {
                (kkk_tabs_lll as! UINavigationController).pushViewController(con , animated: true)
            }
        }
    }
    //STARTMARK
    static func CCC_loadViews_DDD() -> Self {
        let kkk_views_lll = kkk_bundles_lll.loadNibNamed(String(describing: self), owner: nil, options: nil)!.first
        return kkk_views_lll as! Self
    }
    //ENDMARK
    // FUNCMARK
    // FUNCMARK
    class func CCC_push_DDD(_ con : UIViewController) {
        let kkk_tabs_lll = kkk_Window_lll?.rootViewController
        if kkk_tabs_lll != nil {
            if kkk_tabs_lll!.isKind(of: UITabBarController.self) {
                
                let kkk_navis_lll : UINavigationController = (kkk_tabs_lll as! UITabBarController).selectedViewController as! UINavigationController
                kkk_navis_lll.pushViewController(con , animated: true)
            }else if kkk_tabs_lll!.isKind(of: UINavigationController.self) {
                (kkk_tabs_lll as! UINavigationController).pushViewController(con , animated: true)
            }
        }
    }
    class func CCC_back_DDD() {
        let kkk_tabs_lll = kkk_Window_lll?.rootViewController
        if kkk_tabs_lll != nil {
            if kkk_tabs_lll!.isKind(of: UITabBarController.self) {
                
                let kkk_navis_lll : UINavigationController = (kkk_tabs_lll as! UITabBarController).selectedViewController as! UINavigationController
                kkk_navis_lll.popViewController(animated: true)
            }else if kkk_tabs_lll!.isKind(of: UINavigationController.self) {
                (kkk_tabs_lll as! UINavigationController).popViewController(animated: true)
            }
        }
    }
    func CCC_closeHideBtn_DDD(_ x :CGFloat) -> UIButton {
        let kkk_closeBtn_lll = UIButton()
        kkk_closeBtn_lll.CCC_images_DDD("MMM_grayCloseImage_NNN")
        kkk_closeBtn_lll.frame = CGRectMake(x, 12, 24, 24)
        self.addSubview(kkk_closeBtn_lll)
        return kkk_closeBtn_lll
    }
    var right: CGFloat {
        get{
            return self.frame.size.width + self.frame.origin.x
        }
        set{
            self.x = newValue - self.width
        }
    }
    var left: CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            self.x = newValue
        }
    }
    var size: CGSize {
        get{
            return self.frame.size
        }
        set{
            var kkk_frame_lll = self.frame
            kkk_frame_lll.size = newValue
            self.frame = kkk_frame_lll
        }
    }
    
    func CCC_rounds_DDD(_ round : CGFloat) {
        self.layer.cornerRadius = round
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
    func CCC_clickBtn_DDD(_ str :String, _ font : Int, _ color : String, _ frame : CGRect) -> UIButton {
        let kkk_closeBtn_lll = UIButton()
        kkk_closeBtn_lll.frame = frame
        kkk_closeBtn_lll.CCC_rounds_DDD(frame.height/2)
        kkk_closeBtn_lll.adjustsImageWhenHighlighted = false
        kkk_closeBtn_lll.CCC_backImages_DDD("MMM_loginButtonBg_NNN")
        kkk_closeBtn_lll.CCC_titleRO_DDD(str, font, AAA_GeneralOutModel_BBB.CCC_color_DDD(color))
        self.addSubview(kkk_closeBtn_lll)
        return kkk_closeBtn_lll
    }
    func CCC_btn_DDD(_ frame :CGRect, _ image : String) -> UIButton {
        let kkk_closeBtn_lll = UIButton()
        kkk_closeBtn_lll.CCC_images_DDD(image)
        kkk_closeBtn_lll.frame = frame
        self.addSubview(kkk_closeBtn_lll)
        return kkk_closeBtn_lll
    }
    
    func CCC_titles_DDD(_ str :String, _ font : Int, _ color : String, _ frame : CGRect, _ centers : Bool, _ line : Int) -> UILabel {
        let kkk_label_lll = UILabel()
        kkk_label_lll.frame = frame
        kkk_label_lll.numberOfLines = line
        if centers == true {
            kkk_label_lll.textAlignment = .center
        }
        kkk_label_lll.CCC_MMdet_DDD(str, font, color)
        self.addSubview(kkk_label_lll)
        return kkk_label_lll
    }

    
    func CCC_round_DDD(_ corner : CGFloat) {
        self.layer.cornerRadius = corner
        self.clipsToBounds = true
    }
    func CCC_layers_DDD(_ isVertical : Bool, _ corner : CGFloat, _ color : NSArray, _ frame : CGRect) -> CAGradientLayer {
        let kkk_colorArray_lll = NSMutableArray()
        for kkk_nums_lll in 0..<color.count {
            let colors = color[kkk_nums_lll]
            if colors is String {
                if (colors as AnyObject).length >= 6 {
                    kkk_colorArray_lll.add(CCC_CGcolor_DDD(colors as! String))
                }
            }else{
                kkk_colorArray_lll.add(colors)
            }
        }
        let kkk_cusLayer_lll = CAGradientLayer()
        kkk_cusLayer_lll.frame = frame
        kkk_cusLayer_lll.colors = (kkk_colorArray_lll as! [Any])
        if isVertical == true {
            kkk_cusLayer_lll.startPoint = CGPointMake(1, 0)
        }else{
            kkk_cusLayer_lll.startPoint = CGPointMake(0, 1)
        }
        kkk_cusLayer_lll.endPoint = CGPointMake(1, 1)
        kkk_cusLayer_lll.cornerRadius = corner
        self.layer.insertSublayer(kkk_cusLayer_lll, at: 0)
        return kkk_cusLayer_lll
    }
    
    func CCC_layers_DDD(_ isVertical : Bool, _ corner : CGFloat, _ color : NSArray) -> CAGradientLayer {
        let kkk_colorArray_lll = NSMutableArray()
        for kkk_nums_lll in 0..<color.count {
            let colors = color[kkk_nums_lll]
            if colors is String {
                if (colors as AnyObject).length >= 6 {
                    kkk_colorArray_lll.add(CCC_CGcolor_DDD(colors as! String))
                }
            }else{
                kkk_colorArray_lll.add(colors)
            }
        }
        let kkk_cusLayer_lll = CAGradientLayer()
        kkk_cusLayer_lll.frame = CGRectMake(0, 0, self.width, self.height)
        kkk_cusLayer_lll.colors = (kkk_colorArray_lll as! [Any])
        if isVertical == true {
            kkk_cusLayer_lll.startPoint = CGPointMake(1, 0)
        }else{
            kkk_cusLayer_lll.startPoint = CGPointMake(0, 1)
        }
        kkk_cusLayer_lll.endPoint = CGPointMake(1, 1)
        kkk_cusLayer_lll.cornerRadius = corner
        self.layer.insertSublayer(kkk_cusLayer_lll, at: 0)
        return kkk_cusLayer_lll
    }
    
    func CCC_present_DDD(_ con : UIViewController) {
        let kkk_tabs_lll = kkk_Window_lll?.rootViewController
        if kkk_tabs_lll != nil {
            if kkk_tabs_lll!.isKind(of: UITabBarController.self) {
                let kkk_navis_lll : UINavigationController = (kkk_tabs_lll as! UITabBarController).selectedViewController as! UINavigationController
                kkk_navis_lll.present(con , animated: true)
            }else if kkk_tabs_lll!.isKind(of: UINavigationController.self) {
                (kkk_tabs_lll as! UINavigationController).present(con , animated: true)
            }
        }
    }
    
    var x: CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            var kkk_frame_lll = self.frame
            kkk_frame_lll.origin.x = newValue
            self.frame = kkk_frame_lll
        }
    }
    // FUNCMARK
    // FUNCMARK
    var y: CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            var kkk_frame_lll = self.frame
            kkk_frame_lll.origin.y = newValue
            self.frame = kkk_frame_lll
        }
    }
    // FUNCMARK
    // FUNCMARK
    var width: CGFloat {
        get{
            return self.frame.size.width
        }
        set{
            var kkk_frame_lll = self.frame
            kkk_frame_lll.size.width = newValue
            self.frame = kkk_frame_lll
        }
    }
    // FUNCMARK
    // FUNCMARK
    var height: CGFloat {
        get{
            return self.bounds.size.height
        }
        set{
            var kkk_frame_lll = self.frame
            kkk_frame_lll.size.height = newValue
            self.frame = kkk_frame_lll
        }
    }
    var top: CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            var kkk_frame_lll = self.frame
            kkk_frame_lll.origin.y = newValue
            self.frame = kkk_frame_lll
        }
    }
    var bottom: CGFloat {
        get{
            return self.frame.size.height + self.frame.origin.y
        }
        set{
            var kkk_frame_lll = self.frame
            kkk_frame_lll.size.height = newValue
            self.frame = kkk_frame_lll
        }
    }
}

public extension CAShapeLayer {

    
    
    
    func CCC_defShapLayer_DDD(_ fillColor : UIColor, _ lineWidth : Int, _ strokeColor : UIColor, _ strokeStart : Int) {
        self.fillColor = fillColor.cgColor;
        self.lineWidth = CGFloat(lineWidth);
        self.lineCap = .round;
        self.strokeColor = strokeColor.cgColor;
        self.strokeStart = CGFloat(strokeStart);
    }
    func CCC_defShapLayerEnd_DDD(_ fillColor : UIColor, _ lineWidth : Int, _ strokeColor : UIColor, _ strokeStart : Int) {
        self.fillColor = fillColor.cgColor;
        self.lineWidth = CGFloat(lineWidth);
        self.lineCap = .round;
        self.strokeColor = strokeColor.cgColor;
        self.strokeEnd = CGFloat(strokeStart);
    }

}



enum types: Int {
    case Left,Right,Top,Buttom,Tops
}
extension UIView {
    internal func CCC_getLightlightColor_DDD(_ types: types, _ colors: [CGColor])  {
        DispatchQueue.main.async {[weak self] in
            guard let `self` = self else { return }
            var start: CGPoint = CGPoint(x: 0, y: 0)
            var end: CGPoint = CGPoint(x: 0, y: 1)
            let gradientLayer = CAGradientLayer()
            
            switch types {
            case .Left:
                do {
                    start = CGPoint(x: 0, y: 0)
                    end = CGPoint(x: 1, y: 0)
                }
            case .Right:
                do {
                    start = CGPoint(x: 1, y: 0)
                    end = CGPoint(x: 0, y: 0)
                }
            case .Top:
                do {
                    start = CGPoint(x: 0, y: 0)
                    end = CGPoint(x: 0, y: 1)
                }
            case .Buttom:
                do {
                    start = CGPoint(x: 0, y: 1)
                    end = CGPoint(x: 0, y: 0)
                }
            case .Tops:
                do {
                    let gradientLocations:[NSNumber] = [0.0,0.5,1]
                    gradientLayer.locations = gradientLocations
                    
                    start = CGPoint(x: 0.18, y: 0.16)
                    end = CGPoint(x: 0.78, y: 0.83)
                }
            }
            
            self.layoutIfNeeded()
            self.CCC_removeLayer_DDD()
            gradientLayer.startPoint = start
            gradientLayer.endPoint =  end
            gradientLayer.frame = self.bounds
            gradientLayer.colors = colors
            
            layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    private func CCC_removeLayer_DDD() {
        guard let layers = self.layer.sublayers else { return }
        for layer in layers {
            if layer.isKind(of: CAGradientLayer.self) {
                layer.removeFromSuperlayer()
            }
        }
    }
}
