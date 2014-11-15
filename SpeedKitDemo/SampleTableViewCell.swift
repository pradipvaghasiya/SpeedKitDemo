//
//  SampleTableViewCell.swift
//  SpeedKitDemo
//
//  Created by Pradip Vaghasiya on 13/07/14.
//  Copyright (c) 2014 Happyfall. All rights reserved.
//

import UIKit

let kCellIdSampleTableViewCell = "SampleTableViewCell"

class SampleTableViewCellModel{
    var titleText:String
    init(TitleText text:String){
        self.titleText = text
    }
}

class SampleTableViewCell: UITableViewCell,SPTableViewCellProtocol {

    @IBOutlet var titleLabel: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // SPTableViewCellProtocol
    func configureCellUsing(model: AnyObject){
        if let myModel = model as? SampleTableViewCellModel{
            self.titleLabel?.text = myModel.titleText
        }else{
            println("Please pass correct model")
        }
    }
}
