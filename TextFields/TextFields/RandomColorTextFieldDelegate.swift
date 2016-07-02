//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Hsu, KuoCheng on 6/30/16.
//  Copyright (c) 2016 Udacity. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate{
    let colors = [UIColor.redColor(),UIColor.orangeColor(),UIColor.yellowColor(),UIColor.greenColor(),UIColor.blueColor(),UIColor.brownColor(),UIColor.blackColor(),UIColor.purpleColor(),UIColor.cyanColor(),UIColor.magentaColor(),UIColor.whiteColor()
    ];
    
    func randomColor() -> UIColor{
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        return colors[randomIndex]
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = self.randomColor()
        return true
    }
    
}