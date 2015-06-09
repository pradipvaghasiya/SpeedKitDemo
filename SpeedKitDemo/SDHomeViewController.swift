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
   var spListingData : SPListingData = SPListingData(SectionArray: [])
   
   var isVertical : Bool = true
   
   // MARK: ViewController Delegates
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Add Table View Controller using speedkit framework
      self.addTableView()
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
      print("didReceiveMemoryWarning")
   }
}


//MARK: Add Table View
extension SDHomeViewController{
   func addTableView(){
      
      
      //            // To display contents inside listingVC we would need spListingData.
      //            // Below there is stepwise comment to create spListingData.
      //
      //            // Step 1: Create Similar Cell Data required in First Section.
      //            // Here we need all label cells with text in it. So We would create Cell Data containing SPTitleLabelCell Data.
      //
      //                // Step 1.1: Create Cell CommonModel If only required.
      //                var spTitleLabelCellCommonModel = SPTitleLabelCellCommonModel(TextColor: UIColor.darkGrayColor())
      //
      //                // Step 1.2: Create Cell Model Array.
      //                var spTitleLabelCellModelArray : [SPTitleLabelCellModel] = []
      //
      //                for rowTitle in section0Rows{
      //                    spTitleLabelCellModelArray.append(SPTitleLabelCellModel(TitleText: rowTitle))
      //                }
      //
      //                // Step 1.3: Create spListingCellData Instance using above two models.
      //                var spListingCellData = SPListingCellGroup(cellId: kCellIdSPTitleLabelCell,
      //                    cellCommonModel: spTitleLabelCellCommonModel,
      //                    cellModelArray: spTitleLabelCellModelArray)
      //
      //            // Step 2: Create Section data containing different Cell Data set.
      //            // Here we only need one set of Cell Data created above.
      //            var spListingSection0Data = SPListingSection(Cells: [spListingCellData])
      //
      //            // Step 3: Create full listing data containing different sections mentioned above.
      //            // Here we only need one section created above.
      //            spListingData = SPListingData([spListingSection0Data]);
      
      var spTableView = SPTableView(frame: self.view.frame)
      
      // This is the model we need to show in TableView
      var section0Rows = [
         "Basic TableView",
         "Custom TableView",
         "Fixed Column and Row Vertical",
         "Fixed Column and Row Horizontal",
         "Straight Vertical",
         "Straight Space Optimized Vertical",
         "Auto Resizing Straight Vertical"]
      
      // Assign spListingData to SPTableView
      spTableView.spListingData = SPTitleLabelCell.getBasicDefaultSPListingData(UsingStringArray: section0Rows)
      
      // TableView Delegate
      spTableView.delegate = self
      
      //Add spTableView
      self.view.addSubview(spTableView)
      
   }
}

extension SDHomeViewController : UITableViewDelegate{
   func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      tableView.deselectRowAtIndexPath(indexPath, animated: true)
      
      switch(indexPath.row){
      case 0:
         self.performSegueWithIdentifier(kSegueToSDBasicTableVC, sender: self)
      case 2:
         isVertical = true
         self.performSegueWithIdentifier(kSegueToSDFixedColumnRowVC, sender: self)
      case 3:
         isVertical = false
         self.performSegueWithIdentifier(kSegueToSDFixedColumnRowVC, sender: self)
      case 4:
         isVertical = true
         self.performSegueWithIdentifier(kSegueToSDColumnOrRowLayoutVC, sender: self)
      case 5:
         isVertical = true
         self.performSegueWithIdentifier(kSegueToSDColumnBasedSpaceOptimizedVerticalLayoutVC, sender: self)
      case 6:
         isVertical = true
         self.performSegueWithIdentifier(kSegueToSDStraightAutoSizingVerticalLayoutVC, sender: self)
      default:
         break
      }
   }
   
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if segue.identifier == kSegueToSDFixedColumnRowVC{
         if let destination = segue.destinationViewController as? SDFixedColumnRowVC{
            destination.isVertical = isVertical
         }
      }
   }
}


