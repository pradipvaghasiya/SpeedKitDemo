//
//  SDHomeViewController.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 09/07/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import UIKit

///Home Controller of SpeedKit Demo Project. It contains different use cases which can be implemented using SpeedKit.
class SDHomeViewController: UIViewController {
    
    ///As per SPListingTableVC description
    ///
    ///1. You need to set spListingData - Listing Automation Compatible. When you change spListingData you must call reloadSPListingTableVC method.
    var spListingData : SPListingData = SPListingData([])
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
                    cellId: kCellIdSPTitleLabelCell,
                    cellModel:[SPTitleLabelCellModel(TitleText: "Sample Data")])
                ])
            section0.sectionHeader = "TableView Listing"
            
            section0.cellDataArray[0] = SPListingCellData(
                cellId: kCellIdSPTitleLabelCell,
                cellModelCommon: SPTitleLabelCellCommonModel(TextAlignment: NSTextAlignment.Center),
                cellModel:[SPTitleLabelCellModel(TitleText: "Sample Data1"),
                SPTitleLabelCellModel(TitleText: "Sample Data2"),
                SPTitleLabelCellModel(TitleText: "Sample Data3")])
            
            var spListingCellData = section0.cellDataArray[0]
            
            var section1 = SPListingSectionData(Rows: [
                SPListingCellData(
                    cellId: kCellIdSPTitleLabelCell,
                    cellCount: 5,
                    cellModelCommon:SPTitleLabelCellModel(TitleText: "Sample Data"))
                ], sectionHeader: "CollectionView Listing")
            
            spListingData = SPListingData([section0,section1]);
            
            listingVC.spListingData = spListingData
            listingVC.delegate = self
            SPUIHelper.add(child: listingVC, into: self, atPosition: self.view.frame)
        }
    }
}

extension SDHomeViewController : SPListingTableVCDelegateProtocol{
    /// This method will get called on tableview row selection
    func spTableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}


