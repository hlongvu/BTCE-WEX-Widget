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
    
    var type:String = "CODES"
    
    var newCodes:[String] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newCodes = Currency.getCodeArrayByKey(type)
        print (newCodes)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Currency.setCodeArrayByKey(key: type, codes: newCodes)
    }
    
    func removeCode(_ code:String){
        let index = newCodes.index(of: code)
        if (index != nil){
            newCodes.remove(at: index!)
        }
    }
    
    func addCode(_ code:String){
        let index = newCodes.index(of: code)
        if (index == nil){
            newCodes.append(code)
        }
    }
        
}

extension ChooseTradePairVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Currency.getAllCodes().count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paircell", for: indexPath)
        //cell.textLabel?.text = Currency.toCodeTitle(indexPath.row)
        //let code = Currency.getAllCodeAt(indexPath.row)
        cell.textLabel?.text = Currency.getAllCodes()[indexPath.row].toTradePairTitle()
        let code = Currency.getAllCodes()[indexPath.row]
        
        if (newCodes.index(of: code) != nil){
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        //let code = Currency.getAllCodeAt(indexPath.row)
        let code = Currency.getAllCodes()[indexPath.row]
        
        if (cell?.accessoryType == UITableViewCellAccessoryType.none){
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
            addCode(code)
        } else{
            removeCode(code)
            cell?.accessoryType = UITableViewCellAccessoryType.none
            
        }
        print(newCodes)
    }
}
