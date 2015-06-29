//
//  SPSwitchCell.swift
//  SwiftUIDemo
//
//  Created by ibm on 29/06/15.
//  Copyright © 2015 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI

class SwitchCellModel : ViewModelType{
   let cellId = kCellId
   let cellType = CellType.Nib
   
   var title : String
   var isSwitchOn : Bool
   
   init(title : String, isSwitchOn : Bool){
      self.title = title
      self.isSwitchOn = isSwitchOn
   }
}


private let kCellId = "SPSwitchCell"
class SPSwitchCell: SPTableCell {

   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var uiSwitch: UISwitch!

   override func configureCell(){
      if let myModel = viewModel as? SwitchCellModel{
         self.titleLabel.text = myModel.title
         self.uiSwitch.setOn(myModel.isSwitchOn, animated: true)
      }
   }
}

extension SPSwitchCell{
   
   @IBAction func switchValueChanged(sender: UISwitch) {
      if let myModel = viewModel as? SwitchCellModel{
         myModel.isSwitchOn = sender.on
      }
   }
}

