//
//  WexKey.swift
//  BTCE Widget
//
//  Created by long on 6/19/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
class WexKey: Codable {
    var apiKey: String = ""
    var secretKey: String = ""
    
    init(_ a :String ,_ s : String) {
        self.apiKey = a
        self.secretKey = s
    }
    
    func isValid() -> Bool{
        if (apiKey.isEmpty || secretKey.isEmpty){
            return false
        }else{
            return true
        }
    }
    
    func save(){
        if self.isValid(){
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(self) {
                UserDefaults.standard.set(encoded, forKey: Constants.KEY_SAVE_WEXKEY)
            }
        }
    }
    
    static func getSaved() -> WexKey? {
        let decoder = JSONDecoder()
        if let keyData = UserDefaults.standard.data(forKey: Constants.KEY_SAVE_WEXKEY),
            let wexKey = try? decoder.decode(WexKey.self, from: keyData) {
            return wexKey
        }
        return nil
    }
}
