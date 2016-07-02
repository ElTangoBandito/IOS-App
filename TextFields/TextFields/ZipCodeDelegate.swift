//
//  ZipCodeDelegate.swift
//  TextFields
//
//  Created by Hsu, KuoCheng on 7/1/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeDelegate: NSObject, UITextFieldDelegate{
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var newText = textField.text! as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        if newText.length <= 5 {
            if let integer = Int(newText as String){
                //why can't i delete the first input??
                return true
            }
            else{
                return false
            }
        }
        else{
            return false
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}