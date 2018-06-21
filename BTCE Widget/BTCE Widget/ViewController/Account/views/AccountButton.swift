//
//  AccountButton.swift
//  BTCE Widget
//
//  Created by long on 6/20/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
import SwiftEventBus
class AccountButton : UICollectionViewCell {
    var delegate: AccountButtonDelegate?
    @IBOutlet weak var btn: UIButton!
    
    @IBAction func clickBtn(_ sender: Any) {
        delegate?.clickButton()
    }
}

protocol AccountButtonDelegate {
    func clickButton()
}

class AccountButtonModel:CLModel, AccountButtonDelegate{
    var action:String
    var label:String
    
    init(_ action:String,_ label:String) {
        self.action = action
        self.label = label
    }

    
    override func getHeight(_ collectionView: UICollectionView) -> CGFloat {
        return 50
    }
    
    override func nibName() -> String {
        return AccountButton.typeName
    }

    override func fillData(cell: UICollectionViewCell) {
        super.fillData(cell: cell)

        if let c = cell as? AccountButton{
            c.btn.setTitle(self.label, for: .normal)
            c.delegate = self
        }
    }
    
    func clickButton(){
        SwiftEventBus.post(self.action)
    }
}
