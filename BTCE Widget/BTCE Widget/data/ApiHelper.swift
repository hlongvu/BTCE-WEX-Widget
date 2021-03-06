//
//  ApiHelper.swift
//  BTCE Widget
//
//  Created by Long Vu on 3/16/17.
//  Copyright © 2017 Long Vu. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire


class ApiHelper{
    static let API_HOST = "https://wex.nz/api/3"
    
    
    private static func getTickerPair2(pair:String, completion: @escaping (DataResponse<String>) -> Void){
        let URL = API_HOST + "/ticker/" + pair +  "?ignore_invalid=1";
        Alamofire.request(URL).responseString(completionHandler: completion)
    }
    
    static func getTickers(pairs:String, completion: @escaping (Dictionary<String, Pair>?) -> Void){
        ApiHelper.getTickerPair2(pair:pairs, completion: {
            (response: DataResponse<String>) in
            let rs = response.result.value
            if (rs != nil){
                let jsonData = rs!.data(using: .utf8)!
                let decoder = JSONDecoder()
                let dict =  try? decoder.decode([String:Pair].self, from: jsonData)
                completion(dict)
            }else{
                completion(nil)
            }
        })
    }
    
    static func getPairInfo(completion: @escaping ([String]) -> Void){
        let URL = API_HOST + "/info"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        Alamofire.request(URL).responseDecodableObject(decoder: decoder){
             (response: DataResponse<InfoResponse>) in
               // print(response.value?.pairs)
            let availablePairs = response.value?.pairs.filter{ ($0.value.hidden ?? 1) == 0 }
            completion ( Array( availablePairs!.keys ) )
        }
    }
    
    static func getDepth(pair:String,limit:Int,  completion: @escaping (OrderBook?) -> Void){
        let URL = API_HOST + "/depth/" + pair + "?limit=" + limit.description
        Alamofire.request(URL).responseString(){
            data in
            let rs = data.result.value
            if (rs != nil){
                let jsonData = rs!.data(using: .utf8)!
                let decoder = JSONDecoder()
                let dict =  try? decoder.decode([String:OrderBook].self, from: jsonData)
                completion(dict?[pair])
            }else{
                completion(nil)
            }
        }
    }
    
  
    
}
