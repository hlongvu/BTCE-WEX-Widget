//
//  LoadingCell.swift
//  BTCE Widget
//
//  Created by long on 6/19/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
class CLLoadingCell: UICollectionViewCell {
    
}

class CLLoadingCellModel: CLModel {
    override func getHeight(_ collectionView: UICollectionView) -> CGFloat {
        return 100
    }
    
    override func nibName() -> String {
        return CLLoadingCell.typeName
    }
    
}
