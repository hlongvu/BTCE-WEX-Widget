//
//  YLColor.swift
//  CoinCap
//
//  Created by Long Vu on 10/12/17.
//  Copyright © 2017 Long. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hexString:String) {
        let hexString:String = hexString.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString as String)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
}



extension UIColor {
    static let  positiveChange = UIColor(hexString:"00c41d")
    static let negativeChange = UIColor(hexString:"df4836")
    static let bgColor = UIColor(hexString:"e0e0e0")
    static let redColor = UIColor(hexString:"FF324D")
    static let chartColor = UIColor(hexString:"3ab3bb")
    static let editColor = UIColor(hexString:"7ED321")
    static let highlightTextColor = #colorLiteral(red: 0.2588235294, green: 0.5450980392, blue: 0.7921568627, alpha: 1)
    static let marqueeColor = #colorLiteral(red: 0.9764705882, green: 0.7294117647, blue: 0.07450980392, alpha: 1)
}
