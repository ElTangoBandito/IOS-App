//
//  ViewController.swift
//  Click Counter
//
//  Created by Hsu, KuoCheng on 6/28/16.
//  Copyright (c) 2016 Hsu, KuoCheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    @IBOutlet var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func incrementCount(){
        self.count++
        self.label.text = "\(self.count)"
    }

    func decrementCount(){
        self.count--
        self.label.text = "\(self.count)"
    }
}

