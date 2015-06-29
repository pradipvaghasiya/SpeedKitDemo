//
//  SDListingTableVC.swift
//  SwiftUIDemo
//
//  Created by ibm on 29/06/15.
//  Copyright © 2015 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI

let kSegueToSDListingTableVC = "Show SDListingTableVC"
class SDListingTableVC: UIViewController, SPTableListingControllerType {
   var tableData : ListingData<TableViewSection> = []
   @IBOutlet weak var tableview: SPTableView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.tableview.controller = self
   }

   func tableListingData(tableView: UITableView) -> ListingData<TableViewSection> {
      return tableData
   }
}
