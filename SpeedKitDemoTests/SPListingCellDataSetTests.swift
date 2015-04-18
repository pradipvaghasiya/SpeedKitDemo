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
   var cellCommonModel : AnyObject? = "Common Model"
   var inValidNibCellId : String = "Invalid Nib Cell"
   var inValidSubClassCellId : String = "Invalid Nib Cell"
   var validNibId : String = "SPTitleLabelCell"
   var validSubClassCellId : String = "Subclass Cell"
   
    override func setUp() {
        super.setUp()
      
   }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWithValidNibCellType() {
      var spListingCellDataSet = SPListingCellDataSet(cellId: validNibId, cellModel: cellModel, cellViewType: SPCellViewType.NibCell)
      
      XCTAssertNotNil(spListingCellDataSet.cellId, "CellDataSet Created for Valid Nib")
    }
   
   func testWithInValidNibCellType() {
      var spListingCellDataSet = SPListingCellDataSet(cellId: inValidNibCellId, cellModel: cellModel, cellViewType: SPCellViewType.NibCell)
      
      XCTAssertNil(spListingCellDataSet.cellId, "CellDataSet is not Created for Valid Nib")
   }

}
