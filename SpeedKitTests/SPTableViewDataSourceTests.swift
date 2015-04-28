//
//  SPTableViewDataSourceTests.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 25/04/15.
//  Copyright (c) 2015 Happyfall. All rights reserved.
//

import UIKit
import XCTest
import SpeedKitDemo

class SPTableViewDataSourceTests: XCTestCase {
   
   class SPListingViewProtocolTestClass : SPListingViewProtocol{
      var spListingData : SPListingData = SPListingData(SectionArray: [])
   }
   
   var listingViewProtocolTestClass = SPListingViewProtocolTestClass()
   var listingViewProtocolTestClassWithOneSection = SPListingViewProtocolTestClass()
   var listingViewProtocolTestClassWithMultipleSection = SPListingViewProtocolTestClass()

   
   var emptyDatasource = SPTableViewDatasource(SPListingViewProtocolTestClass())
   var oneSectionDatasource = SPTableViewDatasource(SPListingViewProtocolTestClass())
   var twoSectionDatasource = SPTableViewDatasource(SPListingViewProtocolTestClass())
   
   override func setUp() {
      super.setUp()
      // Put setup code here. This method is called before the invocation of each test method in the class.
      emptyDatasource = SPTableViewDatasource(listingViewProtocolTestClass)

      listingViewProtocolTestClassWithOneSection.spListingData.spListingSectionArray.append(SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellCount: 12, cellCommonModel: "CommonModel"),
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellModel: ["1","2","3"])
         ]))
      oneSectionDatasource = SPTableViewDatasource(listingViewProtocolTestClassWithOneSection)
      
      listingViewProtocolTestClassWithMultipleSection.spListingData.spListingSectionArray.append(SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellCount: 12, cellCommonModel: "CommonModel"),
            SPListingCellGroup(cellId: "SPTitleLabelCell", cellModel: ["1","2","3"], cellType : SPCellType.SubclassCell)
         ]))

      listingViewProtocolTestClassWithMultipleSection.spListingData.spListingSectionArray.append(SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "SpeedKitDemo.SPTitleLabelCell", cellModel: ["1","2","3"], cellType : SPCellType.SubclassCell),
            SPListingCellGroup(cellId: "UITableViewCell", cellModel: ["4","5","6"], cellType : SPCellType.SubclassCell)
         ]))
      
      listingViewProtocolTestClassWithMultipleSection.spListingData.spListingSectionArray.append(SPListingSection(
         CellGroups: [
            SPListingCellGroup(cellId: "InvalidPrototypeCell", cellModel: ["1","2","3"], cellType : SPCellType.PrototypeCell),
            SPListingCellGroup(cellId: "PrototypeCell", cellModel: ["4","5","6"], cellType : SPCellType.PrototypeCell)
         ]))

      twoSectionDatasource = SPTableViewDatasource(listingViewProtocolTestClassWithMultipleSection)

   }
   
   override func tearDown() {
      
      listingViewProtocolTestClass.spListingData = SPListingData(SectionArray: [])
      listingViewProtocolTestClassWithOneSection.spListingData = SPListingData(SectionArray: [])
      listingViewProtocolTestClassWithMultipleSection.spListingData = SPListingData(SectionArray: [])
      
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
      
   }
   
   // MARK: Init Test Cases
   func testNoOfSectionsWithEmptySectionArray(){
      
      XCTAssert(emptyDatasource.delegate?.spListingData.sectionCount == 0, "Delegate should be created")
   }
   
   func testNoOfSectionsWithSectionArray(){
      XCTAssert(emptyDatasource.numberOfSectionsInTableView(UITableView()) == 0 &&
         oneSectionDatasource.numberOfSectionsInTableView(UITableView()) == 1 &&
         twoSectionDatasource.numberOfSectionsInTableView(UITableView()) == 3, "Section count should be Valid")
   }
   
   func testNoOfRowsInSection(){
      XCTAssert(emptyDatasource.tableView(UITableView(), numberOfRowsInSection: 0) == 0 &&
         oneSectionDatasource.tableView(UITableView(), numberOfRowsInSection: 0) == 15 &&
         oneSectionDatasource.tableView(UITableView(), numberOfRowsInSection: 1) == 0 &&
         twoSectionDatasource.tableView(UITableView(), numberOfRowsInSection: 0) == 15 &&
         twoSectionDatasource.tableView(UITableView(), numberOfRowsInSection: 1) == 6 &&
         twoSectionDatasource.tableView(UITableView(), numberOfRowsInSection: 2) == 6, "Rows count should be valid")
   }
   
   
   func testCellAtIndexPathWithNilCellId(){
      var cell = twoSectionDatasource.tableView(UITableView(), cellForRowAtIndexPath: NSIndexPath(forRow: 12, inSection: 0))
      XCTAssertNotNil(cell, "Default Cell should be created using Nil Cell Id")
   }
   
   func testCellAtIndexPathWithInvalidCell(){
      var tableView = UITableView()
      tableView.registerClass(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "UITableViewCell")
      tableView.dataSource = twoSectionDatasource
      
      var cell = twoSectionDatasource.tableView(tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 3, inSection: 1))
      XCTAssertNotNil(cell, "Default Cell should be created If not conform to SPListingViewProtocol")
   }

   func testCellAtIndexPathWithNibCell(){
      var tableView = UITableView()
      tableView.registerNib(UINib(nibName: "SPTitleLabelCell", bundle: nil), forCellReuseIdentifier: "SPTitleLabelCell")
      tableView.dataSource = twoSectionDatasource
      
      var cell = twoSectionDatasource.tableView(tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
      
      XCTAssert(NSStringFromClass(cell.classForCoder) == "SpeedKitDemo.SPTitleLabelCell", "Nib Cell should be created")
   }
   
   func testCellAtIndexPathWithoutRegisteringNib(){
      var cell = twoSectionDatasource.tableView(UITableView(), cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
      
      XCTAssertNotNil(cell, "Default Cell should be created.")
   }
   
   
   func testCellAtIndexPathWithSubClassCell(){
      var tableView = UITableView()
      tableView.registerClass(NSClassFromString("SpeedKitDemo.SPTitleLabelCell"), forCellReuseIdentifier: "SpeedKitDemo.SPTitleLabelCell")
      tableView.dataSource = twoSectionDatasource
      
      var cell = twoSectionDatasource.tableView(tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 1))
      
      XCTAssert(NSStringFromClass(cell.classForCoder) == "SpeedKitDemo.SPTitleLabelCell", "SubClass Cell should be created")
   }
   
   
   func testCellAtIndexPathWithoutRegisteringSubclass(){
      var cell = twoSectionDatasource.tableView(UITableView(), cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 1))
      
      XCTAssertNotNil(cell, "Default Cell should be created.")
   }
   
   func testCellAtIndexPathWithPrototypeCell(){
      XCTAssert(false, "Pending Impl")

   }
   
   func testCellAtIndexPathWithInvalidPrototypeCell(){
      var cell = twoSectionDatasource.tableView(UITableView(), cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 2))
      XCTAssertNotNil(cell, "Default Cell should be created.")
   }
   
   
   // configure cell protocol
   // header n footer
   

}
