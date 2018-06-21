//
//  FundCell.swift
//  BTCE Widget
//
//  Created by long on 6/20/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
class TextCell : UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
}

class TextCellModel: CLModel {
    var text:String = ""
    init(_ text:String) {
        self.text = text
    }
    override func getHeight(_ collectionView: UICollectionView) -> CGFloat {
        return 50
    }
    
    override func nibName() -> String {
        return TextCell.typeName
    }
    
    override func fillData(cell: UICollectionViewCell) {
        super.fillData(cell: cell)
        if let c = cell as? TextCell{
           c.label.text = self.text
        }
    }
}

class TextAttrCellModel: CLModel {
    var text : NSAttributedString?
   
    init(_ text:NSAttributedString?) {
        self.text = text
    }
    
    override func getHeight(_ collectionView: UICollectionView) -> CGFloat {
        return 50
    }
    
    override func nibName() -> String {
        return TextCell.typeName
    }
    
    override func fillData(cell: UICollectionViewCell) {
        super.fillData(cell: cell)
        if let c = cell as? TextCell{
            c.label.attributedText = self.text
        }
    }
}
