//
//  ChooseTradePairVC.swift
//  BTCE Widget
//
//  Created by Long Vu on 3/17/17.
//  Copyright © 2017 Long Vu. All rights reserved.
//

import Foundation
import UIKit

class ChooseTradePairVC: UIViewController {
    var newCodes = Dictionary<Int, String>()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Currency.appendAtIndex(Array(newCodes.values))
    }
    
}

extension ChooseTradePairVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Currency.getCodesCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paircell", for: indexPath)
        cell.textLabel?.text = Currency.toCodeTitle(indexPath.row)
        
        if (Currency.containsAllCodes(indexPath.row)){
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        if (cell?.accessoryType == UITableViewCellAccessoryType.none){
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
            newCodes[indexPath.row] = Currency.getCode(indexPath.row)
        } else{
            newCodes.removeValue(forKey: indexPath.row)
            cell?.accessoryType = UITableViewCellAccessoryType.none
             if (Currency.containsAllCodes(indexPath.row)){
                cell?.accessoryType = UITableViewCellAccessoryType.none
                Currency.removeMyCode(Currency.getCode(indexPath.row))
            }
        }
    }
}
