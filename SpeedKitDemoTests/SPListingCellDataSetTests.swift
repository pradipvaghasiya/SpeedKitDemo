//
//  SPListingCellDataSetTests.swift
//  SPListingCellDataSetTests
//
//  Created by Pradip Vaghasiya on 09/07/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import XCTest

class SPListingCellDataSetTests: XCTestCase {
   var spListingCellDataSetWithAllDetails : SPListingCellDataSet?
   
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
      
      spListingCellDataSetWithAllDetails = SPListingCellDataSet(
         cellId: validNibId,
         cellModelCommon: cellCommonModel,
         cellModel: cellModel,
         cellViewType: .NibCell)
      
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
      
      XCTAssert(spListingCellDataSet.cellCount == 10, "Cellcount should be 10.")
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
         spListingCellDataSet.cellViewType == .NibCell, "SPListingCellDataSet Should be Created properly")

   }
   
   func testOnlyCellCommonModel(){
      var spListingCellDataSet = SPListingCellDataSet(cellId: validNibId, cellCount: 5, cellModelCommon: cellCommonModel)
      
      XCTAssert(spListingCellDataSet.cellModelArray.count == 0 &&
         spListingCellDataSet.cellId == validNibId &&
         spListingCellDataSet.cellViewType == .NibCell &&
         spListingCellDataSet.cellCount == 5 &&
         (spListingCellDataSet.cellCommonModel! as? String) == cellCommonModel, "SPListingCellDataSet Should be Created properly")
   }
   
   func testBothCellModelAndCellCommonModel(){
      var spListingCellDataSet = SPListingCellDataSet(cellId: validNibId, cellModelCommon: cellCommonModel, cellModel: cellModel, cellViewType: .PrototypeCell)
      
      XCTAssert(spListingCellDataSet.cellModelArray.count == cellModel.count &&
         spListingCellDataSet.cellId == validNibId &&
         spListingCellDataSet.cellViewType == .PrototypeCell &&
         spListingCellDataSet.cellCount == UInt(cellModel.count) &&
         (spListingCellDataSet.cellCommonModel! as? String) == cellCommonModel, "SPListingCellDataSet Should be Created properly")

   }
   
   func testBothEmptyCellModelAndCellCommonModel(){
      var spListingCellDataSet = SPListingCellDataSet(cellId: validNibId, cellModelCommon: "" , cellModel: [], cellViewType: .PrototypeCell)
      
      XCTAssert(spListingCellDataSet.cellModelArray.count == 0 &&
         spListingCellDataSet.cellId == validNibId &&
         spListingCellDataSet.cellViewType == .PrototypeCell &&
         spListingCellDataSet.cellCount == 0 &&
         (spListingCellDataSet.cellCommonModel! as? String) == "", "SPListingCellDataSet Should be Created properly")
      
   }
   
   
   // MARK: Cell Data Set At Runtime
   func testUpdateCellIdWithInvalidId(){
      if let cellData = spListingCellDataSetWithAllDetails {
         cellData.cellId = inValidCellId
         XCTAssertNil(cellData.cellId, "CellDataSet Cell Id should be nil.")
      }
   }
   
   func testUpdateCellIdWithValidId(){
      if let cellData = spListingCellDataSetWithAllDetails {
         cellData.cellId = validNibId
         XCTAssertNotNil(cellData.cellId, "CellDataSet Cell Id should not be nil.")
      }
   }
   
   func testAppendCellModelDirectly(){
      if let cellData = spListingCellDataSetWithAllDetails {
         cellData.cellModelArray.append("model3")
         XCTAssert(cellData.cellModelArray.count == 3 &&
            cellData.cellCount == 3 &&
            (cellData.cellModelArray.last as? String) == "model3", "SPListingCellDataSet Should be valid after update")
      }
   }

   func testRemoveCellModelDirectly(){
      if let cellData = spListingCellDataSetWithAllDetails {
         cellData.cellModelArray.removeLast()
         XCTAssert(cellData.cellModelArray.count == 1 &&
            cellData.cellCount == 1 &&
            (cellData.cellModelArray.last as? String) == "model1", "SPListingCellDataSet Should be valid after update")
      }
   }
   
   func testEditCellModelDirectly(){
      if let cellData = spListingCellDataSetWithAllDetails {
         cellData.cellModelArray[1] = "model2 edited"
         XCTAssert(cellData.cellModelArray.count == 2 &&
            cellData.cellCount == 2 &&
            (cellData.cellModelArray.last as? String) == "model2 edited", "SPListingCellDataSet Should be valid after update")
      }
   }
   
   func testAppendCellModelCopying(){
      if let cellData = spListingCellDataSetWithAllDetails {
         var cellModelArrayCopy = cellData.cellModelArray
         cellModelArrayCopy.append("model3")
         cellData.cellModelArray = cellModelArrayCopy
         XCTAssert(cellData.cellModelArray.count == 3 &&
            cellData.cellCount == 3 &&
            (cellData.cellModelArray.last as? String) == "model3", "SPListingCellDataSet Should be valid after update")
      }
   }
   
   func testRemoveCellModelCopying(){
      if let cellData = spListingCellDataSetWithAllDetails {
         var cellModelArrayCopy = cellData.cellModelArray
         cellModelArrayCopy.removeLast()
         cellData.cellModelArray = cellModelArrayCopy

         XCTAssert(cellData.cellModelArray.count == 1 &&
            cellData.cellCount == 1 &&
            (cellData.cellModelArray.last as? String) == "model1", "SPListingCellDataSet Should be valid after update")
      }
   }
   
   func testEditCellModelCopying(){
      if let cellData = spListingCellDataSetWithAllDetails {
         var cellModelArrayCopy = cellData.cellModelArray
         cellModelArrayCopy[1] = "model2 edited"
         cellData.cellModelArray = cellModelArrayCopy

         XCTAssert(cellData.cellModelArray.count == 2 &&
            cellData.cellCount == 2 &&
            (cellData.cellModelArray.last as? String) == "model2 edited", "SPListingCellDataSet Should be valid after update")
      }
   }
   
   func testEmptyCellModel(){
      if let cellData = spListingCellDataSetWithAllDetails {
         cellData.cellModelArray.removeAll(keepCapacity: false)
         
         XCTAssert(cellData.cellModelArray.count == 0 &&
            cellData.cellCount == 0, "SPListingCellDataSet Should be valid after update")
      }
   }
   
   func testfillCellModel(){
      if let cellData = spListingCellDataSetWithAllDetails {
         cellData.cellModelArray.removeAll(keepCapacity: false)
         cellData.cellModelArray = cellModel
         XCTAssert(cellData.cellModelArray.count == 2 &&
            cellData.cellCount == 2, "SPListingCellDataSet Should be valid after update")
      }
   }

   func testEmptyCellCommonModel(){
      if let cellData = spListingCellDataSetWithAllDetails {
         cellData.cellCommonModel = nil
         XCTAssert(cellData.cellCommonModel == nil, "SPListingCellDataSet Should be valid after update")
      }
   }
   
   func testFillCellCommonModel(){
      if let cellData = spListingCellDataSetWithAllDetails {
         cellData.cellCommonModel = nil
         cellData.cellCommonModel = cellCommonModel
         XCTAssert((cellData.cellCommonModel as? String) == "Common Model", "SPListingCellDataSet Should be valid after update")
      }
   }
   
   func testUpdateCellCountToZero(){
      if let cellData = spListingCellDataSetWithAllDetails {
         cellData.cellCount = 0
         XCTAssert(cellData.cellCount == 2, "SPListingCellDataSet Should be valid after update")
      }
   }

   
}
