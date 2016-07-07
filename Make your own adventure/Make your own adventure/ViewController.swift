//
//  ViewController.swift
//  Make your own adventure
//
//  Created by Hsu, KuoCheng on 7/7/16.
//  Copyright © 2016 Hsu, KuoCheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Start Over", style: .Plain, target: self, action: "startOver")
    }
    
    func startOver(){
        if let navigationController = self.navigationController {
            navigationController.popToRootViewControllerAnimated(true)
        }
    }
    deinit{
        print("Hello??")
    }
}
