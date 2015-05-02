//
//  SPFixedColumnRowVerticalLayoutTests.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 01/05/15.
//  Copyright (c) 2015 Happyfall. All rights reserved.
//

import UIKit
import XCTest

class SPFixedColumnRowVerticalLayoutTests: XCTestCase {
   
   var layout = SPFixedColumnRowVerticalLayout(NoOfRows: 4, NoOfColumns: 3)
   var spCollectionViewTestVC : SPCollectionViewTestVC?
   private var delegate = SPTestFixedColumRowLayout()
   
   override func setUp() {
      super.setUp()
      // Put setup code here. This method is called before the invocation of each test method in the class.
      
      layout = SPFixedColumnRowVerticalLayout(NoOfRows: 3, NoOfColumns: 3)
      
      var storyboard = UIStoryboard(name: "SPTestStoryboard", bundle: NSBundle(forClass: self.classForCoder))
      spCollectionViewTestVC = (storyboard.instantiateViewControllerWithIdentifier("SPCollectionViewTestVC") as? SPCollectionViewTestVC)!
      spCollectionViewTestVC!.view.setNeedsDisplay()
      spCollectionViewTestVC!.spCollectionView.collectionViewLayout = layout
      layout.delegate = delegate
   }
   
   override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
   }
   
   func testLayoutCreation() {
      // This is an example of a functional test case.
      XCTAssert(layout.noOfColumns == 10 &&
         layout.noOfRows == 10, "Pass")
   }
   
   func testAttributeCalculationWithCollectionViewNil(){
      var layout1 = SPFixedColumnRowVerticalLayout(NoOfRows: 10, NoOfColumns: 10)
      
      layout1.prepareLayout()
      
      XCTAssert(layout1.attributesDictionary.count == 0 &&
         layout1.sectionSizeDictionary.count == 0, "CollectionView as nil")
   }
   
   func testAttributeCalculationWithNoSections(){
      layout.prepareLayout()
      XCTAssert(layout.attributesDictionary.count == 0 &&
         layout.sectionSizeDictionary.count == 0, "CollectionView No Section")
   }
   
   func testSizeWithSectionDetails(){
      spCollectionViewTestVC!.spCollectionView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellCount: 15, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellModelArray: ["1","2","3"])]),
         SPListingSection(
            CellGroups: [
               SPListingCellGroup(cellId: "SPTitleTestCCell", cellCount: 15, cellCommonModel: "12"),
               SPListingCellGroup(cellId: "SPTitleTestCCell", cellModelArray: ["1","2","3"])])])
      
      layout.prepareLayout()
      
      XCTAssert(layout.attributesDictionary[NSIndexPath(forRow: 0, inSection: 0)]?.frame.size.width == 127.5 &&
         layout.attributesDictionary[NSIndexPath(forRow: 0, inSection: 0)]?.frame.size.height == 183.33 &&
         layout.attributesDictionary[NSIndexPath(forRow: 0, inSection: 1)]?.frame.size.width == 183.33 &&
         layout.attributesDictionary[NSIndexPath(forRow: 0, inSection: 1)]?.frame.size.height == 127.5, "Height and Width should be valid")
   }
   
   func testOriginWithSectionDetails(){
      spCollectionViewTestVC!.spCollectionView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellCount: 15, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellModelArray: ["1","2","3"])]),
         SPListingSection(
            CellGroups: [
               SPListingCellGroup(cellId: "SPTitleTestCCell", cellCount: 15, cellCommonModel: "12"),
               SPListingCellGroup(cellId: "SPTitleTestCCell", cellModelArray: ["1","2","3"])])])
      
      layout.prepareLayout()
      
      for (indexPath,value) in layout.attributesDictionary{
         println("\(indexPath.section):\(indexPath.row) - \(value.frame)")
      }
   }
   
   
   func testAttributeCalculationWithSectionDetailsAndSomeEmptySection(){
      
   }
   
   func testTotalCountForAttributesDictionary(){
      
   }
   
   func testTotalCountForSectionSizeDictionary(){
      
   }

}
