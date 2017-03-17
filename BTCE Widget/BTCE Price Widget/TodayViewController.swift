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
    
    let WIDGET_CELL = "WidgetCell"
    var priceList = Dictionary<String, Pair>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        let height = Currency.getWidgetCodesCount() * 50
        print(height)
        self.preferredContentSize = CGSize(width:self.view.frame.size.width, height: CGFloat(height))
        
        if #available(iOSApplicationExtension 10.0, *) {
            self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        }
        
    }
    
    
    @available(iOS 10.0, *)
    @available(iOSApplicationExtension 10.0, *)
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .expanded {
            let height = Currency.getWidgetCodesCount() * 50
            self.preferredContentSize = CGSize(width: self.view.frame.size.width, height: CGFloat(height))
        }else if activeDisplayMode == .compact{
            self.preferredContentSize = CGSize(width: maxSize.width, height: 110)
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
//        print(Currency.getAllWidgetCodesString())
        ApiHelper.getTickerPair2(pair:Currency.getAllWidgetCodesString(), completion: {
            (response: DataResponse<String>) in
            let rs = response.result.value
            if (rs != nil){
                let dict : Dictionary<String, Pair>? = Mapper<Pair>().mapDictionary(JSONString: rs!)
//                print(dict)
                if (dict != nil){
                    self.priceList = dict!
                    self.tableView.reloadData()
                }
            }
        })

        
    }
}

extension TodayViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Currency.getWidgetCodesCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WIDGET_CELL, for: indexPath) as! WidgetCell
        
        cell.setPairCode(Currency.toWidgetCodeTitle(indexPath.row))
        
        let pair = self.priceList[Currency.getWidgetCode(indexPath.row)]
        if (pair != nil){
            cell.setPair(pair!)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
