//
//  CollectionVC.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 15/11/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController{
    
    // SPListingViewProtocol
    var spListingData : SPListingData = SPListingData([])
    var collectionLayout = SPListingColumnBasedLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Add Child view controller
        self.addCollectionViewController()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        println("didReceiveMemoryWarning")
    }
}


extension CollectionVC{
    func addCollectionViewController(){
        if let listingCVC = SPListingCollectionVC.getNewInstance(){
            
            // Layout Setup
            //collectionLayout.delegate = ColumnBasedLayoutDatasource()
            //collectionLayout.scrollDirection = .Horizontal
            //collectionLayout.isSpaceOptimized = true
            collectionLayout.sectionInset = UIEdgeInsetsZero
//            collectionLayout.noOfLinesShouldFit = 4
            collectionLayout.noOfScrollingLines = 1
            collectionLayout.lengthOfItem = 50
            
            collectionLayout.interitemSpacing = 10
            collectionLayout.lineSpacing = 1
            
            //collectionLayout.cellAutoResizingOn = true
            //collectionLayout.estimatedLengthOfItem = 20
            //collectionLayout.debug = true
            
            //var flow = UICollectionViewFlowLayout()
            //flow.estimatedItemSize = CGSizeMake(300, 3)
            
            listingCVC.collectionViewLayout = collectionLayout
            
            // Section Data Array
            var section0 = SPListingSectionData(CellDataSets: [
                SPListingCellGroup(
                    cellId: kCellIdSampleCollectionViewCell,
                    cellCount: 15,
                    cellModelCommon:SampleCollectionCellModel(Title: "0 Pradip"))])
            
            var section1 = SPListingSectionData(CellDataSets: [
                SPListingCellGroup(
                    cellId: kCellIdSampleCollectionViewCell,
                    cellCount: 20,
                    cellModelCommon:SampleCollectionCellModel(Title: "1 Pradip Vaghasiya"))])
            
            listingCVC.spListingData = SPListingData([section0,section1])
            
            self.addChildViewController(listingCVC)
            listingCVC.view.frame = self.view.frame
            self.view.addSubview(listingCVC.view)
            listingCVC.didMoveToParentViewController(self)
            
            // Segment Controller
            var segmentController = SPSegmentControllerHolderController(viewControllers: [listingCVC])
            
        }
    }
}

