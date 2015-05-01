//
//  SPCollectionViewLayoutTests.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 01/05/15.
//  Copyright (c) 2015 Happyfall. All rights reserved.
//

import UIKit
import XCTest

class SPCollectionViewLayoutTests: XCTestCase {
   var layout = SPCollectionViewLayout()
   
   override func setUp() {
      super.setUp()
      // Put setup code here. This method is called before the invocation of each test method in the class.
      
      var layout = SPCollectionViewLayout()
      
   }
   
   override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
   }
   
   func testLayoutCreation() {
      // This is an example of a functional test case.
      XCTAssert(layout.sectionInset.top == 10 &&
         layout.interitemSpacing == 10 &&
         layout.lineSpacing == 10, "Layout Created")
   }
   
}
