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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.\
        
        
//        ApiHelper.getTickerPair(pair: "btc_usd", completion: {
//            (response: DataResponse<TickerResponse>) in
//                print(response.result.value)
//        })

        
//        Dictionary<String, T: Mappable>
        let string = "{\"btc_usd\":{\"high\":1240,\"low\":1210,\"avg\":1225,\"vol\":11704898.82232,\"vol_cur\":9542.65019,\"last\":1218.94,\"buy\":1218.939,\"sell\":1218.739,\"updated\":1489678289},\"btc_rur\":{\"high\":73198,\"low\":69621,\"avg\":71409.5,\"vol\":21098567.15741,\"vol_cur\":295.95195,\"last\":70032.00001,\"buy\":70497,\"sell\":70024.16198,\"updated\":1489678289}}"
        print(string)
        let dict : Dictionary<String, Pair>? = Mapper<Pair>().mapDictionary(JSONString: string)
        print(dict?["btc_usd"])
        print(dict!["btc_usd"]!.high!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

