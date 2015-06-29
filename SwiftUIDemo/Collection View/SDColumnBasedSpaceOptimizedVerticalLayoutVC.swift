//
//  SDColumnBasedSpaceOptimizedVerticalLayoutVC.swift
//  SwiftUIDemo
//
//  Created by Pradip Vaghasiya on 07/05/15.
//  Copyright (c) 2015 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI

let kSegueToSDColumnBasedSpaceOptimizedVerticalLayoutVC = "SDColumnBasedSpaceOptimizedVerticalLayoutVC"

class SDColumnBasedSpaceOptimizedVerticalLayoutVC: UIViewController,SPCollectionListingControllerType {
   var listingData : ListingData<CollectionViewSection> = ListingData(sections: [])

   
   @IBOutlet weak var spCollectionView: SPCollectionView!
   
   var isVertical : Bool = true
   
   lazy var verticalLayout = SPStraightSpaceOptimizedVerticalLayout()
   lazy var horizontalLayout = SPFixedColumnRowHorizontalLayout()
   
   private var delegate = SpaceOptimzedLayoutDelegate()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      
      listingData = ListingData(sections: [CollectionViewSection(viewModels: [
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
               SPTitleTestCCellModel(TitleText: "12"),
               SPTitleTestCCellModel(TitleText: "13"),
               SPTitleTestCCellModel(TitleText: "14"),
               SPTitleTestCCellModel(TitleText: "15"),
               SPTitleTestCCellModel(TitleText: "16"),
               SPTitleTestCCellModel(TitleText: "17")]
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
}


class SpaceOptimzedLayoutDelegate : NSObject, SPStraightVerticalLayoutDelegate{
   func noOfColumns(ForSection section : Int) -> UInt{
      if section == 0 {
         return 4
      }
      return 3
   }
   
   ///Height Of an item
   func itemHeightAt(IndexPath indexPath : NSIndexPath) -> CGFloat{
      switch(indexPath.item){
      case 1:
         return 88
      case 2:
         return 100
      case 5:
         return 220
      case 8:
         return 118
      case 10:
         return 87
      case 11:
         return 84
      default:
         return 44
         
      }
   }
   
}
