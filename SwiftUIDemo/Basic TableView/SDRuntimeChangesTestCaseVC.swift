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
   
   var spListingData : SPListingData = SPListingData(SectionArray: [])
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
      
      // Set SPListingData
      let section0 = ["section 0, Row 1","section 0, Row 2","section 0, Row 3"]
      let section1 = ["section 1, Row 1","section 1, Row 2","section 1, Row 3"]
      
   // CellDataSet (Of Type SPTitleLabelCell) in Section 0
      // Cell Data Model
      var spTitleLabelSection0CellModelArray : [SPTitleLabelCellModel] = []
      
      for rowTitle in section0{
         spTitleLabelSection0CellModelArray.append(SPTitleLabelCellModel(TitleText: rowTitle))
      }
      
      // Cell Common Model
      let spTitleLabelCellCommonModel = SPTitleLabelCellCommonModel(TextColor: UIColor.darkGrayColor())
      
      let spListingSection0CellData = SPListingCellGroup(
         cellId: kCellIdSPTitleLabelCell,
         cellCommonModel: spTitleLabelCellCommonModel,
         cellModelArray: spTitleLabelSection0CellModelArray)

      
   // CellData Set1 in Section 1
      // Cell Data Model
      var spTitleLabelSection1CellModelArray : [SPTitleLabelCellModel] = []
      
      for rowTitle in section1{
         spTitleLabelSection1CellModelArray.append(SPTitleLabelCellModel(TitleText: rowTitle))
      }
      
      let spListingSection1CellData = SPListingCellGroup(
         cellId: kCellIdSPTitleLabelCell,
         cellModelArray: spTitleLabelSection1CellModelArray)
      
      
      let spListingSection0Data = SPTableViewSection(CellGroups: [spListingSection0CellData])
      spListingSection0Data.sectionHeader = "Section 0 Header String"
      spListingSection0Data.sectionFooter = "Section 0 Footer String"
      
      let spListingSection1Data = SPTableViewSection(CellGroups: [spListingSection1CellData])
      spListingSection1Data.sectionHeader = "Section 1 Header String"
      spListingSection1Data.sectionFooter = "Section 1 Footer String"
      
      // Set SPListingData
      spListingData = SPListingData(SectionArray: [spListingSection0Data,spListingSection1Data])
      spTableView.spListingData = spListingData
      
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
      spTableView.insertRowsAtIndexPaths([self.insertItem("Row Detail")], withRowAnimation: UITableViewRowAnimation.Automatic)
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
      print(spListingData[0][0])
      spListingData[0][0][spListingData[0][0].count] = SPTitleLabelCellModel(TitleText: item)
//      cellModelArray.append(SPTitleLabelCellModel(TitleText: item))
//      spListingData.spListingSectionArray[0].spCellGroupArray[0].cellModelArray = cellModelArray
      
      return NSIndexPath(forRow: spListingData[0][0].count - 1, inSection: 0)
   }
   
   ///Removes last item in first cellData types in first section SPListingData.
   ///
   ///:returns: NSIndexPath? where the item added. nil if no data.
   private func removeItem() -> NSIndexPath?{
      let cellModelArray = spListingData[0][0]
      
      if cellModelArray.count == 0{
         return nil
      }
      
      ///TODO: change this
      //cellModelArray.removeLast()
      
      spListingData[0][0] = cellModelArray
      
      return NSIndexPath(forRow: cellModelArray.count, inSection: 0)
      
   }
   
   ///Edits item at given indexPath
   ///
   ///:param: indexPAth Item needs to be edited.
   private func editItem(indexPAth: NSIndexPath){
      ///Gets CellData Set and exact index of it.
      if let (spListingCellData, index) = spListingData.getListingCellGroupWithIndexOfCellModelArray(ForIndexPath: indexPAth){
         // If it is of type SPTitleLabelCellModel then change it.
         if let spTitleLabelCellModel = spListingCellData[index] as? SPTitleLabelCellModel{
            spTitleLabelCellModel.titleText = "RowDetail Edited"
         }
      }
   }
   
   
}
