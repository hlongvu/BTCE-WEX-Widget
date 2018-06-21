//
//  FundCell.swift
//  BTCE Widget
//
//  Created by long on 6/20/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
class FundCell: UICollectionViewCell {
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var valueText: UILabel!
}
class FundCellModel: CLModel {
    var label:String?
    var value:Double?
    init(_ label:String?,_ value:Double?) {
        self.label = label
        self.value = value
    }
    
    override func getWidth(_ collectionView: UICollectionView) -> CGFloat {
        return 205
    }
    override func getHeight(_ collectionView: UICollectionView) -> CGFloat {
        return 90
    }
    
    override func nibName() -> String {
        return FundCell.typeName
    }
    
    override func fillData(cell: UICollectionViewCell) {
        super.fillData(cell: cell)
        
        if let c = cell as? FundCell{
            c.titleText.text = self.label?.uppercased()
            c.valueText.text = String(format:"%.8f", self.value!)
        }
    }
}
