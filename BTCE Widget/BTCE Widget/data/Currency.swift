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
        static let allCodes = ["btc_usd","btc_rur","btc_eur","ltc_btc","ltc_usd","ltc_rur","ltc_eur","nmc_btc","nmc_usd","nvc_btc","nvc_usd","usd_rur","eur_usd","eur_rur","ppc_btc","ppc_usd","dsh_btc","dsh_usd","dsh_rur","dsh_eur","dsh_ltc","dsh_eth","eth_btc","eth_usd","eth_eur","eth_ltc","eth_rur","usdet_usd","ruret_rur","euret_eur","btcet_btc","ltcet_ltc","ethet_eth","nmcet_nmc","nvcet_nvc","ppcet_ppc","dshet_dsh","bchet_bch","bch_usd","bch_btc"]
        
        static let CODES_KEY = "CODES"
        static let WIDGET_KEY = "WIDGET_CODES"
        
        static let CODES_ALL = "CODES_ALL"
        
    }

    class func getAllCodes() -> [String] {
        return UserDefaults(suiteName:APPGROUP)?.object(forKey: Codes.CODES_ALL) as? [String] ?? Codes.allCodes
    }
    
    class func getCodeArrayByKey(_ key:String) -> [String]{
        return  UserDefaults(suiteName:APPGROUP)?.object(forKey: key) as? [String] ?? ["btc_usd", "eth_usd"]
    }
    
    class func setCodeArrayByKey(key:String, codes:[String]){
        UserDefaults(suiteName:APPGROUP)?.setValue(codes, forKey: key)
    }
    
    class func saveAllCodesFromWeb(allCodes: [String]){
        UserDefaults(suiteName:APPGROUP)?.setValue(allCodes, forKey: Codes.CODES_ALL)
    }
}
