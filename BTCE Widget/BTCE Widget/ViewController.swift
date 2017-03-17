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
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var priceList = Dictionary<String, Pair>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.\
         tableView.register(UINib(nibName: PAIR_CELL_ID, bundle: nil), forCellReuseIdentifier: PAIR_CELL_ID)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updatePrices()
    }
    
    func updatePrices(){
        
        ApiHelper.getTickerPair2(pair:Currency.getAllCodes(), completion: {
            (response: DataResponse<String>) in
            let rs = response.result.value
//            print (rs)
            let dict : Dictionary<String, Pair>? = Mapper<Pair>().mapDictionary(JSONString: rs!)
            self.priceList = dict!
            self.tableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Currency.getMyCodesCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PAIR_CELL_ID, for: indexPath) as! PairCell
        cell.setPairCode(Currency.toMyCodeTitle(indexPath.row))
        let pair = self.priceList[Currency.getMyCode(indexPath.row)]
        if (pair != nil){
            cell.setPair(pair!)
        }
        return cell
    }
    
}

