//
//  String+Extensions.swift
//  YawzaBot
//
//  Created by Maxim Shmotin on 04/04/15.
//  Copyright (c) 2015 Planemo. All rights reserved.
//
import Foundation

extension String{
    
//    var length : Int {
//        return self.count
//    }
    
//    subscript (r: CountableClosedRange<Int>) -> String {
//        let start = characters.index(startIndex, offsetBy: r.lowerBound)
//        let end = characters.index(start, offsetBy: r.upperBound - r.lowerBound)
//        return String(self[(start ... end)])
//    }
//
//    func containSpecialCharacters() -> Bool{
//        let regex = try! NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: [])
//        return regex.firstMatch(in: self, options:[],
//            range: NSMakeRange(0, utf16.count)) != nil
//    }
    
    func toTradePairTitle() -> String {
        return self.replacingOccurrences(of: "_", with: "/", options: .literal, range: nil).uppercased()
    }
    
    func toTradePairCode() -> String {
        return self.replacingOccurrences(of: "/", with: "_", options: .literal, range: nil).lowercased()
    }
}
