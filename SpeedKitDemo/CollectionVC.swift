//
//  CollectionVC.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 15/11/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController,SPTableViewControllerProtocol{
    
    // SPTableViewControllerProtocol
    var spTableDatasource : [[SPTableViewCellData]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var horizontalVCObj : SPHorizontalCollectionMainController = SPHorizontalCollectionMainController()
        
        var optHorizontalVC =  horizontalVCObj.horizontalCollection(using: [// Section 0
            [
                SPTableViewCellData(
                    cellId: kCellIdSampleCollectionViewCell,
                    cellCount: 15,
                    cellModelCommon:[SampleCollectionCellModel(Title: "Collection")])]])
        
        if let horizontalVC = optHorizontalVC{
            self.addChildViewController(horizontalVC)
            horizontalVC.view.frame = self.view.frame
            self.view.addSubview(horizontalVC.view)
            horizontalVC.didMoveToParentViewController(self)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        println("didReceiveMemoryWarning")
    }
}


