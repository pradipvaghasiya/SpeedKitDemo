//
//  SPTitleLabelCell.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 13/07/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import UIKit

///Reusable Cell Id defined in xib file and xib file name itself. Both must be same.
public let kCellIdSPTitleLabelCell = "SPTitleLabelCell"

//Default Label Parameters
private let kDefaultFontSize : CGFloat = 16.0
private let kDefaultFont = UIFont.systemFontOfSize(kDefaultFontSize)
private let kDefaultTextColor = UIColor.blackColor()
private let kDefaultTextAlignment : NSTextAlignment = .Left

///This cell shows single label covered in whole length and height
class SPTitleLabelCell: UITableViewCell,SPListingCellProtocol {
    ///Title Label IBOutlet
    @IBOutlet var titleLabel: UILabel?
    
    // SPTableViewCellProtocol
    func configureCellUsing(model: AnyObject){
        //If model is of type SPTitleLabelCellModel, It would set title text.
        if let myModel = model as? SPTitleLabelCellModel{
            self.titleLabel?.text = myModel.titleText
            
            return
        }
        
        //If model is of type SPTitleLabelCellCommonModel, It would set Label properties.
        if let myModel = model as? SPTitleLabelCellCommonModel{
            self.titleLabel?.textColor = myModel.textColor
            self.titleLabel?.textAlignment = myModel.textAlignment
            self.titleLabel?.font = myModel.font

            return
        }
        
        println("Please pass correct model")
    }
}

///This model ideally should be used as Common Model so that it can be applied to all similar cells.
class SPTitleLabelCellCommonModel{
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

///This model contains only one title property.
class SPTitleLabelCellModel{
    ///Cell label Title Text
    var titleText:String
    init(TitleText text:String){
        self.titleText = text
    }
}
