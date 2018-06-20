//
//  AccountController.swift
//  BTCE Widget
//
//  Created by long on 6/19/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
import SwiftyAttributes


class AccountAdapter: CLAdapter {
    var isLoading: Bool = true
    var wexKey:WexKey?
    var tInfo:TInfo?
    
    override func registerNib(_ cl: UICollectionView) {
        Utils.registerCLCell(cl, name: CLLoadingCell.typeName)
        Utils.registerCLCell(cl, name: NoAPIKeyCell.typeName)
        Utils.registerCLCell(cl, name: FundCell.typeName)
        Utils.registerCLCell(cl, name: AccountButton.typeName)
    }
    
    override func buildModels() {
        clearModels()
        if (isLoading){
            addModel(CLLoadingCellModel())
            return
        }
        
        if wexKey == nil{
            addModel(NoAPIKeyCellModel())
            return
        }
        
        if ( tInfo != nil){
            for (k,v) in tInfo!.funds{
//                let fund = k.uppercased().withFont(.systemFont(ofSize: 18)) + String(describing: v).withFont(.systemFont(ofSize: 18)).withTextColor(UIColor.red)
                if v > 0.0 {
                    addModel(FundCellModel(k, v))
                }
            }
        
            
            addModel(AccountButtonModel())
            addModel(AccountButtonModel())
        
        }
        
        
    
        
    }
}
