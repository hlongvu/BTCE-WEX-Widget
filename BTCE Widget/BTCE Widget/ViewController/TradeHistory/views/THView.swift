//
//  THView.swift
//  BTCE Widget
//
//  Created by long on 6/21/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
class THView : UICollectionViewCell {
    @IBOutlet weak var txType: UILabel!
    @IBOutlet weak var txPair: UILabel!
    @IBOutlet weak var txAmount: UILabel!
    @IBOutlet weak var txRate: UILabel!
    @IBOutlet weak var txTime: UILabel!
    
}

class THViewData{
    var type:String = ""
    var pair:String = ""
    var amount:Double = 0
    var rate:Double = 0
    var time:Double = 0
    
    init(fromTHistory: THistory) {
        self.type  = fromTHistory.type
        self.pair = fromTHistory.pair
        self.amount = fromTHistory.amount
        self.rate = fromTHistory.rate
        self.time = fromTHistory.timestamp
    }
    
    init(fromAOrder: AOrder) {
        self.type = fromAOrder.type
        self.pair = fromAOrder.pair
        self.amount = fromAOrder.amount
        self.rate = fromAOrder.rate
        self.time = fromAOrder.timestamp_created
    }
}

class THViewModel:CLModel{
    var data:THViewData?
    init(_ data:THViewData) {
        self.data = data
    }
    override func getHeight(_ collectionView: UICollectionView) -> CGFloat {
        return 25
    }
    
    override func nibName() -> String {
        return THView.typeName
    }
    
    override func fillData(cell: UICollectionViewCell) {
        super.fillData(cell: cell)
        if let c = cell as? THView{
            c.txType.text = self.data?.type
            if (self.data?.type == "buy"){
                c.txType.textColor = UIColor.blue
            }else{
                c.txType.textColor = UIColor.red
            }
            
            c.txPair.text = self.data?.pair.toTradePairTitle()
            c.txAmount.text = self.data?.amount.description
            c.txRate.text = self.data?.rate.description
            
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy/MM/dd HH:mm:ss"
            c.txTime.text = dateFormatterGet.string(from: Date(milliseconds: self.data?.time ?? 0))
            
            
        }
    }
}
