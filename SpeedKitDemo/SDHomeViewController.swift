//
//  SDHomeViewController.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 09/07/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import UIKit

class SDHomeViewController: UIViewController {
    
//    SPListingViewControllerProtocol
    var spListingData : SPListingData = SPListingData([])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Add Table View Controller using speedkit framework
        self.addTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        println("didReceiveMemoryWarning")
    }
}


//MARK: Add Table View

extension SDHomeViewController{
    func addTableView(){
        if let listingVC = SPListingTableVC.getNewInstance(){
            var section0 = SPListingSectionData(Cells: [
                SPListingCellData(
                    cellId: kCellIdSampleTableViewCell,
                    cellCount: 3,
                    cellModelCommon:SampleTableViewCellModel(TitleText: "Sample Data"))
                ])
            section0.sectionHeader = "TableView Listing"
            
            var section1 = SPListingSectionData(Rows: [
                SPListingCellData(
                    cellId: kCellIdSampleTableViewCell,
                    cellCount: 5,
                    cellModelCommon:SampleTableViewCellModel(TitleText: "Sample Data"))
                ], sectionHeader: "CollectionView Listing")
            
            spListingData = SPListingData([section0,section1]);
            
            listingVC.spListingData = spListingData
            listingVC.delegate = self
            SPListingHelper.add(child: listingVC, into: self, atPosition: self.view.frame)
        }
    }
}

extension SDHomeViewController : SPListingTableVCDelegateProtocol{
    func spTableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}


