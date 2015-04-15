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

    @IBOutlet weak var speedKitTableViewContainer: UIView!
  
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
extension SDRuntimeChangesTestCaseVC : SPListingTableVCDelegateProtocol{
    func addBasicTableView(){
        if let basicTableVC = SPListingTableVC.getNewInstance(){
            
            // Set SPListingData
            var spListingData = SPTitleLabelCell.getBasicDefaultSPListingData(UsingStringArray: ["Row 1"])
            basicTableVC.spListingData = spListingData
            
            // Set Delegate
            basicTableVC.delegate = self
            
            // Add Child View Controller
            SPUIHelper.add(child: basicTableVC,
                into: self,
                insideView: self.speedKitTableViewContainer,
                atPosition: self.speedKitTableViewContainer.frame)

            var contentInset = basicTableVC.tableView.contentInset
            contentInset.top = 64
            basicTableVC.tableView.contentInset = contentInset
        }
    }
    
    func spTableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
