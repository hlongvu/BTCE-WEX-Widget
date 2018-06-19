//
//  OrderBook.swift
//  BTCE Widget
//
//  Created by long on 6/19/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
class OrderBook: Codable {
    var asks : [[Double]] = []
    var bids: [[Double]] = []
}
