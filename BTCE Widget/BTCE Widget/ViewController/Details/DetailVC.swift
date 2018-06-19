//
//  DetailVC.swift
//  BTCE Widget
//
//  Created by Long Vu on 3/15/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class DetailVC: UIViewController {
    var code : String = ""

    var webView: WKWebView!
    
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
//        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = code
        let pair  = code.replacingOccurrences(of: "/", with: "")
        
        let myURL = URL(string:"https://s.tradingview.com/widgetembed/?symbol=WEX%3A\(pair)&interval=15")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
}
