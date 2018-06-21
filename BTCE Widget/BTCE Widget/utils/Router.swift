//
//  Router.swift
//  CoinCap
//
//  Created by Long Vu on 10/13/17.
//  Copyright © 2017 Long. All rights reserved.
//

import Foundation
import UIKit

class Router {
    
    static func getViewController<T:UIViewController>() -> T{
         let vc = UIStoryboard(name: T.typeName, bundle: nil).instantiateInitialViewController() as! T
        return vc
    }
    
    static func openDetails(fromVC: UIViewController, pair:String){
        let detailVC:DetailVC = getViewController()
        detailVC.code = pair
        fromVC.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    static func openActiveOrders(fromVC:UIViewController){
        let activeOrdersVC: ActiveOrdersVC = getViewController()
        fromVC.navigationController?.pushViewController(activeOrdersVC, animated: true)
    }
}
