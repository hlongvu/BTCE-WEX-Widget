//
//  ActiveOrdersResponse.swift
//  BTCE Widget
//
//  Created by long on 6/21/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation

class AOrder:Codable{
    var pair:String = ""
    var type:String = ""
    var amount:Double = 0
    var rate:Double = 0
    var timestamp_created: Double = 0
}

class ActiveOrdersResponse : Codable {
    var success: Int?
    var error:String?
    var result:[String:AOrder]?
    
    private enum CodingKeys: String, CodingKey {
        case success
        case error
        case result = "return"
    }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try values.decode(Int?.self, forKey: .success)
       
        if values.contains(.result){
            self.result = try values.decode([String:AOrder]?.self, forKey: .result)
        }
        
        if values.contains(.error){
            self.error = try values.decode(String?.self, forKey: .error)
        }
    }
}
