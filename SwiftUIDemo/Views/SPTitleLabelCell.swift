//
//  SPTitleLabelCell.swift
//  SwiftUIDemo
//
//  Created by Pradip Vaghasiya on 13/07/14.
//  Copyright (c) 2014 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI

///Reusable Cell Id defined in xib file and xib file name itself. Both must be same.
public let kCellIdSPTitleLabelCell = "SPTitleLabelCell"

class SPTitleLabelCell: UITableViewCell,SPTableCellProtocol {
   ///Title Label IBOutlet
   @IBOutlet var titleLabel: UILabel?
   
   weak var parentView : UITableView?
   weak var viewModel : ViewModelType?

   // SPTableViewCellProtocol
   func configureCell(){
      //If model is of type SPTitleLabelCellModel, It would set title text.
      if let myModel = viewModel as? SPTitleLabelCellModel{
         self.titleLabel?.text = myModel.titleText
         
         return
      }
      
      print("Please pass correct model")
   }
}

// MARK: Cell Model
///This model contains only one title property.
class SPTitleLabelCellModel : ViewModelType{
   
   var cellId = kCellIdSPTitleLabelCell
   var cellType : CellType = .Nib
   
   ///Cell label Title Text
   var titleText:String
   init(TitleText text:String){
      self.titleText = text
   }
}


// MARK: Helper Methods
extension SPTitleLabelCell{
   
   ///This method creates basic default SPListingData with one section from given array.
   ///
   ///:param: stringArray Array of string using which SPListingData would be created.
   ///
   ///:returns: SPListingData which can be used to create TableView using SpeedKit
   class func getBasicDefaultSPListingData(UsingStringArray stringArray: [String]) -> ListingData<TableViewSection>{
      
      let section : TableViewSection = []
      for rowTitle in stringArray{
         section.append(SPTitleLabelCellModel(TitleText: rowTitle))
      }
      
      return [section]
   }
}



