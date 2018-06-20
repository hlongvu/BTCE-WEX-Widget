//
//  NoAPIKeyCell.swift
//  BTCE Widget
//
//  Created by long on 6/19/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
import SwiftEventBus

class NoAPIKeyCell: UICollectionViewCell {
    @IBOutlet weak var apiText: UITextField!
    @IBOutlet weak var secretText: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBAction func saveClick(_ sender: Any) {
        print("Click save")
        let apiKey = apiText.text ?? ""
        let secretKey = secretText.text ?? ""
        let wexKey = WexKey(apiKey, secretKey)
        SwiftEventBus.post(Constants.KEY_CLICK_SAVE_API, sender: wexKey)
    }
}


class NoAPIKeyCellModel:CLModel{
    override func getHeight(_ collectionView: UICollectionView) -> CGFloat {
        return 350
    }
    
    override func nibName() -> String {
        return NoAPIKeyCell.typeName
    }
    
    override func fillData(cell: UICollectionViewCell) {
        if let c = cell as? NoAPIKeyCell{
            c.bringSubview(toFront: c.apiText)
            c.bringSubview(toFront: c.secretText)
            c.bringSubview(toFront: c.saveBtn)
        }
    }
    
}
