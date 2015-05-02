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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
   
   override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
      super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
      println(self.spCollectionView.bounds)
      dispatch_async(dispatch_get_main_queue(), { () -> Void in
         self.spCollectionView.collectionViewLayout.invalidateLayout()
      })
      
   }
   
   override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
      println(self.spCollectionView.bounds)

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
   
   ///Gets Line spacing required for that section.
   func lineSpacing(ForSection section : Int) -> CGFloat{
      return 10
      if section == 0 {
         return 5
      }
      return 10
   }
   
   ///Gets Inter item spacing required for that section.
   func interItemSpacing(ForSection section : Int) -> CGFloat{
      if section == 0 {
         return 10
      }
      return 5
   }
   
   ///Gets Section Inset required for that section
   func sectionInset(ForSection section : Int) -> UIEdgeInsets{
      return UIEdgeInsetsMake(10, 10, 10, 10)
      if section == 0 {
         return UIEdgeInsetsMake(10, 20, 30, 40)
      }
      return UIEdgeInsetsMake(40, 30, 20, 10)
      
   }
   
   
}
