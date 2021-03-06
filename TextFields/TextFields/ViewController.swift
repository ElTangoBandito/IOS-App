//
//  ViewController.swift
//  TextFields
//
//  Created by Jason on 11/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!
    @IBOutlet weak var textSwitch: UISwitch!
    
    // Text Field Delegate objects
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate = ColorizerTextFieldDelegate()
    let randomDelegate = RandomColorTextFieldDelegate()
    let zipCodeD = ZipCodeDelegate()
    let cashFieldD = CashFieldDelegate()
    
    // Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // set the label to be hidden
        self.characterCountLabel.hidden = true
        
        // Set the three delegates
        self.textField1.delegate = zipCodeD
        //self.textField2.delegate = colorizerDelegate
        self.textField2.delegate = cashFieldD
        self.textField3.delegate = self
        
        self.textSwitch.setOn(false, animated:false)
    }

    
    // Text Field Delegate Methods
    /*
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        // Figure out what the new text will be, if we return true
        var newText: NSString = textField.text!
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        // hide the label if the newText will be an empty string
        self.characterCountLabel.hidden = (newText.length == 0)
        
        // Write the length of newText into the label
        self.characterCountLabel.text = String(newText.length)
        
        // returning true gives the text field permission to change its text
        return true;
    }
 */
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return self.textSwitch.on
    }
    
    
    @IBAction func enableEdit(sender: AnyObject){
    
        if !(sender as! UISwitch).on {
            self.textField3.resignFirstResponder()
        }
    }
    
}

