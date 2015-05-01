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
   
   var layout = SPFixedColumnRowVerticalLayout(NoOfRows: 10, NoOfColumns: 10)
   
   override func setUp() {
      super.setUp()
      // Put setup code here. This method is called before the invocation of each test method in the class.
      
      layout = SPFixedColumnRowVerticalLayout(NoOfRows: 10, NoOfColumns: 10)
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
   
}
