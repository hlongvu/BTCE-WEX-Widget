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
    var server_time : Double = 1342123547
}

class TInfoResponse: Codable {
    var success: Int?
    var error:String?
    var result:TInfo?
}
