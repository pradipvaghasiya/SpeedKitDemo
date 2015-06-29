//
//  SDStraightAutoSizingVerticalLayoutVC.swift
//  SwiftUIDemo
//
//  Created by Pradip Vaghasiya on 07/05/15.
//  Copyright (c) 2015 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI

let kSegueToSDStraightAutoSizingVerticalLayoutVC = "SDStraightAutoSizingVerticalLayoutVC"

class SDStraightAutoSizingVerticalLayoutVC: UIViewController,SPCollectionListingControllerType {
   var listingData : ListingData<CollectionViewSection> = ListingData(sections: [])

   
   @IBOutlet weak var spCollectionView: SPCollectionView!
   
   var isVertical : Bool = true
   
   lazy var verticalLayout = SPStraightSpaceOptimizedVerticalLayout()
   lazy var horizontalLayout = SPFixedColumnRowHorizontalLayout()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      
      listingData = ListingData(sections: [CollectionViewSection(viewModels : [
               SPTitleTestCCellModel(TitleText: "Pradip"),
               SPTitleTestCCellModel(TitleText: "Pradip Vaghasiya"),
               SPTitleTestCCellModel(TitleText: "2"),
               SPTitleTestCCellModel(TitleText: "3"),
               SPTitleTestCCellModel(TitleText: "4"),
               SPTitleTestCCellModel(TitleText: "5"),
               SPTitleTestCCellModel(TitleText: "Pradip Vaghasiya Pradip VaghasiyaPradip Vaghasiya"),
               SPTitleTestCCellModel(TitleText: "7"),
               SPTitleTestCCellModel(TitleText: "8"),
               SPTitleTestCCellModel(TitleText: "9"),
               SPTitleTestCCellModel(TitleText: "10"),
               SPTitleTestCCellModel(TitleText: "Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya"),
               SPTitleTestCCellModel(TitleText: "12"),
               SPTitleTestCCellModel(TitleText: "13"),
               SPTitleTestCCellModel(TitleText: "Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya"),
               SPTitleTestCCellModel(TitleText: "15"),
               SPTitleTestCCellModel(TitleText: "16"),
               SPTitleTestCCellModel(TitleText: "17")]
         ),
         CollectionViewSection(viewModels :
            [
               SPTitleTestCCellModel(TitleText: "0"),
               SPTitleTestCCellModel(TitleText: "1"),
               SPTitleTestCCellModel(TitleText: "2"),
               SPTitleTestCCellModel(TitleText: "Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya Pradip Vaghasiya"),
               SPTitleTestCCellModel(TitleText: "4"),
               SPTitleTestCCellModel(TitleText: "5"),
               SPTitleTestCCellModel(TitleText: "6"),
               SPTitleTestCCellModel(TitleText: "7"),
               SPTitleTestCCellModel(TitleText: "Pradip Vaghasiya Pradip Vaghasiya"),
               SPTitleTestCCellModel(TitleText: "9"),
               ]
         )
         ]
      )
      
      self.spCollectionView.controller = self
      
      if isVertical{
         self.spCollectionView.collectionViewLayout = verticalLayout
      }else{
         self.spCollectionView.collectionViewLayout = horizontalLayout
      }
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}
