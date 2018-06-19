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
        let nonce =  (value == 0) ? 1 : value
        UserDefaults.standard.set(nonce + 1, forKey: Constants.KEY_SAVE_NONCE)
        return nonce
    }
    
    static func getTInfo(){
        let URL = "https://wex.nz/tapi"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let n = getNonce()
        
        let parameters: Parameters = [
            "method":"getInfo",
            "nonce":n
        ]
        
        //let paramString = "nonce=\(n)&method=getInfo"
        var p :[String] = []
        for (k, v) in parameters{
            p.append(k + "=" + String(describing: v))
        }
        let paramString = p.joined(separator: "&")
        
        let key = WexKey.getSaved()
        let headers = [
            "Key": key!.apiKey,
            "Sign": key!.signData(data: paramString),
            "Content-Type":"application/x-www-form-urlencoded"
        ]
        print(paramString)
        print(headers)
        
        Alamofire.request(URL, method: .post, parameters: parameters, encoding:  JSONEncoding.default, headers: headers).responseDecodableObject(decoder: decoder){
            (response: DataResponse<TInfoResponse>) in
            
            print(response.value?.success)
            print(response.value?.error)
        }
        
        
        
    }
}
    
