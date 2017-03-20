//
//  WidgetCell.swift
//  BTCE Widget
//
//  Created by Long Vu on 3/17/17.
//  Copyright © 2017 Long Vu. All rights reserved.
//

import Foundation
import UIKit

class WidgetCell:UITableViewCell{
    
    @IBOutlet weak var code: UILabel!
    
    @IBOutlet weak var price: UILabel!
 
    @IBOutlet weak var high: UILabel!
    
    @IBOutlet weak var low: UILabel!
    
    
    func setPair(_ pair:Pair?){
        
        self.price.text = pair?.last?.description ?? "--"
        self.high.text = "High: " + (pair?.high?.description ?? "--")
        self.low.text = "Low: " + (pair?.low?.description ?? "--")
        
    }
    
    func setPairCode(_ code:String){
        self.code.text = code
    }
}
