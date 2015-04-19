//
//  SPListingCellDataSetTests.swift
//  SPListingCellDataSetTests
//
//  Created by Pradip Vaghasiya on 09/07/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import XCTest

class SPListingCellDataSetTests: XCTestCase {
   
   var emptyCellModel : [AnyObject] = []
   var cellModel : [AnyObject] = ["model1","model2"]
   var emptyCellCommonModel : AnyObject?
   var cellCommonModel : String = "Common Model"
  
   var validNibId : String = "SPTitleLabelCell"
   var validSubClassCellId : String = "SPTitleLabelCell"
   var validPrototypeCellId : String = "Valid Prototype" // Anyway SPListingCellDataSet can not check validity.
   
   var inValidCellId : String = "InvalidNibCell"
  
   override func setUp() {
      super.setUp()
      
   }
   
   override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
   }
   
   // MARK: CellDataSet Init Test Cases
   func testWithValidNibCellId() {
      var spListingCellDataSet = SPListingCellDataSet(cellId: validNibId, cellModel: cellModel, cellViewType: SPCellViewType.NibCell)
      
      XCTAssertNotNil(spListingCellDataSet.cellId, "CellDataSet Cell Id should not be nil.")
   }
   
   func testWithInValidNibCellId() {
      var spListingCellDataSet = SPListingCellDataSet(cellId: inValidCellId, cellModel: cellModel, cellViewType: SPCellViewType.NibCell)
      
      XCTAssertNil(spListingCellDataSet.cellId, "CellDataSet Cell Id should be nil.")
   }
   
   func testWithValidPrototypeCellId() {
      var spListingCellDataSet = SPListingCellDataSet(cellId: validPrototypeCellId, cellModel: cellModel, cellViewType: SPCellViewType.PrototypeCell)
      
      XCTAssertNotNil(spListingCellDataSet.cellId, "CellDataSet Cell Id should not be nil.")
   }
   
   func testWithInValidPrototypeCellId() {
      var spListingCellDataSet = SPListingCellDataSet(cellId: inValidCellId, cellModel: cellModel, cellViewType: SPCellViewType.PrototypeCell)

      XCTAssertNotNil(spListingCellDataSet.cellId, "CellDataSet Cell Id should not be nil.")
   }
   
   func testWithValidSubclassCellId() {
      var spListingCellDataSet = SPListingCellDataSet(cellId: validSubClassCellId, cellModel: cellModel, cellViewType: SPCellViewType.SubclassCell)
      
      XCTAssertNotNil(spListingCellDataSet.cellId, "CellDataSet Cell Id should not be nil.")
   }
   
   func testWithInValidSubclassCellId() {
      var spListingCellDataSet = SPListingCellDataSet(cellId: inValidCellId, cellModel: cellModel, cellViewType: SPCellViewType.SubclassCell)
      
      XCTAssertNil(spListingCellDataSet.cellId, "CellDataSet Cell Id should be nil.")
   }

   func testPositiveCellCountValue(){
      var spListingCellDataSet = SPListingCellDataSet(cellId: validNibId, cellCount: 10, cellModelCommon: cellCommonModel)
      
      XCTAssert(spListingCellDataSet.cellCount == 10, "Cellcount should be zero")
   }

   func testZeroCellCountValue(){
      var spListingCellDataSet = SPListingCellDataSet(cellId: validNibId, cellCount: 0, cellModelCommon: cellCommonModel)
      
      XCTAssert(spListingCellDataSet.cellCount == 0, "Cellcount should be zero")
   }

   func testOnlyCellModelArray(){
      var spListingCellDataSet = SPListingCellDataSet(cellId: validNibId, cellModel: cellModel)
      
      XCTAssert(spListingCellDataSet.cellModelArray.count == 2 &&
         spListingCellDataSet.cellId == validNibId &&
         spListingCellDataSet.cellCount == UInt(cellModel.count) &&
         spListingCellDataSet.cellViewType == .NibCell, "SPListingCellDataSet Created properly")

   }
   
   func testOnlyCellCommonModel(){
      var spListingCellDataSet = SPListingCellDataSet(cellId: validNibId, cellCount: 5, cellModelCommon: cellCommonModel)
      
      XCTAssert(spListingCellDataSet.cellModelArray.count == 0 &&
         spListingCellDataSet.cellId == validNibId &&
         spListingCellDataSet.cellViewType == .NibCell &&
         spListingCellDataSet.cellCount == 5 &&
         (spListingCellDataSet.cellCommonModel! as? String) == cellCommonModel, "SPListingCellDataSet Created properly")
   }
   
   func testBothCellModelAndCellCommonModel(){
      var spListingCellDataSet = SPListingCellDataSet(cellId: validNibId, cellModelCommon: cellCommonModel, cellModel: cellModel, cellViewType: .PrototypeCell)
      
      XCTAssert(spListingCellDataSet.cellModelArray.count == cellModel.count &&
         spListingCellDataSet.cellId == validNibId &&
         spListingCellDataSet.cellViewType == .PrototypeCell &&
         spListingCellDataSet.cellCount == UInt(cellModel.count) &&
         (spListingCellDataSet.cellCommonModel! as? String) == cellCommonModel, "SPListingCellDataSet Created properly")

   }
   
   func testBothEmptyCellModelAndCellCommonModel(){
      var spListingCellDataSet = SPListingCellDataSet(cellId: validNibId, cellModelCommon: "" , cellModel: [], cellViewType: .PrototypeCell)
      
      XCTAssert(spListingCellDataSet.cellModelArray.count == 0 &&
         spListingCellDataSet.cellId == validNibId &&
         spListingCellDataSet.cellViewType == .PrototypeCell &&
         spListingCellDataSet.cellCount == 0 &&
         (spListingCellDataSet.cellCommonModel! as? String) == "", "SPListingCellDataSet Created properly")
      
   }
   
}
