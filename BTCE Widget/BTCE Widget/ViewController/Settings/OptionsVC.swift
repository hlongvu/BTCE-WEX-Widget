//
//  OptionsVC.swift
//  BTCE Widget
//
//  Created by Long Vu on 3/20/17.
//  Copyright © 2017 Long Vu. All rights reserved.
//

import Foundation
import UIKit

class OptionsVC: UITableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChooseTradePair" {
            if let cv = segue.destination as? ChooseTradePairVC {
                cv.type = Currency.Codes.CODES_KEY
            }
        }
        
        if segue.identifier == "ChooseWidget" {
            if let cv = segue.destination as? ChooseTradePairVC {
                cv.type = Currency.Codes.WIDGET_KEY
            }
        }
        
    }
}
