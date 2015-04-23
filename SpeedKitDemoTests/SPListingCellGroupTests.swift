//
//  SPListingCellGroupTests.swift
//  SPListingCellGroupTests
//
//  Created by Pradip Vaghasiya on 09/07/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import XCTest

class SPListingCellGroupTests: XCTestCase {
   var spListingCellGroupWithAllDetails : SPListingCellGroup?
   
   var emptyCellModel : [AnyObject] = []
   var cellModel : [AnyObject] = ["model1","model2"]
   var emptyCellCommonModel : AnyObject?
   var cellCommonModel : String = "Common Model"
  
   var validNibId : String = "SPTitleLabelCell"
   var validSubClassCellId : String = "SPTitleLabelCell"
   var validPrototypeCellId : String = "Valid Prototype" // Anyway SPListingCellGroup can not check validity.
   
   var inValidCellId : String = "InvalidNibCell"
  
   override func setUp() {
      super.setUp()
      
      spListingCellGroupWithAllDetails = SPListingCellGroup(
         cellId: validNibId,
         cellCommonModel: cellCommonModel,
         cellModel: cellModel,
         cellType: .NibCell)
      
   }
   
   override func tearDown() {
      
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
   }
   
   // MARK: CellDataSet Init Test Cases
   func testWithValidNibCellId() {
      var spListingCellGroup = SPListingCellGroup(cellId: validNibId, cellModel: cellModel, cellType: SPCellType.NibCell)
      
      XCTAssertNotNil(spListingCellGroup.cellId, "CellDataSet Cell Id should not be nil.")
   }
   
   func testWithInValidNibCellId() {
      var spListingCellGroup = SPListingCellGroup(cellId: inValidCellId, cellModel: cellModel, cellType: SPCellType.NibCell)
      
      XCTAssertNil(spListingCellGroup.cellId, "CellDataSet Cell Id should be nil.")
   }
   
   func testWithValidPrototypeCellId() {
      var spListingCellGroup = SPListingCellGroup(cellId: validPrototypeCellId, cellModel: cellModel, cellType: SPCellType.PrototypeCell)
      
      XCTAssertNotNil(spListingCellGroup.cellId, "CellDataSet Cell Id should not be nil.")
   }
   
   func testWithInValidPrototypeCellId() {
      var spListingCellGroup = SPListingCellGroup(cellId: inValidCellId, cellModel: cellModel, cellType: SPCellType.PrototypeCell)

      XCTAssertNotNil(spListingCellGroup.cellId, "CellDataSet Cell Id should not be nil.")
   }
   
   func testWithValidSubclassCellId() {
      var spListingCellGroup = SPListingCellGroup(cellId: validSubClassCellId, cellModel: cellModel, cellType: SPCellType.SubclassCell)
      
      XCTAssertNotNil(spListingCellGroup.cellId, "CellDataSet Cell Id should not be nil.")
   }
   
   func testWithInValidSubclassCellId() {
      var spListingCellGroup = SPListingCellGroup(cellId: inValidCellId, cellModel: cellModel, cellType: SPCellType.SubclassCell)
      
      XCTAssertNil(spListingCellGroup.cellId, "CellDataSet Cell Id should be nil.")
   }

   func testPositiveCellCountValue(){
      var spListingCellGroup = SPListingCellGroup(cellId: validNibId, cellCount: 10, cellCommonModel: cellCommonModel)
      
      XCTAssert(spListingCellGroup.cellCount == 10, "Cellcount should be 10.")
   }

   func testZeroCellCountValue(){
      var spListingCellGroup = SPListingCellGroup(cellId: validNibId, cellCount: 0, cellCommonModel: cellCommonModel)
      
      XCTAssert(spListingCellGroup.cellCount == 0, "Cellcount should be zero")
   }

   func testOnlyCellModelArray(){
      var spListingCellGroup = SPListingCellGroup(cellId: validNibId, cellModel: cellModel)
      
      XCTAssert(spListingCellGroup.cellModelArray.count == 2 &&
         spListingCellGroup.cellId == validNibId &&
         spListingCellGroup.cellCount == UInt(cellModel.count) &&
         spListingCellGroup.cellType == .NibCell, "SPListingCellGroup Should be Created properly")

   }
   
   func testOnlyCellCommonModel(){
      var spListingCellGroup = SPListingCellGroup(cellId: validNibId, cellCount: 5, cellCommonModel: cellCommonModel)
      
      XCTAssert(spListingCellGroup.cellModelArray.count == 0 &&
         spListingCellGroup.cellId == validNibId &&
         spListingCellGroup.cellType == .NibCell &&
         spListingCellGroup.cellCount == 5 &&
         (spListingCellGroup.cellCommonModel! as? String) == cellCommonModel, "SPListingCellGroup Should be Created properly")
   }
   
   func testBothCellModelAndCellCommonModel(){
      var spListingCellGroup = SPListingCellGroup(cellId: validNibId, cellCommonModel: cellCommonModel, cellModel: cellModel, cellType: .PrototypeCell)
      
      XCTAssert(spListingCellGroup.cellModelArray.count == cellModel.count &&
         spListingCellGroup.cellId == validNibId &&
         spListingCellGroup.cellType == .PrototypeCell &&
         spListingCellGroup.cellCount == UInt(cellModel.count) &&
         (spListingCellGroup.cellCommonModel! as? String) == cellCommonModel, "SPListingCellGroup Should be Created properly")

   }
   
   func testBothEmptyCellModelAndCellCommonModel(){
      var spListingCellGroup = SPListingCellGroup(cellId: validNibId, cellCommonModel: "" , cellModel: [], cellType: .PrototypeCell)
      
      XCTAssert(spListingCellGroup.cellModelArray.count == 0 &&
         spListingCellGroup.cellId == validNibId &&
         spListingCellGroup.cellType == .PrototypeCell &&
         spListingCellGroup.cellCount == 0 &&
         (spListingCellGroup.cellCommonModel! as? String) == "", "SPListingCellGroup Should be Created properly")
      
   }
   
   
   // MARK: Cell Data Set At Runtime
   func testUpdateCellIdWithInvalidId(){
      if let cellData = spListingCellGroupWithAllDetails {
         cellData.cellId = inValidCellId
         XCTAssertNil(cellData.cellId, "CellDataSet Cell Id should be nil.")
      }
   }
   
   func testUpdateCellIdWithValidId(){
      if let cellData = spListingCellGroupWithAllDetails {
         cellData.cellId = validNibId
         XCTAssertNotNil(cellData.cellId, "CellDataSet Cell Id should not be nil.")
      }
   }
   
   func testAppendCellModelDirectly(){
      if let cellData = spListingCellGroupWithAllDetails {
         cellData.cellModelArray.append("model3")
         XCTAssert(cellData.cellModelArray.count == 3 &&
            cellData.cellCount == 3 &&
            (cellData.cellModelArray.last as? String) == "model3", "SPListingCellGroup Should be valid after update")
      }
   }

   func testRemoveCellModelDirectly(){
      if let cellData = spListingCellGroupWithAllDetails {
         cellData.cellModelArray.removeLast()
         XCTAssert(cellData.cellModelArray.count == 1 &&
            cellData.cellCount == 1 &&
            (cellData.cellModelArray.last as? String) == "model1", "SPListingCellGroup Should be valid after update")
      }
   }
   
   func testEditCellModelDirectly(){
      if let cellData = spListingCellGroupWithAllDetails {
         cellData.cellModelArray[1] = "model2 edited"
         XCTAssert(cellData.cellModelArray.count == 2 &&
            cellData.cellCount == 2 &&
            (cellData.cellModelArray.last as? String) == "model2 edited", "SPListingCellGroup Should be valid after update")
      }
   }
   
   func testAppendCellModelCopying(){
      if let cellData = spListingCellGroupWithAllDetails {
         var cellModelArrayCopy = cellData.cellModelArray
         cellModelArrayCopy.append("model3")
         cellData.cellModelArray = cellModelArrayCopy
         XCTAssert(cellData.cellModelArray.count == 3 &&
            cellData.cellCount == 3 &&
            (cellData.cellModelArray.last as? String) == "model3", "SPListingCellGroup Should be valid after update")
      }
   }
   
   func testRemoveCellModelCopying(){
      if let cellData = spListingCellGroupWithAllDetails {
         var cellModelArrayCopy = cellData.cellModelArray
         cellModelArrayCopy.removeLast()
         cellData.cellModelArray = cellModelArrayCopy

         XCTAssert(cellData.cellModelArray.count == 1 &&
            cellData.cellCount == 1 &&
            (cellData.cellModelArray.last as? String) == "model1", "SPListingCellGroup Should be valid after update")
      }
   }
   
   func testEditCellModelCopying(){
      if let cellData = spListingCellGroupWithAllDetails {
         var cellModelArrayCopy = cellData.cellModelArray
         cellModelArrayCopy[1] = "model2 edited"
         cellData.cellModelArray = cellModelArrayCopy

         XCTAssert(cellData.cellModelArray.count == 2 &&
            cellData.cellCount == 2 &&
            (cellData.cellModelArray.last as? String) == "model2 edited", "SPListingCellGroup Should be valid after update")
      }
   }
   
   func testEmptyCellModel(){
      if let cellData = spListingCellGroupWithAllDetails {
         cellData.cellModelArray.removeAll(keepCapacity: false)
         
         XCTAssert(cellData.cellModelArray.count == 0 &&
            cellData.cellCount == 0, "SPListingCellGroup Should be valid after update")
      }
   }
   
   func testfillCellModel(){
      if let cellData = spListingCellGroupWithAllDetails {
         cellData.cellModelArray.removeAll(keepCapacity: false)
         cellData.cellModelArray = cellModel
         XCTAssert(cellData.cellModelArray.count == 2 &&
            cellData.cellCount == 2, "SPListingCellGroup Should be valid after update")
      }
   }

   func testEmptyCellCommonModel(){
      if let cellData = spListingCellGroupWithAllDetails {
         cellData.cellCommonModel = nil
         XCTAssert(cellData.cellCommonModel == nil, "SPListingCellGroup Should be valid after update")
      }
   }
   
   func testFillCellCommonModel(){
      if let cellData = spListingCellGroupWithAllDetails {
         cellData.cellCommonModel = nil
         cellData.cellCommonModel = cellCommonModel
         XCTAssert((cellData.cellCommonModel as? String) == "Common Model", "SPListingCellGroup Should be valid after update")
      }
   }
   
   func testUpdateCellCountToInvalidValue(){
      if let cellData = spListingCellGroupWithAllDetails {
         cellData.cellCount = 0   // assigning 0 though model array count is 2.
         XCTAssert(cellData.cellCount == 2, "SPListingCellGroup Should be valid after update")
      }
   }

   func testUpdateCellCountWithOnlyCommonModel(){
      var cellData = SPListingCellGroup(cellId: validNibId, cellCount: 5, cellCommonModel: cellCommonModel)
      cellData.cellCount = 10
      XCTAssert(cellData.cellCount == 10, "SPListingCellGroup Should be valid after update")
   }
   
}

