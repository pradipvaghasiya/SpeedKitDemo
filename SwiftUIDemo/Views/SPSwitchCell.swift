//
//  SPSwitchCell.swift
//  SwiftUIDemo
//
//  Created by ibm on 29/06/15.
//  Copyright © 2015 SpeedUI. All rights reserved.
//

import UIKit
import SwiftUI

class SwitchCellModel : NSObject, ViewModelType{
   let cellId = kCellId
   let cellType = CellType.Nib
   var serverId: Any?
    
   var title : String
   var isSwitchOn : Bool
   
   init(title : String, isSwitchOn : Bool){
      self.title = title
      self.isSwitchOn = isSwitchOn
   }
}

protocol SwitchCellDelegate{
   func switchValueChanged(indexPath: NSIndexPath?, viewModel : SwitchCellModel)
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
         if let cellDelegate = self.tableView?.delegate as? SwitchCellDelegate{
            cellDelegate.switchValueChanged(
               self.tableView?.indexPathForCell(self),viewModel: myModel)
         }
      }
   }
}

