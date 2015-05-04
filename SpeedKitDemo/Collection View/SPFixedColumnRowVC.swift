//
//  SPFixedColumnRowVC.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 02/05/15.
//  Copyright (c) 2015 Happyfall. All rights reserved.
//

import UIKit

let kSegueToSPFixedColumnRowVC = "SPFixedColumnRowVC"

class SPFixedColumnRowVC: UIViewController {

   @IBOutlet weak var spCollectionView: SPCollectionView!
   var layout = SPFixedColumnRowVerticalLayout(NoOfRows: 3, NoOfColumns: 3)
   private var delegate = SPFixedColumRowLayoutDelegate()

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      self.spCollectionView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellModelArray: [
               SPTitleTestCCellModel(TitleText: "0"),
               SPTitleTestCCellModel(TitleText: "1"),
               SPTitleTestCCellModel(TitleText: "2"),
               SPTitleTestCCellModel(TitleText: "3"),
               SPTitleTestCCellModel(TitleText: "4"),
               SPTitleTestCCellModel(TitleText: "5"),
               SPTitleTestCCellModel(TitleText: "6"),
               SPTitleTestCCellModel(TitleText: "7"),
               SPTitleTestCCellModel(TitleText: "8"),
               SPTitleTestCCellModel(TitleText: "9"),
               SPTitleTestCCellModel(TitleText: "10"),
               SPTitleTestCCellModel(TitleText: "11"),
               SPTitleTestCCellModel(TitleText: "12"),])]
         ),
         SPListingSection(
            CellGroups: [SPListingCellGroup(cellId: "SPTitleTestCCell", cellModelArray: [
               SPTitleTestCCellModel(TitleText: "0"),
               SPTitleTestCCellModel(TitleText: "1"),
               SPTitleTestCCellModel(TitleText: "2"),
               SPTitleTestCCellModel(TitleText: "3"),
               SPTitleTestCCellModel(TitleText: "4"),
               SPTitleTestCCellModel(TitleText: "5"),
               SPTitleTestCCellModel(TitleText: "6"),
               SPTitleTestCCellModel(TitleText: "7"),
               SPTitleTestCCellModel(TitleText: "8"),
               SPTitleTestCCellModel(TitleText: "9"),
])]
         )
         ]
      )
      

      layout.delegate = delegate
      self.spCollectionView.collectionViewLayout = layout
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
      super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
      dispatch_async(dispatch_get_main_queue(), { () -> Void in
         self.spCollectionView.performBatchUpdates({ () -> Void in
            self.spCollectionView.collectionViewLayout.invalidateLayout()
         }, completion: nil)
      })
      
   }
}

class SPFixedColumRowLayoutDelegate : NSObject, SPFixedColumnRowLayoutDelegate{
   func noOfRows(ForSection section : Int) -> UInt{
      if section == 0 {
         return 3
      }
      return 4
   }
   
   func noOfColumns(ForSection section : Int) -> UInt{
      if section == 0 {
         return 4
      }
      return 3
   }
   
}
