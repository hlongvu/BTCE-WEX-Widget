//
//  AOAdapter.swift
//  BTCE Widget
//
//  Created by long on 6/21/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
class AOAdapter : CLAdapter {
    
    var isLoading: Bool = true
    var activeOrders: [String:AOrder]?
    var error : String = ""
    
    override func registerNib(_ cl: UICollectionView) {
        Utils.registerCLCell(cl, name: CLLoadingCell.typeName)
        Utils.registerCLCell(cl, name: SpaceCell.typeName)
        Utils.registerCLCell(cl, name: TextCell.typeName)
    }
    
    override func buildModels() {
        clearModels()
        
        if isLoading{
            addModel(CLLoadingCellModel())
            return
        }
        
        if error.isEmpty{
            if (self.activeOrders?.count ?? 0 > 0){
//                addModel(TextCellModel("Have Orders"))                
                for (_,v) in self.activeOrders!{
                    addModel(THViewModel(  THViewData(fromAOrder: v)))
                }
                
            }else{
                 addModel(TextCellModel("No Orders"))
            }
            
        }else{
            addModel(TextCellModel(error))
        }
        
        
    }
}
