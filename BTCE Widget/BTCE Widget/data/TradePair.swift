//
//  TradePair.swift
//  YawzaBot
//
//  Created by Maxim Shmotin on 20/12/14.
//  Copyright (c) 2014 Planemo. All rights reserved.
//

import UIKit

public class TradePair {
    ///Codes like "btc_usd", "usd_rur" e.t.c
    public var code: String
//    let origin = CGPointZero
    init(code: String){
        self.code = code
    }
}

extension TradePair{
    func askCurrencyTitle() -> String {
        return self.code[0...2]
    }
    func bidCurrencyTitle() -> String {
            return self.code[4...6]
    }
}
