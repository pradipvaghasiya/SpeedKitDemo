//
//  SDColumnOrRowLayoutVC.swift
//  SwiftUIDemo
//
//  Created by Pradip Vaghasiya on 07/05/15.
//  Copyright (c) 2015 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI

let kSegueToSDColumnOrRowLayoutVC = "SDColumnOrRowLayoutVC"

class SDColumnOrRowLayoutVC: UIViewController {
   var collectionData : ListingData<CollectionViewSection> = ListingData(sections: [])

   @IBOutlet weak var spCollectionView: SPCollectionView!
   
   var isVertical : Bool = true
   
   lazy var verticalLayout = SPStraightVerticalLayout()
   lazy var horizontalLayout = SPFixedColumnRowHorizontalLayout()
   
   private var delegate = LayoutDelegate()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      
      collectionData = ListingData(sections: [
         CollectionViewSection(viewModels:
            [
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
               SPTitleTestCCellModel(TitleText: "12")
            ]
         ),
         CollectionViewSection(viewModels:
            [
               SPTitleTestCCellModel(TitleText: "0"),
               SPTitleTestCCellModel(TitleText: "1"),
               SPTitleTestCCellModel(TitleText: "2"),
               SPTitleTestCCellModel(TitleText: "3"),
               SPTitleTestCCellModel(TitleText: "4"),
               SPTitleTestCCellModel(TitleText: "5"),
               SPTitleTestCCellModel(TitleText: "6"),
               SPTitleTestCCellModel(TitleText: "7"),
               SPTitleTestCCellModel(TitleText: "8"),
               SPTitleTestCCellModel(TitleText: "9")
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

extension SDColumnOrRowLayoutVC: SPCollectionListingControllerType{
   func collectionListingData(collectionView: UICollectionView) -> ListingData<CollectionViewSection> {
      return collectionData
   }
}



class LayoutDelegate : NSObject, SPStraightVerticalLayoutDelegate{
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
      case 4:
         return 34
      case 5:
         return 67
      case 8:
         return 118
      case 10:
         return 87
      case 11:
         return 32
      default:
         return 55
         
      }
   }

}
