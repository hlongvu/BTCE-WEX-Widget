//
//  TradeHistoryVC.swift
//  BTCE Widget
//
//  Created by long on 6/21/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
import RSSelectionMenu

class TradeHistoryVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var adapter:THAdapter?
    var btnFilter : UIBarButtonItem?
    var currentFilter : String = "All"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter = THAdapter()
        adapter?.isLoading = true
        adapter?.setUp(self.collectionView)
        
        TApiHelper.getTradeHistory(self.currentFilter){
            result in
                self.adapter?.isLoading = false
                self.adapter?.error = result?.error ?? ""
                self.adapter?.tradeHistory = result?.result
                self.adapter?.reBuildModelsAndReloadTable()
        }                
        
        addLabelFilter()
        
    }
    
    func addLabelFilter(){
        btnFilter = UIBarButtonItem(title: "[All]", style: .done, target: self, action: #selector(filterClick) )
            self.navigationItem.rightBarButtonItem = btnFilter
       
    }
    
    func updateFilter(){
        btnFilter?.title = "[" + self.currentFilter + "]"
        adapter?.currentFilter = self.currentFilter
        adapter?.isLoading = true
        adapter?.reBuildModelsAndReloadTable()
        
        TApiHelper.getTradeHistory(self.currentFilter){
            result in
            self.adapter?.isLoading = false
            self.adapter?.error = result?.error ?? ""
            self.adapter?.tradeHistory = result?.result
            self.adapter?.reBuildModelsAndReloadTable()
        }
    }
    
    
    @objc func filterClick(){
        var datas :[String] = ["All"]
        datas.append(contentsOf: Currency.getAllCodes().map{ $0.toTradePairTitle()})
        

        let selectionMenu =  RSSelectionMenu(dataSource: datas) { (cell, object, indexPath) in
            cell.textLabel?.text = object
            cell.tintColor = .orange
        }
        
        selectionMenu.setSelectedItems(items: [self.currentFilter]) { (text, isSelected, selectedItems) in
            if selectedItems.count > 0{
                self.currentFilter = selectedItems[0]
                self.updateFilter()
            }
        }
        
//        selectionMenu.setNavigationBar(title: "Filter")

        
        selectionMenu.show(style: .Push, from: self)
    }
    
    
    
    
}

