//
//  SampleCollectionViewCell.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 15/11/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import UIKit

let kCellIdSampleCollectionViewCell = "SampleCollectionViewCell"

class SampleCollectionCellModel{
    var titleText:String
    init(Title text:String){
        self.titleText = text
    }
}

class SampleCollectionViewCell : UICollectionViewCell,SPTableViewCellProtocol{
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        println("AwakeFromNib")
    }

    
    func configureCellUsing(model: AnyObject) {
        if let myModel = model as? SampleCollectionCellModel{
            self.titleLabel.text = myModel.titleText
        }else{
            println("Please pass correct model (SampleCollectionCellModel)")
        }
        
    }
}


