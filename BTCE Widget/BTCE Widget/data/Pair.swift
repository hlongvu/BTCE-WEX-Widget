//
//  Pair.swift
//  BTCE Widget
//
//  Created by Long Vu on 3/16/17.
//  Copyright © 2017 Long Vu. All rights reserved.
//

import Foundation
import ObjectMapper

class Pair : Mappable {    
//    var code:String = ""
    
    var high: Double?
    var low: Double?
    var avg: Double?
    var vol: Double?
    var vol_cur: Double?
    var last: Double?
    var buy: Double?
    var sell: Double?
    var updated: Date?
    
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        high <- map["high"]
        low <- map["low"]
        avg <- map["avg"]
        vol <- map["vol"]
        
        vol_cur <- map["vol_cur"]
        last <- map["last"]
        buy <- map["buy"]
        sell <- map["sell"]
        updated <- map["updated"]
    }
    
}
