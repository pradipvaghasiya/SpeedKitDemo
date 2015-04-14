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
            
            var section0Rows = ["Row 1","Row 2","Row 3","Row 1","Row 2","Row 3","Row 1","Row 2","Row 3","Row 1","Row 2","Row 3"]

            var spTitleLabelCellCommonModel = SPTitleLabelCellCommonModel(TextColor: UIColor.grayColor())
            var spTitleLabelCellModelArray : [SPTitleLabelCellModel] = []
            
            for rowTitle in section0Rows{
                spTitleLabelCellModelArray.append(SPTitleLabelCellModel(TitleText: rowTitle))
            }
            
            var spListingCellData = SPListingCellData(cellId: kCellIdSPTitleLabelCell,
                cellModelCommon: spTitleLabelCellCommonModel,
                cellModel: spTitleLabelCellModelArray)
            
            var spListingSection0Data = SPListingSectionData(Cells: [spListingCellData])
            
            spListingData = SPListingData([spListingSection0Data]);
            
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


