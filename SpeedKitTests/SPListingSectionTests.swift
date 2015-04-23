//
//  SPListingSectionTests.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 19/04/15.
//  Copyright (c) 2015 Happyfall. All rights reserved.
//

import UIKit
import XCTest

class SPListingSectionTests: XCTestCase {
   
   var cellGroup1 = SPListingCellGroup(cellId: "SPTitleCellLabel", cellCount: 12, cellModelCommon: "CommonModel")
   var cellGroup2 = SPListingCellGroup(cellId: "SPTitleCellLabel", cellModel: ["1","2","3"])
   var cellGroup3 = SPListingCellGroup(cellId: "SPTitleCellLabel", cellModelCommon: "CommonModel", cellModel: ["1","2"])
  
   var cellGroups : [SPListingCellGroup] = []
   var sectionData = SPListingSection(CellDataSets: [])
   
   override func setUp() {
      super.setUp()

      cellGroups = [cellGroup1,cellGroup2]
      sectionData = SPListingSection(CellDataSets: [cellGroup1,cellGroup2])
   }
   
   override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
   }
 
   func testSectionDataWithOnlyCellSets(){
      XCTAssert(sectionData.cellGroupArray.count == 2 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 15, "SectionData should be created with proper data")
   }
   
   func testSectionDataWithEmptyCells(){
      var sectionData = SPListingSection(CellDataSets: [])
      XCTAssert(sectionData.cellGroupArray.count == 0 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 0, "SectionData should be created with proper data")
   }
   
   func testSectionDataWithSectionHeader(){
      var sectionData = SPListingSection(CellDataSets: cellGroups, SectionHeader: "header")
      XCTAssert(sectionData.cellGroupArray.count == 2 &&
         sectionData.sectionHeader == "header" &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 15, "SectionData should be created with proper data")
   }
   
   func testSectionDataWithSectionFooter(){
      var sectionData = SPListingSection(CellDataSets: cellGroups, SectionFooter: "footer")
      XCTAssert(sectionData.cellGroupArray.count == 2 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == "footer" &&
         sectionData.sectionTotalCellCount == 15, "SectionData should be created with proper data")
   }
   
   func testSectionDataWithSectionHeaderNFooter(){
      var sectionData = SPListingSection(CellDataSets: cellGroups, SectionHeader: "header", SectionFooter : "footer")
      XCTAssert(sectionData.cellGroupArray.count == 2 &&
         sectionData.sectionHeader == "header" &&
         sectionData.sectionFooter == "footer" &&
         sectionData.sectionTotalCellCount == 15, "SectionData should be created with proper data")
   }

   func testSectionCellCountWithOneCellSet(){
      var sectionData = SPListingSection(CellDataSets: [cellGroup1])
      XCTAssert(sectionData.cellGroupArray.count == 1 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 12, "SectionData should be created with proper data")
   }
   
   func testSectionCellSetAppend(){
      sectionData.cellGroupArray.append(cellGroup3)
      XCTAssert(sectionData.cellGroupArray.count == 3 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 17, "SectionData should be created with proper data")
   }
   
   func testSectionCellSetEdit(){
      sectionData.cellGroupArray[1] = cellGroup3
      XCTAssert(sectionData.cellGroupArray.count == 2 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 14, "SectionData should be created with proper data")
   }
   
   func testSectionCellSetRemove(){
      sectionData.cellGroupArray.removeLast()
      XCTAssert(sectionData.cellGroupArray.count == 1 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 12, "SectionData should be created with proper data")
   }

   func testSectionCellSetRemoveAll(){
      sectionData.cellGroupArray.removeAll(keepCapacity: false)
      XCTAssert(sectionData.cellGroupArray.count == 0 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 0, "SectionData should be created with proper data")
   }
   
   func testSectionCellSetFill(){
      sectionData.cellGroupArray.removeAll(keepCapacity: false)
      sectionData.cellGroupArray = [cellGroup3]
      XCTAssert(sectionData.cellGroupArray.count == 1 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 2, "SectionData should be created with proper data")
   }


}
