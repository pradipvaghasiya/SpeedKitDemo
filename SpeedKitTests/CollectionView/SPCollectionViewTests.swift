//
//  SPCollectionViewTests.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 01/05/15.
//  Copyright (c) 2015 Happyfall. All rights reserved.
//

import UIKit
import XCTest

class SPCollectionViewTests: XCTestCase {

   var spCollectionView = SPCollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 300), collectionViewLayout: SPListingColumnBasedLayout())

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
      spCollectionView = SPCollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 300), collectionViewLayout: SPListingColumnBasedLayout())
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

   func testFromStoryboard(){
      var storyboard = UIStoryboard(name: "SPTestStoryboard", bundle: NSBundle(forClass: self.classForCoder))
      var spCollectionViewTestVC : SPCollectionViewTestVC = (storyboard.instantiateViewControllerWithIdentifier("SPCollectionViewTestVC") as? SPCollectionViewTestVC)!
      
      spCollectionViewTestVC.view.setNeedsDisplay()
      
      XCTAssertNotNil(spCollectionViewTestVC.spCollectionView.dataSource, "spCollectionView Datasource set")
      
   }
   
   func testFromCode(){
      XCTAssertNotNil(spCollectionView, "spCollectionView Created")
   }
   
   func testDatasourceNibsRegistered(){
      spCollectionView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellModelArray: ["1","2","3"])])])
      
      XCTAssertNotNil(spCollectionView.dequeueReusableCellWithReuseIdentifier("SPTitleTestCCell", forIndexPath: NSIndexPath(forRow: 0, inSection: 0)), "Nib Registered")
   }
   
   func testDatasourceWrongTypeNibsRegistered(){
      spCollectionView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellModelArray: ["1","2","3"])])])
      
//      XCTAssertNotNil(spCollectionView.dequeueReusableCellWithReuseIdentifier("SPTitleLabelCell", forIndexPath: NSIndexPath(forRow: 0, inSection: 0)), "Nib Registered")
      ///TODO: No Try Catch in Swift: Collectionview dequeue run time crash

   }

   
   func testDatasourceSubClassRegistered(){
      spCollectionView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SpeedKitDemo.SPTitleTestCCell", cellModelArray: ["1","2","3"], cellType : SPCellType.SubclassCell)])])
      
      XCTAssertNotNil(spCollectionView.dequeueReusableCellWithReuseIdentifier("SpeedKitDemo.SPTitleTestCCell", forIndexPath: NSIndexPath(forRow: 12, inSection: 0)), "Subclass Registered")
   }
   
   func testDatasourceWrongTypeSubClassRegistered(){
      spCollectionView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SpeedKitDemo.SPTitleLabelCell", cellModelArray: ["1","2","3"], cellType : SPCellType.SubclassCell)])])
      
//      XCTAssertNotNil(spCollectionView.dequeueReusableCellWithReuseIdentifier("SpeedKitDemo.SPTitleLabelCell", forIndexPath: NSIndexPath(forRow: 0, inSection: 0)), "Subclass Registered")
      ///TODO: No Try Catch in Swift: Collectionview dequeue run time crash

   }

   
   func testDatasourceDoesntRegisterCellsAfterUpdate(){
      spCollectionView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellModelArray: ["1","2","3"])])])
      
      spCollectionView.spListingData.spListingSectionArray[0].spCellGroupArray.append(SPListingCellGroup(cellId: "SpeedKitDemo.SPTitleTestCCell", cellModelArray: ["1","2","3"], cellType : SPCellType.SubclassCell))
      
//      XCTAssertNil(spCollectionView.dequeueReusableCellWithReuseIdentifier("SpeedKitDemo.SPTitleTestCCell", forIndexPath: NSIndexPath(forRow: 0, inSection: 0)), "Subclass should not be Registered")
      ///TODO: No Try Catch in Swift: Collectionview dequeue run time crash

   }
   
   func testRegisterCellsAfterUpdate(){
      spCollectionView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellModelArray: ["1","2","3"])])])
      
      var cellGroup = SPListingCellGroup(cellId: "SpeedKitDemo.SPTitleTestCCell", cellModelArray: ["1","2","3"], cellType : SPCellType.SubclassCell)
      spCollectionView.spListingData.spListingSectionArray[0].spCellGroupArray.append(cellGroup)
      
      spCollectionView.registerCellsFor(CellGroup: cellGroup)
      
      XCTAssertNotNil(spCollectionView.dequeueReusableCellWithReuseIdentifier("SpeedKitDemo.SPTitleTestCCell", forIndexPath: NSIndexPath(forRow: 0, inSection: 0)), "Subclass should not be Registered")
   }
   
   func testDatasourceDoesntRegisterCellsAfterFullUpdate(){
      spCollectionView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellModelArray: ["1","2","3"])])])
      
      spCollectionView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SpeedKitDemo.SPTitleTestCCell", cellModelArray: ["1","2","3"], cellType : SPCellType.SubclassCell)])])
      
//      XCTAssertNil(spCollectionView.dequeueReusableCellWithReuseIdentifier("SpeedKitDemo.SPTitleTestCCell", forIndexPath: NSIndexPath(forRow: 0, inSection: 0)), "Subclass should not be Registered")
      ///TODO: No Try Catch in Swift: Collectionview dequeue run time crash

   }
   
   func testRegisterCellsAfterFullUpdate(){
      spCollectionView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellModelArray: ["1","2","3"])])])
      
      spCollectionView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleTestCCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SpeedKitDemo.SPTitleTestCCell", cellModelArray: ["1","2","3"], cellType : SPCellType.SubclassCell)])])
      
      spCollectionView.registerReusableCellsIfRequired()
      
      XCTAssertNotNil(spCollectionView.dequeueReusableCellWithReuseIdentifier("SpeedKitDemo.SPTitleTestCCell", forIndexPath: NSIndexPath(forRow: 0, inSection: 0)), "Subclass should not be Registered")
   }


}
