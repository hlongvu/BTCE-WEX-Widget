//
//  PairCell.swift
//  BTCE Widget
//
//  Created by Long Vu on 3/17/17.
//  Copyright © 2017 Long Vu. All rights reserved.
//

import Foundation
import UIKit

class PairCell:UITableViewCell{
    
    @IBOutlet weak var code: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    func setPair(_ pair:Pair){
        self.price.text = pair.last?.description
    }
    
    func setPairCode(_ code:String){
        self.code.text = code
    }
}
