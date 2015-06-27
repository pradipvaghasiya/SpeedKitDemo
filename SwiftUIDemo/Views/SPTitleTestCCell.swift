//
//  SPTitleTestCCell.swift
//  SwiftUIDemo
//
//  Created by Pradip Vaghasiya on 01/05/15.
//  Copyright (c) 2015 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI

///Reusable Cell Id defined in xib file and xib file name itself. Both must be same.
public let kCellIdSPTitleTestCCell = "SPTitleTestCCell"

//Default Label Parameters
private let kDefaultFontSize : CGFloat = 16.0
private let kDefaultFont = UIFont.systemFontOfSize(kDefaultFontSize)
private let kDefaultTextColor = UIColor.blackColor()
private let kDefaultTextAlignment : NSTextAlignment = .Left

// MARK: Cell Configuration
///This cell shows single label covered in whole length and height
class SPTitleTestCCell: UICollectionViewCell,SPListingCellProtocol {
   ///Title Label IBOutlet
   @IBOutlet var titleLabel: UILabel?
   
   // SPListingCellProtocol
   func configureCellUsing(model: ViewModelType){
      //If model is of type SPTitleTestCCellModel, It would set title text.
      if let myModel = model as? SPTitleTestCCellModel{
         self.titleLabel?.text = myModel.titleText
         
         return
      }
      
      //If model is of type SPTitleTestCCellCommonModel, It would set Label properties.
      if let myModel = model as? SPTitleTestCCellCommonModel{
         self.titleLabel?.textColor = myModel.textColor
         self.titleLabel?.textAlignment = myModel.textAlignment
         self.titleLabel?.font = myModel.font
         
         return
      }
      
      print("Please pass correct model")
   }
}

// MARK: Helper Methods
extension SPTitleTestCCell{
   
   ///This method creates basic default SPListingData with one section from given array.
   ///
   ///:param: stringArray Array of string using which SPListingData would be created.
   ///
   ///:returns: SPListingData which can be used to create CollectionView using SpeedKit
   class func getBasicDefaultSPListingData(UsingStringArray stringArray: [String]) ->
      ListingData<CollectionViewSection>{
      
      var cells : [SPTitleTestCCellModel] = []
      
      for rowTitle in stringArray{
         cells.append(SPTitleTestCCellModel(TitleText: rowTitle))
      }
      
      return ListingData(sections: [CollectionViewSection(viewModels: cells)])
   }
}

// MARK: Cell Common Model
///This model ideally should be used as Common Model so that it can be applied to all similar cells.
class SPTitleTestCCellCommonModel{
   //User can change below label property.
   var font: UIFont
   var textColor: UIColor
   var textAlignment: NSTextAlignment
   
   init(Font font:UIFont,
      TextColor textColor:UIColor = kDefaultTextColor,
      TextAlignment alignment : NSTextAlignment = kDefaultTextAlignment){
         self.font = font
         self.textColor = textColor
         self.textAlignment = alignment
   }
   
   init(TextColor textColor:UIColor,
      TextAlignment alignment : NSTextAlignment = kDefaultTextAlignment,
      Font font:UIFont = kDefaultFont){
         self.font = font
         self.textColor = textColor
         self.textAlignment = alignment
   }
   
   init(TextAlignment alignment : NSTextAlignment,
      Font font:UIFont = kDefaultFont,
      TextColor textColor:UIColor = kDefaultTextColor){
         self.font = font
         self.textColor = textColor
         self.textAlignment = alignment
   }
}

// MARK: Cell Model
///This model contains only one title property.
class SPTitleTestCCellModel : ViewModelType{
   let cellId = kCellIdSPTitleTestCCell
   let cellType = CellType.Nib
   
   ///Cell label Title Text
   var titleText:String
   init(TitleText text:String){
      self.titleText = text
   }
}

