//
//  ViewController.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 09/07/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SPTableViewControllerProtocol {
    
    @IBOutlet var tableView : UITableView
    var spTableViewDataSource : SPTableViewDataSource = SPTableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        
        spTableViewDataSource.datasource = [
            // Section 0
            [
                SPTableViewCellData(cellId: kCellIdSampleTableViewCell,cellCount: 1),
                SPTableViewCellData(cellId: "Prototype Cell",cellCount: 20000, cellViewType:SPCellViewType.FromPrototypeCell)
            ],
            // Section 1
            [
                SPTableViewCellData(cellId: kCellIdSampleTableViewCell, cellCount: 2),
            ]];
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sayHello(){
        println("Pradip")
    }
    
}

