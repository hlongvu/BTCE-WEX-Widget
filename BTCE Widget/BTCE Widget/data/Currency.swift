//
//  Currency.swift
//  YawzaBot
//
//  Created by Maxim Shmotin on 20/12/14.
//  Copyright (c) 2014 Planemo. All rights reserved.
//

import UIKit

class Currency: NSObject {
    private enum Codes {
        static let allCodes = ["btc_usd", "usd_rur", "btc_rur", "btc_eur", "btc_cnh", "btc_gbp", "ltc_btc", "ltc_usd", "ltc_rur", "ltc_eur", "ltc_cnh", "ltc_gbp", "nmc_btc", "nmc_usd", "nvc_btc", "nvc_usd", "eur_usd", "eur_rur", "usd_cnh", "gbp_usd", "ppc_btc", "ppc_usd"]
        static let CODES_KEY = "CODES"
        static var myCodes: [String] = UserDefaults.standard.object(forKey: CODES_KEY) as? [String] ?? ["btc_usd", "usd_rur"] {
            didSet{
                UserDefaults.standard.setValue(myCodes, forKey: CODES_KEY)
            }
        }
    }
    class func toCodeTitle(index: Int) -> String{
//        return Codes.allCodes[index].stringByReplacingOccurrencesOfString("_", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil).uppercaseString
        return Codes.allCodes[index].replacingOccurrences(of: "_", with: "", options: .literal, range: nil).uppercased()
    }
    class func toMyCodeTitle(index: Int) -> String{
//        return Codes.myCodes[index].stringByReplacingOccurrencesOfString("_", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil).uppercaseString
        return Codes.allCodes[index].replacingOccurrences(of: "_", with: "", options: .literal, range: nil).uppercased()
    }

    /// Default value -> first code
    class func getCode(index: Int = 0) -> String {
        return Codes.allCodes[index]
    }
    class func getMyCode(index: Int = 0) -> String {
        return Codes.myCodes[index]
    }
    class func getCodesCount() -> Int{
        return Codes.allCodes.count
    }
    class func appendAtIndex(values: [String]){
        Codes.myCodes += values
    }
    class func removeAtIndex(index: Int){
        Codes.myCodes.remove(at: index)
    }
    class func getMyCodesCount() -> Int{
        return Codes.myCodes.count
    }
    class func containsAllCodes(index: Int) -> Bool{
        return Codes.myCodes.contains(Codes.allCodes[index])
    }
}
