//
//  SampleCollectionViewCell.swift
//  SwiftUIDemo
//
//  Created by Pradip Vaghasiya on 15/11/14.
//  Copyright (c) 2014 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI

let kCellIdSampleCollectionViewCell = "SampleCollectionViewCell"

class SampleCollectionCellModel{
    var titleText:String
    init(Title text:String){
        self.titleText = text
    }
}

class SampleCollectionViewCell : UICollectionViewCell,SPListingCellProtocol{
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        //println("AwakeFromNib")
    }

    
    func configureCellUsing(model: AnyObject) {
        self.titleLabel.preferredMaxLayoutWidth = 300
        if let myModel = model as? SampleCollectionCellModel{
            self.titleLabel.text = myModel.titleText
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }else{
            print("Please pass correct model (SampleCollectionCellModel)")
        }
    }
}


