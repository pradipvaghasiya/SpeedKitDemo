//
//  SDRuntimeChangesTestCaseVC.swift
//  SwiftUIDemo
//
//  Created by Pradip Vaghasiya on 15/04/15.
//  Copyright (c) 2015 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI

///Storyboard Segue id for segue to this controller
let kSegueToSDRuntimeChangesTestCaseVC = "Show SDRuntimeChangesTestCaseVC"

class SDRuntimeChangesTestCaseVC: UIViewController {
   
   @IBOutlet weak var spTableView: SPTableView!
   
   var tableData : ListingData<TableViewSection> = []
}

// MARK: ViewController Delegate
extension SDRuntimeChangesTestCaseVC{
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Add TableView using SwiftUI
      self.addBasicTableView()
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}

extension SDRuntimeChangesTestCaseVC: SPTableListingControllerType{
   func tableListingData(tableView: UITableView) -> ListingData<TableViewSection> {
      return tableData
   }
}



// MARK: SDBasicTableView Handling
extension SDRuntimeChangesTestCaseVC : UITableViewDelegate{
   func addBasicTableView(){
      
      //spTableView.rowHeight = UITableViewAutomaticDimension;
      spTableView.estimatedRowHeight = 44.0; // set to whatever your "average" cell height is
      
      let section0Array = ["section 0, Row 1","section 0, Row 2","section 0, Row 3"]
      let section1Array = ["section 1, Row 1","section 1, Row 2","section 1, Row 3"]
      
      // CellModel Section 0
      let section0 : TableViewSection = []
      
      for rowTitle in section0Array{
         section0.append(SPTitleLabelCellModel(TitleText: rowTitle))
      }
      
      // CellModel Section 1
      let section1 : TableViewSection = []
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
   }
   
   func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      self.editItem(indexPath)
      spTableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
   }
}

// MARK: IB Actions
extension SDRuntimeChangesTestCaseVC{
   
   @IBAction func addItem(sender: AnyObject) {
      let indexPath = self.insertItem("Row Detail")
      spTableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
   }
   
   @IBAction func reduceItem(sender: AnyObject) {
      if let indexPath = self.removeItem(){
         spTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
      }else{
         SPUIHelper.showWarningAlert(WithMessage: "No Items", OnViewController: self)
      }
   }
   
   
   ///Inserts item in first cellData types in first section SPListingData.
   ///
   ///:param: item Item needs to be added.
   ///
   ///:returns: NSIndexPath where the item added.
   private func insertItem(item: String) -> NSIndexPath{
      tableData[0].append(SPTitleLabelCellModel(TitleText: item))
      return NSIndexPath(forRow: tableData[0].count - 1, inSection: 0)
   }
   
   ///Removes last item in first cellData types in first section SPtableData.
   ///
   ///:returns: NSIndexPath? where the item added. nil if no data.
   private func removeItem() -> NSIndexPath?{
      if tableData[0].count == 0{
         return nil
      }

      tableData[0].items.removeLast()
      
      return NSIndexPath(forRow: tableData[0].count, inSection: 0)
      
   }
   
   ///Edits item at given indexPath
   ///
   ///:param: indexPAth Item needs to be edited.
   private func editItem(indexPath: NSIndexPath){
      ///Gets CellData Set and exact index of it.
      if let model = tableData[indexPath.section][indexPath.row] as? SPTitleLabelCellModel{
         model.titleText = "RowDetail Edited"
      }
   }
   
   
}
