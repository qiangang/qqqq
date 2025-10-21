//
//  AAA_NSStringExtension_BBB.swift
//  Module_General
//
//  Created by Frankie on 19/05/2025.
//

import UIKit

public extension String {
    
    func CCC_toDic_DDD() -> [String : Any] {
        if let kkk_data_lll = self.data(using: .utf8) {
            do {
                let kkk_dic_lll = try JSONSerialization.jsonObject(with: kkk_data_lll,options: .mutableContainers)
                return kkk_dic_lll as? [String : Any] ?? [:]
            }catch{}
        }
        return [:]
    }
    
    
    func CCC_substring_DDD(start: Int, _ count: Int) -> String {
        let kkk_begin_lll = index(startIndex, offsetBy: max(0, start))
        let kkk_end_lll = index(startIndex, offsetBy: min(count, start + count))
        return String(self[kkk_begin_lll..<kkk_end_lll])
    }
    
    func CCC_ToArray_DDD() -> NSArray {
        guard let kkk_turnData_lll = self.data(using: .utf8) else {
            return NSArray()
        }
        guard let kkk_turnDic_lll = try? JSONSerialization.jsonObject(with: kkk_turnData_lll, options: .mutableLeaves) as? NSArray else {
            return NSArray()
        }
        return kkk_turnDic_lll
    }
    
    @MainActor func CCC_size_DDD(font:UIFont, MAXWidth:CGFloat = kkk_WIDTH_lll - 32) ->CGSize{
        let kkk_paragraphStyle_lll = NSMutableParagraphStyle()
        kkk_paragraphStyle_lll.lineSpacing = 0 //行间距
        let kkk_attributes_lll: [NSAttributedString.Key: Any] = [
            .paragraphStyle: kkk_paragraphStyle_lll,
            .font:font
        ]
        
        let kkk_string_lll = self as NSString
        var kkk_rect_lll = kkk_string_lll.boundingRect(with:CGSize(width:MAXWidth, height: UIScreen.main.bounds.height), options: [.usesLineFragmentOrigin,.usesFontLeading], attributes: kkk_attributes_lll, context:nil).size
        kkk_rect_lll.width += 0.5
        kkk_rect_lll.height += 0.4
        return kkk_rect_lll
    }
    func CCC_substr_DDD(_ start: Int, _ count: Int) -> String {
        let kkk_begin_lll = index(startIndex, offsetBy: start)
        let kkk_end_lll = index(startIndex, offsetBy: count + start)
        return String(self[kkk_begin_lll..<kkk_end_lll])
    }
    // FUNCMARK
    // FUNCMARK
    
    func CCC_ranges_DDD(string: String) -> NSArray {
        let kkk_rangeArray_lll = NSMutableArray()
        var kkk_searchedRange_lll: Range<String.Index>
        guard let kkk_sr_lll = self.range(of: self) else {
            return kkk_rangeArray_lll
        }
        kkk_searchedRange_lll = kkk_sr_lll
        
        var kkk_resultRange_lll = self.range(of: string, options: .regularExpression, range: kkk_searchedRange_lll, locale: nil)
        while let kkk_range_lll = kkk_resultRange_lll {
            
            let kkk_ranged_lll = NSRange(kkk_range_lll, in: self)
            kkk_rangeArray_lll.add(kkk_ranged_lll)
            kkk_searchedRange_lll = Range(uncheckedBounds: (kkk_range_lll.upperBound, kkk_searchedRange_lll.upperBound))
            kkk_resultRange_lll = self.range(of: string, options: .regularExpression, range: kkk_searchedRange_lll, locale: nil)
        }
        return kkk_rangeArray_lll
    }
    // FUNCMARK
    // FUNCMARK
    // FUNCMARK
    // FUNCMARK
    func CCC_toArray_DDD() -> [[String:Any]] {
        
        if let kkk_data_lll = self.data(using: .utf8) {
            do {
                let kkk_dic_lll = try JSONSerialization.jsonObject(with: kkk_data_lll)
                if kkk_dic_lll is [[String:Any]] {
                    return kkk_dic_lll as? [[String:Any]] ?? []
                }
            }catch{}
        }
        return []
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_toAnyArray_DDD() -> [Any] {
        
        if let kkk_data_lll = self.data(using: .utf8) {
            if let kkk_dic_lll = try? JSONSerialization.jsonObject(with: kkk_data_lll)  {
                return kkk_dic_lll as? [Any] ?? []
            }
        }
        return []
    }
    // FUNCMARK
    // FUNCMARK
    static func CCC_timeStampToTimeStr_DDD(from timeStamp: TimeInterval , format:String = "yyyy-MM-dd HH:mm:ss") -> String {
        let kkk_dateFormatte_lll = DateFormatter()
        kkk_dateFormatte_lll.dateFormat = format
        return kkk_dateFormatte_lll.string(from: Date.init(timeIntervalSince1970: timeStamp))
    }
    // FUNCMARK
    // FUNCMARK
    //时间转时间戳
    static func CCC_timeStrToTimeStamp_DDD(from timeStr:String,format:String = "yyyy-MM-dd HH:mm:ss") -> TimeInterval {
        let kkk_dateFormatte_lll = DateFormatter()
        kkk_dateFormatte_lll.dateFormat = format
        return kkk_dateFormatte_lll.date(from: timeStr)?.timeIntervalSince1970 ?? 0
        
    }
    
    // FUNCMARK
    // FUNCMARK
    
    
    static func CCC_loadMoneys_DDD(_ float : CGFloat) -> String {
        let kkk_moneys_lll = float
        var kkk_money_lll = ""
        if kkk_moneys_lll >= 1000000000 {
            let kkk_moneyK_lll = kkk_moneys_lll/1000000000.0
            var kkk_str_lll = String(format: "%.1fB", kkk_moneyK_lll)
            if kkk_str_lll.hasSuffix("0B") {
                kkk_str_lll = String(format: "%.0fB", kkk_moneyK_lll)
            }
            if kkk_moneyK_lll > 999 {
                let kkk_moneyAtt_lll = NSMutableString(string: kkk_str_lll)
                kkk_moneyAtt_lll.insert(",", at: 1)
                kkk_money_lll = kkk_moneyAtt_lll as String
            }else {
                kkk_money_lll = kkk_str_lll
            }
        }else if kkk_moneys_lll >= 1000000 {
            let kkk_moneyK_lll = kkk_moneys_lll/1000000.0
            var kkk_str_lll = String(format: "%.1fM", kkk_moneyK_lll)
            if kkk_str_lll.hasSuffix("0M") {
                kkk_str_lll = String(format: "%.0fM", kkk_moneyK_lll)
            }
            if kkk_moneyK_lll > 999 {
                let kkk_moneyAtt_lll = NSMutableString(string: kkk_str_lll)
                kkk_moneyAtt_lll.insert(",", at: 1)
                kkk_money_lll = kkk_moneyAtt_lll as String
            }else {
                kkk_money_lll = kkk_str_lll
            }
        }else if kkk_moneys_lll >= 1000 {
            let kkk_moneyK_lll = kkk_moneys_lll/1000.0
            var kkk_str_lll = String(format: "%.1fK", kkk_moneyK_lll)
            if kkk_str_lll.hasSuffix("0K") {
                kkk_str_lll = String(format: "%.0fK", kkk_moneyK_lll)
            }
            if kkk_moneyK_lll > 999 {
                let kkk_moneyAtt_lll = NSMutableString(string: kkk_str_lll)
                kkk_moneyAtt_lll.insert(",", at: 1)
                kkk_money_lll = kkk_moneyAtt_lll as String
            }else {
                kkk_money_lll = kkk_str_lll
            }
        }else {
            kkk_money_lll = String(format: "%.2f", kkk_moneys_lll)
            if kkk_money_lll.hasSuffix("0") == true {
                kkk_money_lll = String(format: "%.1f", kkk_moneys_lll)
                if kkk_money_lll.hasSuffix("0") == true {
                    kkk_money_lll = String(format: "%.0f", kkk_moneys_lll)
                }
            }
        }
        return kkk_money_lll
    }
    // FUNCMARK
    // FUNCMARK
    
    
    static func CCC_loadMoneys1_DDD(_ float : CGFloat) -> String {
        var kkk_moneys_lll = String(format: "%.2f", float)
        if kkk_moneys_lll.hasSuffix("0") == true {
            kkk_moneys_lll = String(format: "%.1f", float)
            if kkk_moneys_lll.hasSuffix("0") == true {
                kkk_moneys_lll = String(format: "%.0f", float)
            }
        }
        let kkk_array_lll = kkk_moneys_lll.components(separatedBy: ".")
        var kkk_str_lll = kkk_array_lll[0]
        if kkk_str_lll.count > 3 {
            let kkk_strs_lll = NSMutableString(string: kkk_str_lll)
            kkk_strs_lll.insert(",", at: kkk_strs_lll.length - 3)
            kkk_str_lll = kkk_strs_lll as String
        }
        if kkk_str_lll.count > 8 {
            let kkk_strs_lll = NSMutableString(string: kkk_str_lll)
            kkk_strs_lll.insert(",", at: kkk_strs_lll.length - 7)
            kkk_str_lll = kkk_strs_lll as String
        }
        if kkk_str_lll.count > 12 {
            let kkk_strs_lll = NSMutableString(string: kkk_str_lll)
            kkk_strs_lll.insert(",", at: kkk_strs_lll.length - 11)
            kkk_str_lll = kkk_strs_lll as String
        }
        if kkk_str_lll.count > 16 {
            let kkk_strs_lll = NSMutableString(string: kkk_str_lll)
            kkk_strs_lll.insert(",", at: kkk_strs_lll.length - 15)
            kkk_str_lll = kkk_strs_lll as String
        }
        if kkk_str_lll.count > 20 {
            let kkk_strs_lll = NSMutableString(string: kkk_str_lll)
            kkk_strs_lll.insert(",", at: kkk_strs_lll.length - 19)
            kkk_str_lll = kkk_strs_lll as String
        }
        if kkk_array_lll.count > 1 {
            kkk_str_lll = kkk_str_lll + "." + kkk_array_lll[1]
        }
        return kkk_str_lll
    }
    // FUNCMARK
    // FUNCMARK
    static func CCC_formatNum_DDD(_ str : Int) -> String {
        let kkk_formatter_lll = NumberFormatter()
        kkk_formatter_lll.numberStyle = .decimal
        kkk_formatter_lll.locale = Locale(identifier: "en_us")
        let kkk_currencyString_lll = kkk_formatter_lll.string(from: NSNumber(value: str))
        
        return kkk_currencyString_lll ?? String(format: "%d", str)
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_formatNums_DDD() -> String {
        if self.count == 0 {
            return self
        }
        let kkk_str_lll = self.replacingOccurrences(of: ",", with: "")
        let kkk_formatter_lll = NumberFormatter()
        kkk_formatter_lll.groupingSeparator = ","
        kkk_formatter_lll.numberStyle = .decimal
        kkk_formatter_lll.decimalSeparator = "."
        kkk_formatter_lll.roundingMode = .down
        kkk_formatter_lll.locale = Locale(identifier: "en_us")
        kkk_formatter_lll.maximumFractionDigits = 2
        let kkk_currencyString_lll = kkk_formatter_lll.string(from: NSNumber(value: Double(kkk_str_lll) ?? 0))
        return kkk_currencyString_lll ?? String(format: "%@", self)
    }
    
    
    
    @MainActor func CCC_wid_DDD(_ f : Int) ->CGFloat {
        let kkk_label_lll = UILabel.init()
        kkk_label_lll.frame = CGRectMake(0, 0, 10000, 50)
        kkk_label_lll.font = AAA_Font_BBB.CCC_RM_DDD(f)
        kkk_label_lll.text = self
        kkk_label_lll.sizeToFit()
        return kkk_label_lll.width
    }
    // FUNCMARK
    // FUNCMARK
    @MainActor func CCC_wid1_DDD( _ f : Int) ->CGFloat {
        let kkk_label_lll = UILabel.init()
        kkk_label_lll.frame = CGRectMake(0, 0, 10000, 50)
        kkk_label_lll.font = AAA_Font_BBB.CCC_RO_DDD(f)
        kkk_label_lll.text = self
        kkk_label_lll.sizeToFit()
        return kkk_label_lll.width
    }
    // FUNCMARK
    // FUNCMARK
    @MainActor func CCC_size_DDD(_ f : Int, _ w : CGFloat) ->CGSize {
        let kkk_label_lll = UILabel.init()
        kkk_label_lll.frame = CGRectMake(0, 0, w, 1000)
        kkk_label_lll.font = AAA_Font_BBB.CCC_RM_DDD(f)
        kkk_label_lll.text = self
        kkk_label_lll.numberOfLines = 0
        kkk_label_lll.sizeToFit()
        return kkk_label_lll.size
    }
    // FUNCMARK
    // FUNCMARK
    @MainActor func CCC_size2_DDD(_ f : Int, _ w : CGFloat) ->CGSize {
        let kkk_label_lll = UILabel.init()
        kkk_label_lll.frame = CGRectMake(0, 0, w, 1000)
        kkk_label_lll.font = AAA_Font_BBB.CCC_MM_DDD(f)
        kkk_label_lll.text = self
        kkk_label_lll.numberOfLines = 0
        kkk_label_lll.sizeToFit()
        return kkk_label_lll.size
    }
    // FUNCMARK
    // FUNCMARK
    @MainActor func CCC_size1_DDD(_ f : Int, _ w : CGFloat) ->CGSize {
        let kkk_label_lll = UILabel.init()
        kkk_label_lll.frame = CGRectMake(0, 0, w, 1000)
        kkk_label_lll.font = UIFont.systemFont(ofSize: CGFloat(f))
        kkk_label_lll.text = self
        kkk_label_lll.numberOfLines = 0
        kkk_label_lll.sizeToFit()
        
        return kkk_label_lll.size
    }
    
    
    
    @MainActor func CCC_web_DDD(kkk_labelColor_lll : String = "#\(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_818181_color"))",kkk_numColor_lll : String = "#\(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_FF9838_color"))",complete:((_  str:String)->Void)? = nil) -> String {
        var kkk_content_lll = self
        //标题颜色
        kkk_content_lll = kkk_content_lll.replacingOccurrences(of: AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_webColorStr1_NNN"), with: "#\(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_ff0066_color"))")
        kkk_content_lll = kkk_content_lll.replacingOccurrences(of: AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_webColorStr2_NNN"), with: kkk_labelColor_lll)
        kkk_content_lll = kkk_content_lll.replacingOccurrences(of: AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_webColorStr3_NNN"), with: "#\(AAA_GeneralOutModel_BBB.CCC_string_DDD("color_608CFF_color"))")
        kkk_content_lll = kkk_content_lll.replacingOccurrences(of: AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_webColorStr4_NNN"), with: kkk_numColor_lll)


        //砖石 mineDiamond
        let kkk_masonryBase_lll = self.CCC_LocalGoldCoin_DDD("MMM_mineDiamond_NNN")
        kkk_content_lll = kkk_content_lll.replacingOccurrences(of: AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_webDiamondStr_NNN"), with: "data:image/png;base64,\(kkk_masonryBase_lll)")

        //插入金币


        let kkk_goldCoinBase_lll = self.CCC_LocalGoldCoin_DDD("MMM_goldImage_NNN")
        kkk_content_lll = kkk_content_lll.replacingOccurrences(of: AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_webCoinStr_NNN"), with: "data:image/png;base64,\(kkk_goldCoinBase_lll)")
        
        var kkk_LevelInsertion_lll = ""
        var kkk_levelStr_lll = ""
        for kkk_num_lll in 0..<10 {
            let kkk_strs_lll = String(format: "%@%d", AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_webImgLevelStr_NNN"),kkk_num_lll)
            if kkk_content_lll.contains(kkk_strs_lll) == true {
                kkk_LevelInsertion_lll = kkk_leveIconArray_lll[kkk_num_lll]
                kkk_levelStr_lll = kkk_strs_lll
            }
        }
        if kkk_LevelInsertion_lll.count == 0 {
            if kkk_content_lll.contains(AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_webImgLevelStr_NNN")) == true {
                kkk_LevelInsertion_lll = "MMM_levelImageTen_NNN"
                kkk_levelStr_lll = AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_webImgLevelStr_NNN") + "10"
            }else{
                kkk_LevelInsertion_lll = "MMM_levelImageTen_NNN"
                kkk_levelStr_lll = AAA_GeneralOutModel_BBB.CCC_string_DDD("MMM_webImgLevelStr_NNN") + "10"
            }
        }
        //插入等级


        let kkk_levelBase_lll = self.CCC_LocalGoldCoin_DDD(kkk_LevelInsertion_lll)

        kkk_content_lll = kkk_content_lll.replacingOccurrences(of: kkk_levelStr_lll, with: "data:image/png;base64,\(kkk_levelBase_lll)")
        DispatchQueue.main.async {
            complete?(kkk_content_lll)
        }
        return kkk_content_lll
    }
    // FUNCMARK
    // FUNCMARK

    ///本地金币 、本地等级
    ///
    func CCC_LocalGoldCoin_DDD(_ img:String) -> String{
        if let kkk_localImage_lll = UIImage.CCC_localImage_DDD(img).pngData() {
            return kkk_localImage_lll.base64EncodedString()
        }
        return ""
    }
}
