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

class SDRuntimeChangesTestCaseVC: UIViewController,SPTableListingControllerType {
   
   @IBOutlet weak var spTableView: SPTableView!
   
   var listingData : ListingData<TableViewSection> = ListingData(sections: [])
}

// MARK: ViewController Delegate
extension SDRuntimeChangesTestCaseVC{
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Add TableView using SpeedKit
      self.addBasicTableView()
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}

// MARK: SDBasicTableView Handling
extension SDRuntimeChangesTestCaseVC : UITableViewDelegate{
   func addBasicTableView(){
      
      //spTableView.rowHeight = UITableViewAutomaticDimension;
      spTableView.estimatedRowHeight = 44.0; // set to whatever your "average" cell height is
      
      // Set SPListingData
      let section0 = ["section 0, Row 1","section 0, Row 2","section 0, Row 3"]
      let section1 = ["section 1, Row 1","section 1, Row 2","section 1, Row 3 with long description3 with long description3 with long description3 with long description3 with long description"]
      
   // CellDataSet (Of Type SPTitleLabelCell) in Section 0
      // Cell Data Model
      var spTitleLabelSection0CellModelArray : [ViewModelType] = []
      
      for rowTitle in section0{
         spTitleLabelSection0CellModelArray.append(SPTitleLabelCellModel(TitleText: rowTitle))
      }
      
   // CellData Set1 in Section 1
      // Cell Data Model
      var spTitleLabelSection1CellModelArray : [ViewModelType] = []
      
      for rowTitle in section1{
         spTitleLabelSection1CellModelArray.append(SPTitleLabelCellModel(TitleText: rowTitle))
      }
      
      
      let section0Data = TableViewSection(viewModels: spTitleLabelSection0CellModelArray)
      section0Data.sectionHeader = "Section 0 Header String"
      section0Data.sectionFooter = "Section 0 Footer String"
      
      let section1Data = TableViewSection(viewModels: spTitleLabelSection1CellModelArray)
      section1Data.sectionHeader = "Section 1 Header String"
      section1Data.sectionFooter = "Section 1 Footer String"
      
      // Set SPListingData
      listingData = ListingData(sections: [section0Data,section1Data])
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
      listingData[0].append(SPTitleLabelCellModel(TitleText: item))
      return NSIndexPath(forRow: listingData[0].count - 1, inSection: 0)
   }
   
   ///Removes last item in first cellData types in first section SPListingData.
   ///
   ///:returns: NSIndexPath? where the item added. nil if no data.
   private func removeItem() -> NSIndexPath?{
      if listingData[0].count == 0{
         return nil
      }

      listingData[0].items.removeLast()
      
      return NSIndexPath(forRow: listingData[0].count, inSection: 0)
      
   }
   
   ///Edits item at given indexPath
   ///
   ///:param: indexPAth Item needs to be edited.
   private func editItem(indexPAth: NSIndexPath){
      ///Gets CellData Set and exact index of it.
//      if let (spListingCellData, index) = spListingData.getListingCellGroupWithIndexOfCellModelArray(ForIndexPath: indexPAth){
//         // If it is of type SPTitleLabelCellModel then change it.
//         if let spTitleLabelCellModel = spListingCellData[index] as? SPTitleLabelCellModel{
//            spTitleLabelCellModel.titleText = "RowDetail Edited"
//         }
//      }
   }
   
   
}
