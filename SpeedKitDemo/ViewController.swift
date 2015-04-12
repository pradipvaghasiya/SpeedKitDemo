//
//  ViewController.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 09/07/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SPListingViewControllerProtocol {
    
//    SPListingViewControllerProtocol
    var spListingSectionDataArray : [SPListingSectionData] = []
    
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

extension ViewController{
    func addTableView(){
        if let listingVC = SPListingTableVC.getNewInstance(){
            spListingSectionDataArray = [
                // Section 0
                SPListingSectionData(Rows: [
                    SPListingCellData(
                        cellId: kCellIdSampleTableViewCell,
                        cellCount: 3,
                        cellModel:[SampleTableViewCellModel(TitleText: "Sample Data")])
                    ], sectionHeader: "Section 1", sectionFooter: "Footer 1"),
                // Section 1
                SPListingSectionData(Rows: [
                    SPListingCellData(
                        cellId: kCellIdSampleTableViewCell,
                        cellCount: 5,
                        cellModelCommon:SampleTableViewCellModel(TitleText: "Sample Data"))
                    ], sectionHeader: "Section 2", sectionFooter: "Footer 2")];
            
            listingVC.spListingSectionDataArray = spListingSectionDataArray
            
            var tableViewFrame = self.view.frame
            tableViewFrame.origin.y = 20
            tableViewFrame.size.height -= 20
            SPListingHelper.add(child: listingVC, into: self, atPosition: tableViewFrame)

        }
    }
}


