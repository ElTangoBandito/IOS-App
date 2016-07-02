//
//  ViewController.swift
//  experiment
//
//  Created by Hsu, KuoCheng on 6/28/16.
//  Copyright (c) 2016 Hsu, KuoCheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func experiment(){
        let nextController = UIImagePickerController()
        self.presentViewController(nextController, animated: true, completion: nil)
    }
    
    @IBAction func experiment2(){
        let image = UIImage()
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.presentViewController(controller, animated: true, completion: nil)
    }

    @IBAction func experimen3(){
        let controller = UIAlertController()
        controller.title = "I am an alert!"
        controller.message = "I am THE message!"
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default) {action in self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        controller.addAction(okAction)
        self.presentViewController(controller, animated: true, completion: nil)
        
        // add the dismiss control
        
    }
}

