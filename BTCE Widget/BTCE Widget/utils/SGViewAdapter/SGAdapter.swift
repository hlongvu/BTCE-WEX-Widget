//
//  Adapter.swift
//  TestEpox
//
//  Created by Long Vu on 5/11/17.
//  Copyright © 2017 SUN. All rights reserved.
//

import Foundation
import UIKit

class SGAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var modelList:[SGModel]?
    private var tableView:UITableView?
    override init() {
        modelList = []
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let m = modelList![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: m.nibName(), for: indexPath)
        //cell.selectionStyle = .none
        m.fillData(cell: cell)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return modelList?[indexPath.row].getHeight() ?? 0
        
    }
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return modelList![indexPath.row].canEditRow() ||  modelList![indexPath.row].canDeleteRow()
//    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
//    {
//        if editingStyle == .delete
//        {
//            print("Delete")
//            modelList![indexPath.row].didDelete(index: indexPath.row)
//           // tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //print("triggered!")
        var action:[UITableViewRowAction] = []
        let canEdit = modelList![indexPath.row].canEditRow()
        if (canEdit){
            let edit = UITableViewRowAction(style: .default, title: "Edit") { action, index in
                print("edit button tapped")
                self.modelList![indexPath.row].didEdit(index: index.row)
            }
            edit.backgroundColor = UIColor.editColor
            action.append(edit)
        }
        
        let canDelete = modelList![indexPath.row].canDeleteRow()
        if (canDelete){
            let delete = UITableViewRowAction(style: .default, title: "Delete") { action, index in
                print("delete button tapped")
                self.modelList![indexPath.row].didDelete(index: index.row)
            }
            delete.backgroundColor = UIColor.red
            action.append(delete)
        }
        return action
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        modelList?[indexPath.row].didSelect(index: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }    
    
    func buildModels(){
        
    }
    
    func clearModels(){
        modelList?.removeAll()
    }
    
    func addModel(_ model:SGModel){
        modelList?.append(model)
    }
    
    func setUp(_ tv:UITableView){
        self.tableView = tv
        registerNib(tableView: tableView!)
        buildModels()
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
    }
    
    func reBuildModelsAndReloadTable(){
        buildModels()
        self.tableView?.reloadData()
    }
    
    func registerNib(tableView:UITableView){
        
    }
    
    func reloadCellAtModel<T>(type: T.Type){
        if self.modelList == nil {
            return
        }
        for (index, model) in self.modelList!.enumerated(){
            if model is T{
                print("reload", index)
                self.tableView?.reloadRows(at: [IndexPath(row:index, section:0)], with: .none)
                return
            }
        }
    }
    
    
}
