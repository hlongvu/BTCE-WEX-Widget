//
//  TradeHistoryVC.swift
//  BTCE Widget
//
//  Created by long on 6/21/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
class TradeHistoryVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var adapter:THAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter = THAdapter()
        adapter?.isLoading = true
        adapter?.setUp(self.collectionView)
        
        TApiHelper.getTradeHistory(){
            result in
                self.adapter?.isLoading = false
                self.adapter?.error = result?.error ?? ""
                self.adapter?.tradeHistory = result?.result
                self.adapter?.reBuildModelsAndReloadTable()
        }                
        
    }
}
