//
//  AccountButton.swift
//  BTCE Widget
//
//  Created by long on 6/20/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
class AccountButton : UICollectionViewCell {
    @IBOutlet weak var btn: UIButton!
    
}

class AccountButtonModel:CLModel{
    
    override func getWidth(_ collectionView: UICollectionView) -> CGFloat {
        return collectionView.bounds.width
    }
    override func getHeight(_ collectionView: UICollectionView) -> CGFloat {
        return 50
    }
    
    override func nibName() -> String {
        return AccountButton.typeName
    }
//
//    override func fillData(cell: UICollectionViewCell) {
//        super.fillData(cell: cell)
//
//        if let c = cell as? FundCell{
//            c.titleText.text = self.label
//            c.valueText.text = String(describing: self.value!)
//        }
//    }
}
