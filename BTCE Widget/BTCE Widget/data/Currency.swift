//
//  Currency.swift
//  YawzaBot
//
//  Created by Maxim Shmotin on 20/12/14.
//  Copyright (c) 2014 Planemo. All rights reserved.
//

import UIKit

class Currency: NSObject {
    
    enum Codes {
        static let allCodes = ["btc_usd","btc_rur","btc_eur","ltc_btc","ltc_usd","ltc_rur","ltc_eur","nmc_btc","nmc_usd","nvc_btc","nvc_usd","usd_rur","eur_usd","eur_rur","ppc_btc","ppc_usd","dsh_btc","dsh_usd","dsh_rur","dsh_eur","dsh_ltc","dsh_eth","eth_btc","eth_usd","eth_eur","eth_ltc","eth_rur"]
        
        static let CODES_KEY = "CODES"
        static let WIDGET_KEY = "CODES"
        
        
        static var myCodes: [String] = UserDefaults.standard.object(forKey: CODES_KEY) as? [String] ?? ["btc_usd", "eth_usd"] {
            didSet{
                UserDefaults.standard.setValue(myCodes, forKey: CODES_KEY)
            }
        }
    }
    
    class func toCodeTitle(_ index: Int) -> String{
        return Codes.allCodes[index].replacingOccurrences(of: "_", with: "/", options: .literal, range: nil).uppercased()
    }

    /// Default value -> first code
    class func getCode(_ index: Int = 0) -> String {
        return Codes.allCodes[index]
    }
  
    class func getCodesCount() -> Int{
        return Codes.allCodes.count
    }
    
    class func getAllCodes() -> [String]{
        return Codes.allCodes
    }
}


extension Currency{
    
    class func toMyCodeTitle(_ index: Int) -> String{
        return Codes.myCodes[index].replacingOccurrences(of: "_", with: "/", options: .literal, range: nil).uppercased()
    }
    
    class func getMyCode(_ index: Int = 0) -> String {
        return Codes.myCodes[index]
    }
    
    class func getMyCodesCount() -> Int{
        return Codes.myCodes.count
    }
    
    class func getAllMyCodesString() -> String{
        return Codes.myCodes.joined(separator: "-")
    }
    
    class func getAllMyCodesArray() -> [String]{
        return Codes.myCodes
    }

    class func setMyCodes(_ codes:[String]){
        Codes.myCodes = codes
    }

}
