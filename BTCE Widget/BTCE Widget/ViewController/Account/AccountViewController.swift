//
//  AccountViewController.swift
//  BTCE Widget
//
//  Created by long on 6/19/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
import SwiftEventBus

class AccountViewController: UITableViewController {
    var adapter : AccountAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView() 
        adapter = AccountAdapter()
        adapter?.setUp(self.tableView)
        
        let wexKey = WexKey.getSaved()
        if wexKey != nil{
            print("have key")
        }        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SwiftEventBus.onMainThread(self, name:Constants.KEY_CLICK_SAVE_API) { result in
            let key = result?.object as? WexKey
            if key != nil {
                print("save")
                key?.save()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SwiftEventBus.unregister(self)
    }
}
