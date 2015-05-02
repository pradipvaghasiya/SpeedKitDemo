//
//  SPFixedColumnRowLayoutTests.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 01/05/15.
//  Copyright (c) 2015 Happyfall. All rights reserved.
//

import UIKit
import XCTest

class SPFixedColumnRowLayoutTests: XCTestCase {
   var layout = SPFixedColumnRowLayout(NoOfRows: 3, NoOfColumns: 3)

   override func setUp() {
      super.setUp()
      // Put setup code here. This method is called before the invocation of each test method in the class.
      
      layout = SPFixedColumnRowLayout(NoOfRows: 3, NoOfColumns: 3)
   }
   
   override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
   }
   
}
