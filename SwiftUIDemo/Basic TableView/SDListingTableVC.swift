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

class SDListingTableVC: UIViewController{
   var tableData : ListingData = []
   @IBOutlet weak var tableview: SPTableView!
   
   var switchCellModel = SwitchCellModel(title: "Switch Cell", isSwitchOn: true)
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.tableData = [[switchCellModel],[switchCellModel]]
      self.tableData[0].sectionHeader = "header 1"
      self.tableData[1].sectionHeader = "header 2"

      self.tableview.controller = self
      self.tableview.delegate = self
   }
}

extension SDListingTableVC : SPListingControllerType{
   func listingData(listingView : UIView)->ListingData {
      return tableData
   }
}

extension SDListingTableVC : UITableViewDelegate{
   
}


extension SDListingTableVC : SwitchCellDelegate{
   func switchValueChanged(indexPath: NSIndexPath?, viewModel: SwitchCellModel) {
      print(viewModel.isSwitchOn)
      print(indexPath)
   }
}
