//
//  TApiHelper.swift
//  BTCE Widget
//
//  Created by long on 6/19/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire

class TApiHelper{
    
    
    static func getNonce() -> Int{
        let value = UserDefaults.standard.integer(forKey: Constants.KEY_SAVE_NONCE)
        let nonce =  (value == 0) ? Utils.calculateInitialNonce() : value
        UserDefaults.standard.set(nonce + 1, forKey: Constants.KEY_SAVE_NONCE)
        return nonce
    }
    
    
    static func getRequest(_ params: [String:String]) -> URLRequest?{
        let HOSTURL = "https://wex.nz/tapi"
      
        var newDict :[String:String] = params
        let n = getNonce()
        newDict["nonce"] = String(describing: n)
        
        var p :[String] = []
        for (k, v) in newDict{
            p.append(k + "=" + String(describing: v))
        }
        let paramString = p.joined(separator: "&")
        
        let key = WexKey.getSaved()
        if (key == nil){
            return nil
        }
        
        var request = URLRequest(url: URL(string: HOSTURL)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(key!.apiKey, forHTTPHeaderField: "Key")
        request.setValue(key!.signData(data: paramString), forHTTPHeaderField: "Sign")
        
        let data = paramString.data(using: .utf8)!
        
        request.httpBody = data
        
        return request
        
    }
    
    static func getTInfo(callback: @escaping (TInfoResponse?) -> Void){
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let parameters : [String:String] = [
            "method":"getInfo"
        ]
        
        let rq = getRequest(parameters)
        if (rq != nil){
            Alamofire.request(rq!)
                .responseDecodableObject(decoder: decoder){
                    (response: DataResponse<TInfoResponse>) in
                    let res = response.value
                    callback(res)
            }
        }
    }
    
    static func getActiveOrders(callback : @escaping (ActiveOrdersResponse?) -> Void){
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let parameters : [String:String] = [
            "method":"ActiveOrders"
        ]
        
        let rq = getRequest(parameters)
        if (rq != nil){
            Alamofire.request(rq!)
                .responseDecodableObject(decoder: decoder){
                    (response: DataResponse<ActiveOrdersResponse>) in
                    let res = response.value
//                    print(res?.success)
//                    print(res?.error)
//                    print(res?.result)
                    callback(res)
            }
        }
    }
    
    
    static func getTradeHistory(_ filter:String, callback : @escaping (TradeHistoryResponse?) -> Void){
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        var parameters : [String:String] = [
            "method":"TradeHistory"
        ]
        
        if !filter.isEmpty && filter != "All"{
            parameters["pair"] = filter.toTradePairCode()
        }
        
        
        let rq = getRequest(parameters)
        if (rq != nil){
            Alamofire.request(rq!)
                .responseDecodableObject(decoder: decoder){
                    (response: DataResponse<TradeHistoryResponse>) in
                    let res = response.value                 
                    callback(res)
            }
        }
    }
    
    
}
    
