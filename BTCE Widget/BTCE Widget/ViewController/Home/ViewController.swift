//
//  ViewController.swift
//  BTCE Widget
//
//  Created by Long Vu on 3/16/17.
//  Copyright © 2017 Long Vu. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

class ViewController: UIViewController {
    
    let CODE_KEY = Currency.Codes.CODES_KEY
    
    private var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    var homeAdapter:PairListAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(updatePrices), for: UIControlEvents.valueChanged)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        
        homeAdapter = PairListAdapter()
        homeAdapter.codeKey = CODE_KEY
        homeAdapter.setUp(self.tableView)
        updatePrices()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @objc func updatePrices(){
        let pairs = Currency.getCodeArrayByKey(CODE_KEY).joined(separator: "-")
        ApiHelper.getTickers(pairs: pairs){
            dict in
            self.homeAdapter.priceList = dict!
            self.homeAdapter.reBuildModelsAndReloadTable()
            self.refreshControl?.endRefreshing()
        }
        
    }
}

