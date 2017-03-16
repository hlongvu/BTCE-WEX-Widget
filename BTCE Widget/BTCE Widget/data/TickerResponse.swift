//
//  TickerResponse.swift
//  BTCE Widget
//
//  Created by Long Vu on 3/16/17.
//  Copyright © 2017 Long Vu. All rights reserved.
//

import Foundation
import ObjectMapper

class TickerResponse: Mappable{
    var btc_usd: Pair?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        btc_usd <- map["btc_usd"]
    }
    
}
