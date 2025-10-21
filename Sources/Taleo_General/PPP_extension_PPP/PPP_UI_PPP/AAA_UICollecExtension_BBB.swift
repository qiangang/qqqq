//
//  AAA_UICollecExtension_BBB.swift
//  Module_General
//
//  Created by Frankie on 20/05/2025.
//

import UIKit


public extension UICollectionView{
    
    
    func CCC_regCell_DDD(_ name : String, _ bundle : Bundle) {
        self.register(UINib(nibName: name, bundle: bundle), forCellWithReuseIdentifier: name)
    }
    func CCC_regHeader_DDD(_ name : String, _ bundle : Bundle) {
        self.register(UINib(nibName: name, bundle: bundle), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: name)
    }
    func CCC_regCodeCell_DDD(_ viewClass: AnyClass) {
        self.register(viewClass, forCellWithReuseIdentifier: "\(viewClass)")
    }
    func CCC_regCodeHeader_DDD(_ viewClass: AnyClass) {
        self.register(viewClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(viewClass)")
    }
    func CCC_regCells_DDD(_ array : Array<String>, _ bundle : Bundle) {
        for name in array {
            self.register(UINib(nibName: name, bundle: bundle), forCellWithReuseIdentifier: name)
        }
    }
    func CCC_regHeaders_DDD(_ array : Array<String>, _ bundle : Bundle) {
        for name in array {
            self.register(UINib(nibName: name, bundle: bundle), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: name)
        }
    }
    
    
    
    
    
    func CCC_gerRegister_DDD(_ kkk_cellName_lll:String, _ bundle : Bundle){
        self.backgroundColor = .clear
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.register(UINib(nibName: kkk_cellName_lll, bundle: bundle), forCellWithReuseIdentifier: kkk_cellName_lll)
        
    }
    
    func CCC_dequColl_DDD<T: UICollectionViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
        let kkk_className_lll = String(describing: T.self)
        let kkk_cell_lll = dequeueReusableCell(withReuseIdentifier: kkk_className_lll, for: indexPath) as! T
        return kkk_cell_lll
    }
    
}



public extension UITableView {
    // FUNCMARK
    
    func CCC_regCells_DDD(_ array : Array<String>, _ bundle : Bundle) {
        for name in array {
            self.register(UINib(nibName: name, bundle: bundle), forCellReuseIdentifier: name)
        }
    }
    func CCC_regCodeCells_DDD(_ name : String) {
        self.register(NSClassFromString(name).self, forCellReuseIdentifier: name)
    }
    
    func CCC_def_DDD() {
        self.separatorStyle = .none
        self.backgroundColor = .clear
        self.contentInsetAdjustmentBehavior = .never
        self.estimatedRowHeight = 100
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        if #available(iOS 15.0, *) {
            self.sectionHeaderTopPadding = 0
        }
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0
        }
    }
    
    func CCC_gerRegister_DDD(_ array:Array<String>, _ bundle: Bundle){
        
        for kkk_cellName_lll : String in array {
            self.register(UINib(nibName: kkk_cellName_lll, bundle: bundle), forCellReuseIdentifier: kkk_cellName_lll);
        }
        
        self.separatorStyle = .none
        self.backgroundColor = .clear
        self.contentInsetAdjustmentBehavior = .never
        self.estimatedRowHeight = 100
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        if #available(iOS 15.0, *) {
            self.sectionHeaderTopPadding = 0
        }
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0
        }
    }
    // FUNCMARK
    // FUNCMARK
    func CCC_dequCell_DDD<T: UITableViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let kkk_cell_lll = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("\(String(describing: cellType))")
        }
        kkk_cell_lll.selectionStyle = .none
        kkk_cell_lll.backgroundColor = .clear
        return kkk_cell_lll
    }
    // FUNCMARK
}
