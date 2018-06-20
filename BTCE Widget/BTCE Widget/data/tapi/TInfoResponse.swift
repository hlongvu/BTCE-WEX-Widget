//
//  TInfoResponse.swift
//  BTCE Widget
//
//  Created by long on 6/19/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
class KeyRight: Codable{
    var info:Int = 0
    var trade: Int = 0
    var withdraw: Int = 0
}
class TInfo : Codable{
    var funds : [String:Double] = [:]
    var rights: KeyRight?
    var transaction_count : Int = 0
    var open_orders :Int = 0
    var server_time : Double = 0
}

class TInfoResponse: Codable {
    var success: Int?
    var error:String?
    var result:TInfo?
    
    private enum CodingKeys: String, CodingKey {
        case success
        case error
        case result = "return"
    }
  
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try values.decode(Int?.self, forKey: .success)
        if values.contains(.result){
            self.result = try values.decode(TInfo?.self, forKey: .result)
        }
        if values.contains(.error){
            self.error = try values.decode(String?.self, forKey: .error)
        }
    }
}
