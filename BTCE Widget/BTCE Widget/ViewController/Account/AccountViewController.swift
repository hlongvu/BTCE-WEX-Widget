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

class AccountViewController: UIViewController {
    var adapter : AccountAdapter?
    var tInfo: TInfo?
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter = AccountAdapter()
        loadDataFromKey()
        adapter?.setUp(self.collectionView)
    }
    
    func loadDataFromKey(){
        let wexKey = WexKey.getSaved()
        adapter?.wexKey = wexKey
        if wexKey != nil{
            print("have key")
         //   print(wexKey?.apiKey)
         //   print(wexKey?.secretKey)
            adapter?.isLoading  = true
            
            TApiHelper.getTInfo(){
                res in
                    self.adapter?.isLoading  = false
                    self.tInfo = res?.result
                    self.updateAdapter()
                
            }
        }else{
            adapter?.isLoading  = false
        }
    }
    
    func updateAdapter(){
        print("Update Adapter")
        adapter?.tInfo = self.tInfo
         adapter?.isLoading  = false
        adapter?.reBuildModelsAndReloadTable()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SwiftEventBus.onMainThread(self, name:Constants.KEY_CLICK_SAVE_API) { result in
            let key = result?.object as? WexKey
            if key != nil {
                print("save")
                key?.save()
                self.loadDataFromKey()
            }
        }
        
        SwiftEventBus.onMainThread(self, name:Constants.ACTION_VIEW_ACTIVE_ORDERS) { result in
            print("view active orders")
            Router.openActiveOrders(fromVC: self)
        }
        
        SwiftEventBus.onMainThread(self, name:Constants.ACTION_VIEW_TRADE_HISTORY) { result in
            print("view trade history")
            Router.openTradeHistory(fromVC: self)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SwiftEventBus.unregister(self)
    }
    
    @IBAction func menuClick(_ sender: Any) {
        
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Remove API Key", style: .destructive, handler: {
            (alert: UIAlertAction!) -> Void in
            self.deleteAPIKey()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func deleteAPIKey(){
        let alert = UIAlertController(title: "Remove", message: "Confirm Remove API Key", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Remove", style: UIAlertActionStyle.default, handler: {
                action in
                    print("Delete")
                    WexKey.removeKeys()
                    self.adapter?.wexKey = nil
                    self.adapter?.reBuildModelsAndReloadTable()
            
            }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

}
