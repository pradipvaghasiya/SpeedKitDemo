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
                        cellCount: 1,
                        cellModel:[SampleTableViewCellModel(TitleText: "Hello")])
                    ]),
                // Section 1
                SPListingSectionData(Rows: [
                    SPListingCellData(
                        cellId: kCellIdSampleTableViewCell,
                        cellCount: 50,
                        cellModelCommon:SampleTableViewCellModel(TitleText: "Hello"))
                    ])];
            
            listingVC.spListingSectionDataArray = spListingSectionDataArray
            
            self.addChildViewController(listingVC)
            listingVC.view.frame = self.view.frame
            self.view.addSubview(listingVC.view)
            listingVC.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
            listingVC.didMoveToParentViewController(self)

        }
    }
}


