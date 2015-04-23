//
//  SPListingSectionDataTests.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 19/04/15.
//  Copyright (c) 2015 Happyfall. All rights reserved.
//

import UIKit
import XCTest

class SPListingSectionDataTests: XCTestCase {
   
   var cellDataSet1 = SPListingCellGroup(cellId: "SPTitleCellLabel", cellCount: 12, cellModelCommon: "CommonModel")
   var cellDataSet2 = SPListingCellGroup(cellId: "SPTitleCellLabel", cellModel: ["1","2","3"])
   var cellDataSet3 = SPListingCellGroup(cellId: "SPTitleCellLabel", cellModelCommon: "CommonModel", cellModel: ["1","2"])
  
   var cellDataSets : [SPListingCellGroup] = []
   var sectionData = SPListingSectionData(CellDataSets: [])
   
   override func setUp() {
      super.setUp()

      cellDataSets = [cellDataSet1,cellDataSet2]
      sectionData = SPListingSectionData(CellDataSets: [cellDataSet1,cellDataSet2])
   }
   
   override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
   }
 
   func testSectionDataWithOnlyCellSets(){
      XCTAssert(sectionData.cellDataSetArray.count == 2 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 15, "SectionData should be created with proper data")
   }
   
   func testSectionDataWithEmptyCells(){
      var sectionData = SPListingSectionData(CellDataSets: [])
      XCTAssert(sectionData.cellDataSetArray.count == 0 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 0, "SectionData should be created with proper data")
   }
   
   func testSectionDataWithSectionHeader(){
      var sectionData = SPListingSectionData(CellDataSets: cellDataSets, SectionHeader: "header")
      XCTAssert(sectionData.cellDataSetArray.count == 2 &&
         sectionData.sectionHeader == "header" &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 15, "SectionData should be created with proper data")
   }
   
   func testSectionDataWithSectionFooter(){
      var sectionData = SPListingSectionData(CellDataSets: cellDataSets, SectionFooter: "footer")
      XCTAssert(sectionData.cellDataSetArray.count == 2 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == "footer" &&
         sectionData.sectionTotalCellCount == 15, "SectionData should be created with proper data")
   }
   
   func testSectionDataWithSectionHeaderNFooter(){
      var sectionData = SPListingSectionData(CellDataSets: cellDataSets, SectionHeader: "header", SectionFooter : "footer")
      XCTAssert(sectionData.cellDataSetArray.count == 2 &&
         sectionData.sectionHeader == "header" &&
         sectionData.sectionFooter == "footer" &&
         sectionData.sectionTotalCellCount == 15, "SectionData should be created with proper data")
   }

   func testSectionCellCountWithOneCellSet(){
      var sectionData = SPListingSectionData(CellDataSets: [cellDataSet1])
      XCTAssert(sectionData.cellDataSetArray.count == 1 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 12, "SectionData should be created with proper data")
   }
   
   func testSectionCellSetAppend(){
      sectionData.cellDataSetArray.append(cellDataSet3)
      XCTAssert(sectionData.cellDataSetArray.count == 3 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 17, "SectionData should be created with proper data")
   }
   
   func testSectionCellSetEdit(){
      sectionData.cellDataSetArray[1] = cellDataSet3
      XCTAssert(sectionData.cellDataSetArray.count == 2 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 14, "SectionData should be created with proper data")
   }
   
   func testSectionCellSetRemove(){
      sectionData.cellDataSetArray.removeLast()
      XCTAssert(sectionData.cellDataSetArray.count == 1 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 12, "SectionData should be created with proper data")
   }

   func testSectionCellSetRemoveAll(){
      sectionData.cellDataSetArray.removeAll(keepCapacity: false)
      XCTAssert(sectionData.cellDataSetArray.count == 0 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 0, "SectionData should be created with proper data")
   }
   
   func testSectionCellSetFill(){
      sectionData.cellDataSetArray.removeAll(keepCapacity: false)
      sectionData.cellDataSetArray = [cellDataSet3]
      XCTAssert(sectionData.cellDataSetArray.count == 1 &&
         sectionData.sectionHeader == nil &&
         sectionData.sectionFooter == nil &&
         sectionData.sectionTotalCellCount == 2, "SectionData should be created with proper data")
   }


}
