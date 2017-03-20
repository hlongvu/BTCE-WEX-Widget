//
//  Currency.swift
//  YawzaBot
//
//  Created by Maxim Shmotin on 20/12/14.
//  Copyright (c) 2014 Planemo. All rights reserved.
//

import UIKit

class Currency: NSObject {
    static let APPGROUP = "group.com.sun.btce"
    enum Codes {
        static let allCodes = ["btc_usd","btc_rur","btc_eur","ltc_btc","ltc_usd","ltc_rur","ltc_eur","nmc_btc","nmc_usd","nvc_btc","nvc_usd","usd_rur","eur_usd","eur_rur","ppc_btc","ppc_usd","dsh_btc","dsh_usd","dsh_rur","dsh_eur","dsh_ltc","dsh_eth","eth_btc","eth_usd","eth_eur","eth_ltc","eth_rur"]
        
        static let CODES_KEY = "CODES"
        static let WIDGET_KEY = "WIDGET_CODES"
        
        /*
        static var myCodes: [String] = UserDefaults.standard.object(forKey: CODES_KEY) as? [String] ?? ["btc_usd", "eth_usd"] {
            didSet{
                UserDefaults.standard.setValue(myCodes, forKey: CODES_KEY)
            }
        }
        
        
        static var widgetCodes: [String] = UserDefaults.standard.object(forKey: WIDGET_KEY) as? [String] ?? ["btc_usd", "eth_usd","dsh_usd"] {
            didSet{
                UserDefaults.standard.setValue(myCodes, forKey: WIDGET_KEY)
            }
        }
         */
    }
    
    class func toCodeTitle(_ index: Int) -> String{
        return Codes.allCodes[index].replacingOccurrences(of: "_", with: "/", options: .literal, range: nil).uppercased()
    }

    /// Default value -> first code
    class func getAllCodeAt(_ index: Int = 0) -> String {
        return Codes.allCodes[index]
    }
  
    class func getAllCodesCount() -> Int{
        return Codes.allCodes.count
    }
    
    class func getAllCodes() -> [String]{
        return Codes.allCodes
    }
    
    class func getCodeArrayByKey(_ key:String) -> [String]{
        return  UserDefaults(suiteName:APPGROUP)?.object(forKey: key) as? [String] ?? ["btc_usd", "eth_usd"]
    }
    
    class func setCodeArrayByKey(key:String, codes:[String]){
        UserDefaults(suiteName:APPGROUP)?.setValue(codes, forKey: key)
    }
    
    
    class func getCodeTitle(key:String, index: Int) -> String{
        return getCodeArrayByKey(key)[index].replacingOccurrences(of: "_", with: "/", options: .literal, range: nil).uppercased()
    }
    
    class func getCodeByKey(key:String, index: Int = 0) -> String {
        return getCodeArrayByKey(key)[index]
    }
    
    class func getCodesCountByKey(_ key:String) -> Int{
        return getCodeArrayByKey(key).count
    }
    
    class func getCodesStringByKey(_ key:String) -> String{
        return getCodeArrayByKey(key).joined(separator: "-")
    }
    
}
