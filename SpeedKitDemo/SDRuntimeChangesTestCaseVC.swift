//
//  SDRuntimeChangesTestCaseVC.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 15/04/15.
//  Copyright (c) 2015 Happyfall. All rights reserved.
//

import UIKit


///TODO: Add changes test cases with multiple section and multiple cell Data Sets
///Storyboard Segue id for segue to this controller
let kSegueToSDRuntimeChangesTestCaseVC = "Show SDRuntimeChangesTestCaseVC"

class SDRuntimeChangesTestCaseVC: UIViewController {

    @IBOutlet weak var spTableView: SPTableView!
  
    var spListingData : SPListingData = SPListingData([])
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
        spListingData = SPTitleLabelCell.getBasicDefaultSPListingData(UsingStringArray: ["Row Detail"])
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
    
    
    ///TODO: How to unit test private functions
    ///Inserts item in first cellData types in first section SPListingData.
    ///
    ///:param: item Item needs to be added.
    ///
    ///:returns: NSIndexPath where the item added.
    private func insertItem(item: String) -> NSIndexPath{
        ///TODO: Check how to get addrress reference of cellModel in order to make direct changes.
        var cellModel = spListingData.spListingSectionDataArray[0].cellDataArray[0].cellModel
        cellModel.append(SPTitleLabelCellModel(TitleText: item))
        spListingData.spListingSectionDataArray[0].cellDataArray[0].cellModel = cellModel
        
        return NSIndexPath(forRow: cellModel.count - 1, inSection: 0)
    }
    
    ///Removes last item in first cellData types in first section SPListingData.
    ///
    ///:returns: NSIndexPath? where the item added. nil if no data.
    private func removeItem() -> NSIndexPath?{
        var cellModel = spListingData.spListingSectionDataArray[0].cellDataArray[0].cellModel
        
        if cellModel.count == 0{
            return nil
        }
        
        cellModel.removeLast()
        
        spListingData.spListingSectionDataArray[0].cellDataArray[0].cellModel = cellModel
        
        return NSIndexPath(forRow: cellModel.count, inSection: 0)
        
    }

    ///Edits item at given indexPath
    ///
    ///:param: indexPAth Item needs to be edited.
    private func editItem(indexPAth: NSIndexPath){
        ///Gets CellData Set and exact index of it.
        if let (spListingCellData, index) = spListingData.getCellDataDictionary(IndexPath: indexPAth){
            // If it is of type SPTitleLabelCellModel then change it.
            if let spTitleLabelCellModel = spListingCellData.cellModel[index] as? SPTitleLabelCellModel{
                spTitleLabelCellModel.titleText = "RowDetail Edited"
            }
        }
    }


}
