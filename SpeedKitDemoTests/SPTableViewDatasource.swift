//
//  SPTableViewDatasource.swift
//  SpeedKit
//
//  Created by Pradip Vaghasiya on 13/07/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import UIKit
private let kSectionHeaderFooterWithTextHeight : CGFloat  = 20.0

///TODO: Add warning print messages if invalid cellid, celltype and so on.

///Generic datasource takes control of Tableview Datasource Management.
///
///Delegate must conform to SPTableViewControllerProtocol
class SPTableViewDatasource : NSObject, UITableViewDataSource {
   
   /// Weak delegate will be used to fetch all section/cell details for UITableView.
   final weak var delegate : SPListingViewProtocol?
   
   init(_ delegate : SPListingViewProtocol){
      self.delegate = delegate
   }
   
   // MARK: Number Of Sections
   final func numberOfSectionsInTableView(tableView: UITableView) -> Int
   {
      if let protocolRef = self.delegate {
         //println("Number of Sections \(protocolRef.spTableViewDataSource.sectionCount).")
         return protocolRef.spListingData.sectionCount;
      }
      return 0;
   }
   
   // MARK: Number Of Rows in Section
   final func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
   {
      if let protocolRef = self.delegate {
         //println("Number of Rows \(protocolRef.spTableViewDataSource.cellCountOfSection(At :section)) in Section \(section).")
         return Int(protocolRef.spListingData.cellCountOfSection(UInt(section)))
      }
      return 0;
   }
   
   // MARK: cellForRowAtIndexPath
   final func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
   {
      var tableViewCell : UITableViewCell
      
      if let protocolRef = self.delegate {
         
         if let (cellData, similarCellTypeIndex) = protocolRef.spListingData.getListingCellGroupWithIndexOfCellModelArray(ForIndexPath: indexPath){
            
            var tableViewCell = self.createCellUsing(
               TableView: tableView,
               CellData: cellData,
               IndexPath: indexPath)
            
            self.configureCell(TableViewCell: tableViewCell,
               CellData: cellData, SimilarCellTypeIndex: similarCellTypeIndex)
            
            return tableViewCell
         }
      }
      
      return UITableViewCell()
   }
   
   ///Creates or Dequeues Cell with given Cell Id at given indexPath
   ///
   ///:param: TableView
   ///:param: SPListingCellGroup
   ///:param: IndexPath
   ///
   ///:returns: UITableViewCell If Cell Id is not valid it returns empty default cell.
   private func createCellUsing(TableView tableView: UITableView, CellData cellData: SPListingCellGroup, IndexPath indexPath: NSIndexPath) -> UITableViewCell{
      
      if let cellId = cellData.cellId{
         if (tableView.dequeueReusableCellWithIdentifier(cellId) != nil){
            if let tableViewCell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as? UITableViewCell{
               return tableViewCell
            }            
         }
      }
      
      return UITableViewCell()   // Returns empty default tabelview cell.
   }
   
   ///Configures Cell if it comforms to SPListingCellProtocol
   ///
   ///:param: TableViewCell
   ///:param: SPListingCellGroup
   ///:param: SimilarCellTypeIndex
   private func configureCell(
      TableViewCell tableViewCell: UITableViewCell,
      CellData cellData: SPListingCellGroup,
      SimilarCellTypeIndex similarCellTypeIndex: Int){
         
         // If Cell conforms to SPListingCellProtocol then configure cell using Cell Common model and model array.
         if let spTableViewCell = tableViewCell as? SPListingCellProtocol{
            
            // Configure cell using cellCommonModel
            if let commonModel:AnyObject = cellData.cellCommonModel {
               spTableViewCell.configureCellUsing(commonModel)
            }
            
            // Configure cell using cellModelArray, This also overrides attributes set by Common model
            if cellData.cellModelArray.count > similarCellTypeIndex{
               spTableViewCell.configureCellUsing(cellData.cellModelArray[similarCellTypeIndex])
            }
         }
   }
   
   
   // MARK: Section Header & Footer Title
   final func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      if let protocolRef = self.delegate {
         if let header = protocolRef.spListingData.spListingSectionArray[section].sectionHeader {
            return header
         }
      }
      
      return nil
   }
   
   final func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
      if let protocolRef = self.delegate {
         if let footer = protocolRef.spListingData.spListingSectionArray[section].sectionFooter {
            return footer
         }
      }
      return nil
      
   }
   
}
