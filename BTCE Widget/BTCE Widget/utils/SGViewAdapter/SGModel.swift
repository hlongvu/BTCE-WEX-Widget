//
//  Model.swift
//  TestEpox
//
//  Created by Long Vu on 5/11/17.
//  Copyright © 2017 SUN. All rights reserved.
//

import Foundation
import UIKit

class SGModel{
    func getHeight()-> CGFloat { return 0}
    func nibName()-> String {return ""}
    func fillData(cell: UITableViewCell) {}
    func didSelect(index:Int){}
    func didDelete(index:Int){}
    func didEdit(index:Int){}
    func canEditRow() -> Bool {return false}
    func canDeleteRow() -> Bool {return false}
}
