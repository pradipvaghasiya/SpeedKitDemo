//
//  SDHeaderFooterTestCaseVC.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 17/04/15.
//  Copyright (c) 2015 Happyfall. All rights reserved.
//

import UIKit

class SDHeaderFooterTestCaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Header and Footer"
        
        // Add TableView using SpeedKit
        self.addBasicTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: SDBasicTableView Handling
extension SDHeaderFooterTestCaseVC : UITableViewDelegate{
    func addBasicTableView(){
        var spTableView = SPTableView(frame: self.view.frame)
        
        var section0 = ["section 0, Row 1","section 0, Row 2","section 0, Row 3"]
        var section1 = ["section 1, Row 1","section 1, Row 2","section 1, Row 3"]

        // CellModel Section 0
        var spTitleLabelSection0CellModelArray : [SPTitleLabelCellModel] = []
        
        for rowTitle in section0{
            spTitleLabelSection0CellModelArray.append(SPTitleLabelCellModel(TitleText: rowTitle))
        }
        
        // CellModel Section 1
        var spTitleLabelSection1CellModelArray : [SPTitleLabelCellModel] = []
        
        for rowTitle in section1{
            spTitleLabelSection1CellModelArray.append(SPTitleLabelCellModel(TitleText: rowTitle))
        }

        
        var spListingSection0CellData = SPListingCellGroup(cellId: kCellIdSPTitleLabelCell,
            cellModel: spTitleLabelSection0CellModelArray)
        
        var spListingSection1CellData = SPListingCellGroup(cellId: kCellIdSPTitleLabelCell,
            cellModel: spTitleLabelSection1CellModelArray)

        
        var spListingSection0Data = SPTableViewSection(CellGroups: [spListingSection0CellData])
        spListingSection0Data.sectionHeader = "Section 0 Header String"
        spListingSection0Data.sectionFooter = "Section 0 Footer String"
        
        var spListingSection1Data = SPTableViewSection(CellGroups: [spListingSection1CellData])
        spListingSection1Data.sectionHeader = "Section 1 Header String"
        spListingSection1Data.sectionFooter = "Section 1 Footer String"

        // Set SPListingData
        var spListingData = SPListingData(SectionArray: [spListingSection0Data,spListingSection1Data])
        spTableView.spListingData = spListingData
        
        // Set Delegate
        spTableView.delegate = self
        
        // Add SPTableView
        self.view.addSubview(spTableView)
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

