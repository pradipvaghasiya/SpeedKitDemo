//
//  SDBasicTableVC.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 15/04/15.
//  Copyright (c) 2015 Happyfall. All rights reserved.
//

import UIKit

///Storyboard Segue id for segue to this controller
let kSegueToSDBasicTableVC = "Show SDBasicTableVC"

class SDBasicTableVC: UIViewController {
    // List of Test Cases
    private var testCases = ["Header & Footer",
        "Header & Footer as UIViews",
        "Multiple Sections",
        "Different Cell Data Set in a Section",  // Tracking callback event from cell or didSelect would be crucial
        "Automatic Variable Row heights",
        "Tableview Footer",
        "100,000 Rows",   // Check Performance Memory uti, CPU util.
        "Runtime changes in Listing Data",  // Check performance, ease of use.
        "Editing TableView",
        "No Listing Data",
        "No delegate",
        "Negative Scenario - Unregistered nib"]
}

// MARK: ViewController Delegate
extension SDBasicTableVC{

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
extension SDBasicTableVC : SPListingTableVCDelegateProtocol{
    func addBasicTableView(){
        if let basicTableVC = SPListingTableVC.getNewInstance(){
            
            // Set SPListingData
            var spListingData = SPTitleLabelCell.getBasicDefaultSPListingData(UsingStringArray: testCases)
            basicTableVC.spListingData = spListingData
            
            // Set Delegate
            basicTableVC.delegate = self
            
            // Add Child View Controller
            SPUIHelper.add(child: basicTableVC, into: self, atPosition: self.view.frame)
        }
    }
    
    func spTableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
