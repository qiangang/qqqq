//
//  AAA_CollectionPageFlowLayout_BBB.swift
//  Wohoo
//
//  Created by Ben on 15/10/2024.
//

import UIKit




public class AAA_CollectionPageFlowLayout_BBB: UICollectionViewFlowLayout {
    
    // FUNCMARK
    public var kkk_lastOffset_lll: CGPoint
    // FUNCMARK
    // FUNCMARK
    
    public override init() {
        self.kkk_lastOffset_lll = .zero
        super.init()
    }
    // FUNCMARK
    // FUNCMARK
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // FUNCMARK
    // FUNCMARK
    
    public override func prepare() {
        super.prepare()
 
        self.kkk_lastOffset_lll = self.collectionView?.contentOffset ?? .zero
        self.collectionView?.decelerationRate = .fast
    }
    // FUNCMARK
    // FUNCMARK
    
     

    public override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        var kkk_proposedContentOffset_lll = proposedContentOffset
        let kkk_pageSpace_lll = self.CCC_stepSpace_DDD()
        let kkk_offsetMax_lll: CGFloat = self.collectionView?.contentSize.width ?? kkk_WIDTH_lll - (kkk_pageSpace_lll + self.sectionInset.right + self.minimumLineSpacing)
        let kkk_offsetMin_lll: CGFloat = 0
         if self.kkk_lastOffset_lll.x < kkk_offsetMin_lll {
            kkk_lastOffset_lll.x = kkk_offsetMin_lll
        }else if self.kkk_lastOffset_lll.x > kkk_offsetMax_lll {
            kkk_lastOffset_lll.x = kkk_offsetMax_lll
        }
        
        let kkk_offsetForCurrentPointX_lll: CGFloat = abs(kkk_proposedContentOffset_lll.x - self.kkk_lastOffset_lll.x)
        let kkk_velocityX_lll: CGFloat = velocity.x
        let kkk_direction_lll:Bool = (kkk_proposedContentOffset_lll.x - self.kkk_lastOffset_lll.x) > 0
        
        if kkk_offsetForCurrentPointX_lll > (kkk_pageSpace_lll / 8) && self.kkk_lastOffset_lll.x >= kkk_offsetMin_lll && kkk_lastOffset_lll.x <= kkk_offsetMax_lll {
            var kkk_pageFactor_lll: CGFloat = 0
            if kkk_velocityX_lll != 0
            {
                kkk_pageFactor_lll = abs(kkk_velocityX_lll)
            }else{
                kkk_pageFactor_lll = abs(kkk_offsetForCurrentPointX_lll / kkk_pageSpace_lll)
            }
            kkk_pageFactor_lll = kkk_pageFactor_lll<1 ? 1 : 1
            let kkk_pageOffsetX_lll = kkk_pageSpace_lll * kkk_pageFactor_lll
            kkk_proposedContentOffset_lll = CGPoint(x: self.kkk_lastOffset_lll.x + (kkk_direction_lll ? kkk_pageOffsetX_lll : -kkk_pageOffsetX_lll), y: kkk_proposedContentOffset_lll.y)
        }else{
            kkk_proposedContentOffset_lll = CGPoint(x: self.kkk_lastOffset_lll.x,y: self.kkk_lastOffset_lll.y)
        }
        self.kkk_lastOffset_lll.x = kkk_proposedContentOffset_lll.x
        return kkk_proposedContentOffset_lll
    }
    // FUNCMARK
    // FUNCMARK
     
    func CCC_stepSpace_DDD() -> CGFloat {
        return self.itemSize.width + self.minimumLineSpacing
    }
    // FUNCMARK
}
