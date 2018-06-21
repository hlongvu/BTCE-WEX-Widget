//
//  SpaceCell.swift
//  BTCE Widget
//
//  Created by long on 6/21/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit

class SpaceCell: UICollectionViewCell {
    
}
class SpaceCellModel:CLModel{
    var height:Int = 10
    init(height:Int) {
        self.height = height
    }
    
    override func getHeight(_ collectionView: UICollectionView) -> CGFloat {
        return CGFloat(self.height)
    }
    
    override func nibName() -> String {
        return SpaceCell.typeName
    }

    
}
