//
//  ApiHelper.swift
//  BTCE Widget
//
//  Created by Long Vu on 3/16/17.
//  Copyright © 2017 Long Vu. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class ApiHelper{
    static let API_HOST = "https://btc-e.com/api/3"
    
    static func getTickerPair(pair:String, completion: @escaping (DataResponse<TickerResponse>) -> Void){
        let URL = API_HOST + "/ticker/" + pair;
        print(URL)
        Alamofire.request(URL).responseObject(completionHandler: completion)
    }
    
    static func getTickerPair2(pair:String, completion: @escaping (DataResponse<String>) -> Void){
        let URL = API_HOST + "/ticker/" + pair;
        Alamofire.request(URL).responseString(completionHandler: completion)
    }
    
}
