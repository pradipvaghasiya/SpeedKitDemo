//
//  SDRuntimeChangesTestCaseVC.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 15/04/15.
//  Copyright (c) 2015 Happyfall. All rights reserved.
//

import UIKit

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
        
    }
}

// MARK: IB Actions
extension SDRuntimeChangesTestCaseVC{
    
    @IBAction func addItem(sender: AnyObject) {
        var cellModel = spListingData.spListingSectionDataArray[0].cellDataArray[0].cellModel
        cellModel.append(SPTitleLabelCellModel(TitleText: "Row Detail"))
        spListingData.spListingSectionDataArray[0].cellDataArray[0].cellModel = cellModel
//        self.tableView?.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.Automatic)
        spTableView.insertRowsAtIndexPaths([NSIndexPath(forRow: cellModel.count - 1, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Automatic)
    }

    @IBAction func reduceItem(sender: AnyObject) {
    }

}
