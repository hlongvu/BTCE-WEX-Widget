//
//  CLModel.swift
//  BTCE Widget
//
//  Created by long on 6/20/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit

class CLModel{
    func getHeight(_ collectionView: UICollectionView)-> CGFloat { return 0}
   
    func getWidth(_ collectionView: UICollectionView) -> CGFloat {
        return collectionView.bounds.width
    }
    
    func nibName()-> String {return ""}
    func fillData(cell: UICollectionViewCell) {}
    func didSelect(){}
}
