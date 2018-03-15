//
//  Utils.swift
//  BTCE Widget
//
//  Created by Long Vu on 3/15/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
class Utils {
    static func registerCell(_ tableView:UITableView ,name:String){
        let cellNib = UINib.init(nibName: name, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: name)
    }
}
