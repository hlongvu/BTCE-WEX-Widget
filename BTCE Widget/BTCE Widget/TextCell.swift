//
//  FundCell.swift
//  BTCE Widget
//
//  Created by long on 6/20/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
class TextCell : UITableViewCell {
    @IBOutlet weak var label: UILabel!
    
}

class TextCellModel: SGModel {
    var text:String = ""
    init(_ text:String) {
        self.text = text
    }
    
    override func nibName() -> String {
        return TextCell.typeName
    }
    
    override func fillData(cell: UITableViewCell) {
        super.fillData(cell: cell)
        //        cell.backgroundColor = UIColor.white
        //        cell.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
        if let c = cell as? TextCell{
           c.label.text = self.text
        }
    }
}

class TextAttrCellModel: SGModel {
    var text : NSAttributedString?
   
    init(_ text:NSAttributedString?) {
        self.text = text
    }
    
    override func nibName() -> String {
        return TextCell.typeName
    }
    
    override func fillData(cell: UITableViewCell) {
        super.fillData(cell: cell)
        //        cell.backgroundColor = UIColor.white
        //        cell.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
        if let c = cell as? TextCell{
            c.label.attributedText = self.text
        }
    }
}
