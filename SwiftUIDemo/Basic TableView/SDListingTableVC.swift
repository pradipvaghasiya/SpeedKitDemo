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
class SDListingTableVC: UIViewController, SPTableListingControllerType{
   var tableData : ListingData<TableViewSection> = []
   @IBOutlet weak var tableview: SPTableView!
   
   var switchCellModel = SwitchCellModel(title: "Switch Cell", isSwitchOn: true)
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.tableData = [[switchCellModel]]
      self.tableview.controller = self
      self.tableview.delegate = self
   }

   func tableListingData(tableView: UITableView) -> ListingData<TableViewSection> {
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
