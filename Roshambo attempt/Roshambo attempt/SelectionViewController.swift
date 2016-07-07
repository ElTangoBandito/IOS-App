//
//  ViewController.swift
//  Roshambo attempt
//
//  Created by Hsu, KuoCheng on 6/28/16.
//  Copyright (c) 2016 Hsu, KuoCheng. All rights reserved.
//

import UIKit


class SelectionViewController: UIViewController {

    enum ButtonType:Int {case Paper = 0, Scissors}
    var choice: String!
    var userPick : [String]!
    var result : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction private func selectRock(sender: UIButton){
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController!
        controller.userInput = "Rock"
        presentViewController(controller, animated: true, completion: nil)
    }
    //segue: UIStoryboardSegue,
    @IBAction private func selectPaper(sender: UIButton){
        performSegueWithIdentifier("play", sender: sender)
        //let controller = segue.destinationViewController as ResultViewController
        //controller.userInput = "Paper"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "play"){
            chooseText(sender as! UIButton)
            let controller = segue.destinationViewController as! ResultViewController
            controller.userInput = choice
        }
    }
/*
    @IBAction private func viewHistory(sender: UIButton) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("HistoryViewController") as! HistoryViewController!
        presentViewController(controller, animated: true, completion: nil)
    }
 */
    private func chooseText(sender: UIButton){
        switch(ButtonType(rawValue: sender.tag)!){
        case .Scissors:
            choice = "Scissors"
        case .Paper:
            choice = "Paper"
        }
    }
}

