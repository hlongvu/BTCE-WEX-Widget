//
//  TodayViewController.swift
//  BTCE Price Widget
//
//  Created by Long Vu on 3/17/17.
//  Copyright © 2017 Long Vu. All rights reserved.
//

import UIKit
import NotificationCenter
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet weak var tableView: UITableView!
    
    let WIDGET_KEY = Currency.Codes.WIDGET_KEY
    
    let WIDGET_CELL = "WidgetCell"
    let CELL_HEIGHT = 75
    var homeAdapter:PairListAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadHeight()
        if #available(iOSApplicationExtension 10.0, *) {
            self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        }
        
        homeAdapter = PairListAdapter()
        homeAdapter.codeKey = WIDGET_KEY
        homeAdapter.setUp(self.tableView)
    }
    
    func reloadHeight(){
        let height = Currency.getCodeArrayByKey(WIDGET_KEY).count * CELL_HEIGHT
        self.preferredContentSize = CGSize(width:self.view.frame.size.width, height: CGFloat(height))
    }
    
    @available(iOS 10.0, *)
    @available(iOSApplicationExtension 10.0, *)
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .expanded {
            reloadHeight()
        }else if activeDisplayMode == .compact{
            self.preferredContentSize = CGSize(width: maxSize.width, height: CGFloat(CELL_HEIGHT))
        }
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        loadPrice()
        completionHandler(NCUpdateResult.newData)
    }
    
    
    func loadPrice(){
        let pairs = Currency.getCodeArrayByKey(WIDGET_KEY).joined(separator: "-")
//        ApiHelper.getTickerPair2(pair:pairs, completion: {
//            (response: DataResponse<String>) in
//            let rs = response.result.value
//            if (rs != nil){
//                //let dict : Dictionary<String, Pair>? = Mapper<Pair>().mapDictionary(JSONString: rs!)
//
//                let jsonData = rs!.data(using: .utf8)!
//                let decoder = JSONDecoder()
//                let dict =  try? decoder.decode([String:Pair].self, from: jsonData)
//
//                if (dict != nil){
////                    self.priceList = dict!
//                    //self.tableView.reloadData()
//                    self.homeAdapter.priceList = dict!
//                    self.homeAdapter.reBuildModelsAndReloadTable()
//                    self.reloadHeight()
//                }
//            }
//        })
        
        ApiHelper.getTickers(pairs: pairs){
            dict in
            self.homeAdapter.priceList = dict!
            self.homeAdapter.reBuildModelsAndReloadTable()
             self.reloadHeight()
        }

        
    }
}
