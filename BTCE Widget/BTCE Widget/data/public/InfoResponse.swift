//
//  InfoResponse.swift
//  BTCE Widget
//
//  Created by Long Vu on 3/15/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
class InfoResponse: Codable{
    var server_time: Date?
    var pairs: [String : PairInfo] = [:]
}
