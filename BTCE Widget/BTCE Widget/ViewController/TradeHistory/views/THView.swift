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

class THViewModel:CLModel{
    var tHistory:THistory?
    init(_ tHistory:THistory) {
        self.tHistory = tHistory
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
            c.txType.text = self.tHistory?.type
            if (self.tHistory?.type == "buy"){
                c.txType.textColor = UIColor.blue
            }else{
                c.txType.textColor = UIColor.red
            }
            
            c.txPair.text = self.tHistory?.pair.toTradePairTitle()
            c.txAmount.text = self.tHistory?.amount.description
            c.txRate.text = self.tHistory?.rate.description
            
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy/MM/dd HH:mm:ss"
            c.txTime.text = dateFormatterGet.string(from: Date(milliseconds: self.tHistory?.timestamp ?? 0))
            
            
        }
    }
    
}
