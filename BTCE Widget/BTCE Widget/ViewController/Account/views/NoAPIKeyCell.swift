//
//  NoAPIKeyCell.swift
//  BTCE Widget
//
//  Created by long on 6/19/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
import SwiftEventBus

class NoAPIKeyCell: UITableViewCell {
    @IBOutlet weak var apiText: UITextField!
    @IBOutlet weak var secretText: UITextField!
    
    @IBAction func saveClick(_ sender: Any) {
        print("Click save")
        let apiKey = apiText.text ?? ""
        let secretKey = secretText.text ?? ""
        let wexKey = WexKey(apiKey, secretKey)
        SwiftEventBus.post(Constants.KEY_CLICK_SAVE_API, sender: wexKey)
    }
}


class NoAPIKeyCellModel:SGModel{
    override func getHeight() -> CGFloat {
        return 350
    }
    
    override func nibName() -> String {
        return NoAPIKeyCell.typeName
    }
    
}
