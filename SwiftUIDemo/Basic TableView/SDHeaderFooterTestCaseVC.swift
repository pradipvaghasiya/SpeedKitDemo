//
//  SDHeaderFooterTestCaseVC.swift
//  SwiftUIDemo
//
//  Created by Pradip Vaghasiya on 17/04/15.
//  Copyright (c) 2015 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI

class SDHeaderFooterTestCaseVC: UIViewController {
   var tableData : ListingData = []
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.title = "Header and Footer"
      
      // Add TableView using SwiftUI
      self.addBasicTableView()
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}

extension SDHeaderFooterTestCaseVC : SPListingControllerType{
   func listingData(listingView : UIView)->ListingData {
      return tableData
   }
}

// MARK: SDBasicTableView Handling
extension SDHeaderFooterTestCaseVC : UITableViewDelegate{
   func addBasicTableView(){
      let spTableView = SPTableView(frame: self.view.frame, style: .Plain)
      
      let section0Array = ["section 0, Row 1","section 0, Row 2","section 0, Row 3"]
      let section1Array = ["section 1, Row 1","section 1, Row 2","section 1, Row 3"]
      
      // CellModel Section 0
      let section0 : ListingSection = []
      
      for rowTitle in section0Array{
         section0.append(SPTitleLabelCellModel(TitleText: rowTitle))
      }
      
      // CellModel Section 1
      let section1 : ListingSection = []
      for rowTitle in section1Array{
         section1.append(SPTitleLabelCellModel(TitleText: rowTitle))
      }
      

      section0.sectionHeader = "Section 0 Header String"
      section0.sectionFooter = "Section 0 Footer String"
      
      section1.sectionHeader = "Section 1 Header String"
      section1.sectionFooter = "Section 1 Footer String"
      
      // Set SPListingData
      tableData = [section0,section1]
      spTableView.controller = self
      
      // Set Delegate
      spTableView.delegate = self
      
      // Add SPTableView
      self.view.addSubview(spTableView)
      
   }
   
   func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      tableView.deselectRowAtIndexPath(indexPath, animated: true)
   }
}

