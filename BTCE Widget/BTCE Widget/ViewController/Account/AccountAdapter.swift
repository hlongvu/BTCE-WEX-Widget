//
//  AccountController.swift
//  BTCE Widget
//
//  Created by long on 6/19/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
class AccountAdapter: SGAdapter {
   
    override func registerNib(tableView:UITableView) {
        Utils.registerCell(tableView, name: NoAPIKeyCell.typeName)
        Utils.registerCell(tableView, name: LoadingCell.typeName)
    }
    
    override func buildModels() {
        clearModels()
        addModel(NoAPIKeyCellModel())
    }
}
