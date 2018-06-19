//
//  PairCell.swift
//  BTCE Widget
//
//  Created by Long Vu on 3/17/17.
//  Copyright © 2017 Long Vu. All rights reserved.
//

import Foundation
import UIKit
import SwiftEventBus

class PairCell:UITableViewCell{
    
    @IBOutlet weak var code: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var hight: UILabel!
    
    @IBOutlet weak var low: UILabel!
    
    
    func setPair(_ pair:Pair?){
        self.price.text = pair?.last?.description ?? "--"
        self.hight.text = "HIGH: " + (pair?.high?.description ?? "--")
        self.low.text = "LOW: " + (pair?.low?.description ?? "--")
    }
    
    func setPairCode(_ code:String){
        self.code.text = code
    }
}

class PairCellModel:SGModel{
    
    var code:String
    var pair:Pair?
    
    init(code:String, pair:Pair?) {
        self.code = code
        self.pair = pair
    }
    
    override func getHeight() -> CGFloat {
        return 75
    }
    
    override func nibName() -> String {
        return PairCell.typeName
    }
    
    override func fillData(cell: UITableViewCell) {
        super.fillData(cell: cell)
        //        cell.backgroundColor = UIColor.white
        //        cell.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
        if let c = cell as? PairCell{
            c.setPair(pair)
            c.setPairCode(code)
        }
    }
    override func didSelect(index: Int) {
        SwiftEventBus.post(Constants.KEY_CLICK_CELL, sender: code)
    }
}
