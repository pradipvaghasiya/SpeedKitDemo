//
//  SDFixedColumnRowVC.swift
//  SwiftUIDemo
//
//  Created by Pradip Vaghasiya on 02/05/15.
//  Copyright (c) 2015 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI

let kSegueToSDFixedColumnRowVC = "SDFixedColumnRowVC"

class SDFixedColumnRowVC: UIViewController{
   
   @IBOutlet weak var spCollectionView: SPCollectionView!
   var collectionData : ListingData<CollectionViewSection> = ListingData(sections: [])

   
   var isVertical : Bool = true
   
   lazy var verticalLayout = SPFixedColumnRowVerticalLayout()
   lazy var horizontalLayout = SPFixedColumnRowHorizontalLayout()
   
   private var delegate = SPFixedColumRowLayoutDelegate()
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      
      collectionData = ListingData(sections: [CollectionViewSection(viewModels: [
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
               SPTitleTestCCellModel(TitleText: "12")]
         ),
         CollectionViewSection(viewModels: [
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
               ]
         )
         ]
      )

      self.spCollectionView.controller = self
      
      if isVertical{
         verticalLayout.delegate = delegate
         self.spCollectionView.collectionViewLayout = verticalLayout
      }else{
         horizontalLayout.delegate = delegate
         self.spCollectionView.collectionViewLayout = horizontalLayout
      }
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   @available(iOS 8.0, *)
   override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
      super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
      dispatch_async(dispatch_get_main_queue(), { () -> Void in
         self.spCollectionView.performBatchUpdates({ () -> Void in
            self.spCollectionView.collectionViewLayout.invalidateLayout()
            }, completion: nil)
      })
   }
   
   ///TODO: Only for iOS 7 below method should be added. Add preprocessor.
   override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
      self.spCollectionView.collectionViewLayout.invalidateLayout()
   }
}

extension SDFixedColumnRowVC: SPCollectionListingControllerType{
   func collectionListingData(collectionView: UICollectionView) -> ListingData<CollectionViewSection> {
      return collectionData
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
