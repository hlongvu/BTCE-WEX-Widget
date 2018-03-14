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
    
    let PAIR_CELL_ID = "PairCell"
    let CODE_KEY = Currency.Codes.CODES_KEY
    
    private var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    var priceList = Dictionary<String, Pair>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.\
        
        let tableViewController = UITableViewController()
        tableViewController.tableView = self.tableView
        
        self.refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(updatePrices), for: UIControlEvents.valueChanged)
//        refreshControl?.backgroundColor = UIColor.black
//        refreshControl?.tintColor = UIColor.white
        
        tableViewController.refreshControl = self.refreshControl                
        tableView.register(UINib(nibName: PAIR_CELL_ID, bundle: nil), forCellReuseIdentifier: PAIR_CELL_ID)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updatePrices()
    }
    
    @objc func updatePrices(){
//        print(Currency.getCodesStringByKey(CODE_KEY))
        let pairs = Currency.getCodeArrayByKey(CODE_KEY).joined(separator: "-")
        ApiHelper.getTickerPair2(pair:pairs, completion: {
            (response: DataResponse<String>) in
            let rs = response.result.value
            if (rs != nil){
                let dict : Dictionary<String, Pair>? = Mapper<Pair>().mapDictionary(JSONString: rs!)
                if (dict != nil){
                    self.priceList = dict!
                    self.tableView.reloadData()
                }
            }
            self.refreshControl?.endRefreshing()
        })
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return Currency.getCodesCountByKey(CODE_KEY)
         return Currency.getCodeArrayByKey(CODE_KEY).count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PAIR_CELL_ID, for: indexPath) as! PairCell
        //cell.setPairCode(Currency.getCodeTitle(key: CODE_KEY, index: indexPath.row))
        
        cell.setPairCode(Currency.getCodeArrayByKey(CODE_KEY)[indexPath.row].toTradePairTitle())
        
        let pair = self.priceList[Currency.getCodeArrayByKey(CODE_KEY)[indexPath.row]]
        cell.setPair(pair)
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

