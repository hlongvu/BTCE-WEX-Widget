//
//  THAdapter.swift
//  BTCE Widget
//
//  Created by long on 6/21/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit

class THAdapter : CLAdapter {
    var isLoading: Bool = true
    var tradeHistory: [String:THistory]?
    var error : String = ""
    var currentFilter : String = "All"
    
    override func registerNib(_ cl: UICollectionView) {
        Utils.registerCLCell(cl, name: CLLoadingCell.typeName)
        Utils.registerCLCell(cl, name: SpaceCell.typeName)
        Utils.registerCLCell(cl, name: TextCell.typeName)
        Utils.registerCLCell(cl, name: THView.typeName)
    }
    
    override func buildModels() {
        clearModels()
        
        if isLoading{
            addModel(CLLoadingCellModel())
            return
        }
        
        if error.isEmpty{
            if (self.tradeHistory?.count ?? 0 > 0){
                for (_,v) in self.tradeHistory!{
//                    if v.is_your_order == 1{
                        addModel(THViewModel(  THViewData(fromTHistory: v)))
//                    }
                }
                
            }else{
                addModel(TextCellModel("No History"))
            }
            
        }else{
            addModel(TextCellModel(error))
        }
        
        
    }
}
