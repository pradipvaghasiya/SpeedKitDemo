//
//  ViewController.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 09/07/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SPListingViewControllerProtocol {
    
    @IBOutlet var tableView : UITableView!
    
//    SPListingViewControllerProtocol
    var spListingSectionDataArray : [SPListingSectionData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.registerNib(UINib(nibName: kCellIdSampleTableViewCell, bundle: nil),forCellReuseIdentifier: kCellIdSampleTableViewCell)
        
        spListingSectionDataArray = [
            // Section 0
            SPListingSectionData(Rows: [
                SPListingCellData(
                    cellId: kCellIdSampleTableViewCell,
                    cellCount: 1,
                    cellModel:[SampleTableViewCellModel(TitleText: "Hello")]),
                
                SPListingCellData(
                    cellId: "Prototype Cell",
                    cellCount: 2,
                    cellViewType:SPCellViewType.FromPrototypeCell)
                ])
            ,
            // Section 1
            SPListingSectionData(Rows: [
                SPListingCellData(
                    cellId: kCellIdSampleTableViewCell,
                    cellCount: 50,
                    cellModelCommon:SampleTableViewCellModel(TitleText: "Hello"))
            ])];
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        println("didReceiveMemoryWarning")
    }
}

