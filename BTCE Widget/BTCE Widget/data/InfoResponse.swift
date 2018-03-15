//
//  InfoResponse.swift
//  BTCE Widget
//
//  Created by Long Vu on 3/15/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import ObjectMapper

class InfoResponse: Codable{
    var server_time: Int64?
     var pairs: [String : PairInfo] = [:]
}
