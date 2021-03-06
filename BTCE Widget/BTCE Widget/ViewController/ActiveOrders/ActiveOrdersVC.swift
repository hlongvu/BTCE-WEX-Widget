//
//  ActiveOrdersVC.swift
//  BTCE Widget
//
//  Created by long on 6/21/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
class ActiveOrdersVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var adapter: AOAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter = AOAdapter()
        adapter?.isLoading = true
        adapter?.setUp(self.collectionView)
        
        
        TApiHelper.getActiveOrders(){
            result in
                self.adapter?.isLoading = false
                self.adapter?.error = result?.error ?? ""
                self.adapter?.activeOrders = result?.result
                self.adapter?.reBuildModelsAndReloadTable()
        }
    }   
    
}
