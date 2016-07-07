//
//  ResultViewController.swift
//  Roshambo attempt
//
//  Created by Hsu, KuoCheng on 6/28/16.
//  Copyright (c) 2016 Hsu, KuoCheng. All rights reserved.
//

import UIKit

var userPick = [String]()
var gameResult = [String]()

class ResultViewController: UIViewController {

    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultMessage: UILabel!
    var npc: String!
    var userInput: String!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        randomShape()
        displayResult()
    }
    
    private func displayResult() {
        var imageName: String!
        var text: String!
        if (userInput == npc){
            text = "\(userInput) vs. \(npc), it is a tie."
            imageName = "tie"
            gameResult.append("Tie")
        }
        else if(userInput == "Rock" && npc == "Scissors"){
            text = "\(userInput) vs. \(npc), you won."
            imageName = "\(userInput)\(npc)"
            gameResult.append("Won")
        }
        else if(userInput == "Paper" && npc == "Rock"){
            text = "\(userInput) vs. \(npc), you won."
            imageName = "\(userInput)\(npc)"
            gameResult.append("Won")
        }
        else if(userInput == "Scissors" && npc == "Paper"){
            text = "\(userInput) vs. \(npc), you won."
            imageName = "\(userInput)\(npc)"
            gameResult.append("Won")
        }
        else{
            text = "\(userInput) vs. \(npc), you lost."
            imageName = "\(npc)\(userInput)"
            gameResult.append("Lost")
        }
        imageName = imageName.lowercaseString
        resultImage.image = UIImage(named: imageName)
        resultMessage.text = text
        userPick.append("\(userInput) vs. \(npc)")
        
    }
    
    private func randomShape(){
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        npc = shapes[randomChoice]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction private func historyView(){
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("HistoryViewController") as! HistoryViewController
        let testArray = userPick
        let testArray2 = gameResult
        controller.userPick = testArray
        controller.result = testArray2
        presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction private func playAgain() {

        dismissViewControllerAnimated(true, completion: nil)
    }
}