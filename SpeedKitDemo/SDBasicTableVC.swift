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

// Different Cell Type including prototype cell and by code
//private let kHeaderNFooterTestCaseString = "Header & Footer"
//private let kMultipleSectionsTestCaseString = "Multiple Sections"
//private let kDifferentCellDataSetsTestCaseString = "Different Cell Data Set in a Section"  // Tracking callback event from cell or didSelect would be crucial
//private let kVariableRowHeightsTestCaseString = "Automatic Variable Row heights"
//private let kTableViewFooterTestCaseString = "Footer using tableView Property"
private let kRuntimeChangesTestCaseString = "Runtime changes in Listing Data"  // Check performance, ease of use.
private let kExcessiveRowsTestCaseString = "100,000 Rows"   // Check Performance Memory uti, CPU util.
private let kTableViewDifferentFrameTestCaseString = "Different Table View Frame"  // Check performance, ease of use.
private let kEdtingTableTestCaseString = "Editing TableView"
private let kNoDataTestCaseString = "No Listing Data"
private let kNoDelegateTestCaseString = "No delegate"
private let kUnregisteredNibAddedTestCaseString = "Unregistered nib added"
private let kGroupedTableViewTestCaseString = "Grouped TableView"


class SDBasicTableVC: UIViewController {
    // List of Test Cases
    private var testCases = [
        kRuntimeChangesTestCaseString,
        kExcessiveRowsTestCaseString,
        kTableViewDifferentFrameTestCaseString,
        kEdtingTableTestCaseString,
        kNoDataTestCaseString,
        kNoDelegateTestCaseString,
        kUnregisteredNibAddedTestCaseString,
        kGroupedTableViewTestCaseString]
    
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
extension SDBasicTableVC : UITableViewDelegate{
    func addBasicTableView(){
        var spTableView = SPTableView(frame: self.view.frame)
        
        // Set SPListingData
        var spListingData = SPTitleLabelCell.getBasicDefaultSPListingData(UsingStringArray: testCases)
        spTableView.spListingData = spListingData
        
        // Set Delegate
        spTableView.delegate = self
        
        // Add SPTableView
        self.view.addSubview(spTableView)
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        switch testCases[indexPath.row]{
        case kRuntimeChangesTestCaseString:
            self.performSegueWithIdentifier(kSegueToSDRuntimeChangesTestCaseVC, sender: self)
        default:
            true
        }
    }
}
