//
//  HomeAdapter.swift
//  BTCE Widget
//
//  Created by Long Vu on 3/15/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit

class PairListAdapter:SGAdapter{
    var priceList = Dictionary<String, Pair>()
    var codeKey =  Currency.Codes.CODES_KEY
    
    override func registerNib(tableView:UITableView) {
        Utils.registerCell(tableView, name: PairCell.typeName)
    }

    override func buildModels() {
        clearModels()
        let codeList = Currency.getCodeArrayByKey(codeKey)
        for code in codeList {
            let c = code.toTradePairTitle()
            let pair = self.priceList[code]
            addModel(PairCellModel(code: c, pair: pair))
        }
    }
}
