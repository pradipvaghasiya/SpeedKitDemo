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

private let kHeaderNFooterTestCaseString = "Header & Footer"
private let kHeaderNFooterAsViewTestCaseString = "Header & Footer as UIViews"
private let kMultipleSectionsTestCaseString = "Multiple Sections"
private let kDifferentCellDataSetsTestCaseString = "Different Cell Data Set in a Section"  // Tracking callback event from cell or didSelect would be crucial
private let kVariableRowHeightsTestCaseString = "Automatic Variable Row heights"
private let kTableViewFooterTestCaseString = "Footer using tableView Property"
private let kExcessiveRowsTestCaseString = "100,000 Rows"   // Check Performance Memory uti, CPU util.
private let kRuntimeChangesTestCaseString = "Runtime changes in Listing Data"  // Check performance, ease of use.
private let kTableViewDifferentFrameTestCaseString = "Different Table View Frame"  // Check performance, ease of use.
private let kEdtingTableTestCaseString = "Editing TableView"
private let kNoDataTestCaseString = "No Listing Data"
private let kNoDelegateTestCaseString = "No delegate"
private let kUnregisteredNibAddedTestCaseString = "Unregistered nib added"


class SDBasicTableVC: UIViewController {
    // List of Test Cases
    private var testCases = [
        kHeaderNFooterTestCaseString,
        kHeaderNFooterAsViewTestCaseString,
        kMultipleSectionsTestCaseString,
        kDifferentCellDataSetsTestCaseString,
        kVariableRowHeightsTestCaseString,
        kTableViewFooterTestCaseString,
        kExcessiveRowsTestCaseString,
        kRuntimeChangesTestCaseString,
        kTableViewDifferentFrameTestCaseString,
        kEdtingTableTestCaseString,
        kNoDataTestCaseString,
        kNoDelegateTestCaseString,
        kUnregisteredNibAddedTestCaseString]
    
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
            SPUIHelper.add(child: basicTableVC, into: self, insideView: self.view, atPosition: self.view.frame)
        }
    }
    
    func spTableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        switch testCases[indexPath.row]{
        case kRuntimeChangesTestCaseString:
            self.performSegueWithIdentifier(kSegueToSDRuntimeChangesTestCaseVC, sender: self)
        default:
            true
        }
    }
}
