//
//  CashFieldDelegate.swift
//  TextFields
//
//  Created by Hsu, KuoCheng on 7/1/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation
import UIKit

class CashFieldDelegate: NSObject, UITextFieldDelegate{
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let rawText = textField.text! as NSString
        var newText = rawText.stringByReplacingCharactersInRange(range, withString: string)
        let rawString = String(newText)
        var characters = [Character](rawString.characters)
        let tempChar = (characters[characters.count - 1])
        let tempInput = String(tempChar)
        if let integer = Int(tempInput as String){
            var dollars = ""
            let max = characters.count - 3
            var tempArray = characters[1...max]
            
            for text in tempArray{
                if text != "."{
                    dollars = dollars + String(text)
                }
                if dollars == "00"{
                    dollars = "0"
                }
            }
            print(dollars)
            var cents = String(characters[characters.count - 2]) + String(characters[characters.count-1])
            newText = "$" + dollars + "." + cents
            textField.text = newText
            return false
        }
        else{
            return false
        }
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text!.isEmpty {
            textField.text = "$0.00"
        }
    }
    
    func stringToInt(value: Int) -> String{
        let converted = "\(value)"
        return converted
    }
    
}