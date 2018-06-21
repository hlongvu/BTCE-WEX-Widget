//
//  CLAdapter.swift
//  BTCE Widget
//
//  Created by long on 6/20/18.
//  Copyright © 2018 Long Vu. All rights reserved.
//

import Foundation
import UIKit
class CLAdapter: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    private var modelList:[CLModel]?
    private var collectionView: UICollectionView?
    override init() {
        modelList = []
    }
    // delegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let m = modelList![indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: m.nibName(), for: indexPath)
        //cell.selectionStyle = .none
        
        m.fillData(cell: cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let m = modelList![indexPath.row]
        let width = m.getWidth(collectionView)
        let height = m.getHeight(collectionView)
//        let width = widthPercent * (collectionView.bounds.width)
                
       // print("size", width, height)
        return CGSize(width: width , height: height)
    }
 
 
    
    
    // data func
    func buildModels(){
        
    }
    
    func clearModels(){
        modelList?.removeAll()
    }
    
    func addModel(_ model:CLModel){
        modelList?.append(model)
    }
    
    func setUp(_ cl:UICollectionView){
        self.collectionView = cl
        
        registerNib(collectionView!)
        buildModels()
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        
    }
    
    func reBuildModelsAndReloadTable(){
        buildModels()
        self.collectionView?.reloadData()
    }
    
    func registerNib(_ cl:UICollectionView){
        
    }
    
}
