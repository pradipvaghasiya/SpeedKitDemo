//
//  SPTableViewTests.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 29/04/15.
//  Copyright (c) 2015 Happyfall. All rights reserved.
//

import UIKit
import XCTest

class SPTableViewTests: XCTestCase {
   
   var spTableView = SPTableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
   
   override func setUp() {
      super.setUp()
      // Put setup code here. This method is called before the invocation of each test method in the class.
      
      spTableView = SPTableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
   }
   
   override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
      
   }
   
   func testFromStoryboard(){
      var storyboard = UIStoryboard(name: "SPTestStoryboard", bundle: NSBundle(forClass: self.classForCoder))
      var spTableViewTestVC : SPTableViewTestVC = (storyboard.instantiateViewControllerWithIdentifier("SPTableViewTestVC") as? SPTableViewTestVC)!
      
      spTableViewTestVC.view.setNeedsDisplay()
      
      XCTAssertNotNil(spTableViewTestVC.spTableView.dataSource, "SPTableView Datasource set")
      
   }
   
   func testFromCode(){
      XCTAssertNotNil(spTableView, "SPTableView Created")
   }
   
   func testDatasourceNibsRegistered(){
      spTableView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellModel: ["1","2","3"])])])
      
      XCTAssertNotNil(spTableView.dequeueReusableCellWithIdentifier("SPTitleLabelCell"), "Nib Registered")
   }
   
   func testDatasourceSubClassRegistered(){
      spTableView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SpeedKitDemo.SPTitleLabelCell", cellModel: ["1","2","3"], cellType : SPCellType.SubclassCell)])])
      
      XCTAssertNotNil(spTableView.dequeueReusableCellWithIdentifier("SpeedKitDemo.SPTitleLabelCell"), "Subclass Registered")
   }
   
   func testDatasourceDoesntRegisterCellsAfterUpdate(){
      spTableView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellModel: ["1","2","3"])])])
      
      spTableView.spListingData.spListingSectionArray[0].spCellGroupArray.append(SPListingCellGroup(cellId: "SpeedKitDemo.SPTitleLabelCell", cellModel: ["1","2","3"], cellType : SPCellType.SubclassCell))
      
      XCTAssertNil(spTableView.dequeueReusableCellWithIdentifier("SpeedKitDemo.SPTitleLabelCell"), "Subclass should not be Registered")
   }
   
   func testRegisterCellsAfterUpdate(){
      spTableView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellModel: ["1","2","3"])])])
      
      var cellGroup = SPListingCellGroup(cellId: "SpeedKitDemo.SPTitleLabelCell", cellModel: ["1","2","3"], cellType : SPCellType.SubclassCell)
      spTableView.spListingData.spListingSectionArray[0].spCellGroupArray.append(cellGroup)
      
      spTableView.registerCellsFor(CellGroup: cellGroup)
      
      XCTAssertNotNil(spTableView.dequeueReusableCellWithIdentifier("SpeedKitDemo.SPTitleLabelCell"), "Subclass should not be Registered")
   }

   func testDatasourceDoesntRegisterCellsAfterFullUpdate(){
      spTableView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellModel: ["1","2","3"])])])
      
      spTableView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SpeedKitDemo.SPTitleLabelCell", cellModel: ["1","2","3"], cellType : SPCellType.SubclassCell)])])
      
      XCTAssertNil(spTableView.dequeueReusableCellWithIdentifier("SpeedKitDemo.SPTitleLabelCell"), "Subclass should not be Registered")
   }
   
   func testRegisterCellsAfterFullUpdate(){
      spTableView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellModel: ["1","2","3"])])])
      
      spTableView.spListingData = SPListingData(SectionArray: [SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellCount: 12, cellCommonModel: "12"),
            SPListingCellGroup(cellId: "SpeedKitDemo.SPTitleLabelCell", cellModel: ["1","2","3"], cellType : SPCellType.SubclassCell)])])
      
      spTableView.registerReusableCellsIfRequired()
      
      XCTAssertNotNil(spTableView.dequeueReusableCellWithIdentifier("SpeedKitDemo.SPTitleLabelCell"), "Subclass should not be Registered")
   }


   
}
