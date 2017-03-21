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
    var priceList = Dictionary<String, Pair>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        reloadHeight()
        if #available(iOSApplicationExtension 10.0, *) {
            self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        }
    }
    
    func reloadHeight(){
        let height = Currency.getCodesCountByKey(WIDGET_KEY) * CELL_HEIGHT
//        print(height)
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
//        print(Currency.getCodesStringByKey(WIDGET_KEY))
        ApiHelper.getTickerPair2(pair:Currency.getCodesStringByKey(WIDGET_KEY), completion: {
            (response: DataResponse<String>) in
            let rs = response.result.value
            if (rs != nil){
                let dict : Dictionary<String, Pair>? = Mapper<Pair>().mapDictionary(JSONString: rs!)
//                print(dict)
                if (dict != nil){
                    self.priceList = dict!
                    self.tableView.reloadData()
                    self.reloadHeight()
                }
            }
        })

        
    }
}

extension TodayViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Currency.getCodesCountByKey(WIDGET_KEY)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(CELL_HEIGHT)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WIDGET_CELL, for: indexPath) as! WidgetCell
        
        cell.setPairCode(Currency.getCodeTitle(key: WIDGET_KEY, index: indexPath.row))
        
        let pair = self.priceList[Currency.getCodeByKey(key: WIDGET_KEY, index: indexPath.row)]
        cell.setPair(pair)       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
