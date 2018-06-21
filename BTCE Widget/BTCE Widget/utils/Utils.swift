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
    
    static func registerCLCell(_ collectionView :UICollectionView ,name:String){
        let cellNib = UINib.init(nibName: name, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: name)
    }
    
    static func calculateInitialNonce()->Int{
        let dataFormat = DateFormatter()
        dataFormat.dateFormat = "yyyy-MM-dd HH:mm:ss xxxx"
        let timeStamp = NSDate().timeIntervalSince(dataFormat.date(from: "2012-04-18 00:00:03 +0600")!)
        let currentNonce = Int(timeStamp)
        return currentNonce
    }
}

extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
        //RESOLVED CRASH HERE
    }
    
    init(milliseconds:Double) {
        self = Date(timeIntervalSince1970: milliseconds )
    }
}
