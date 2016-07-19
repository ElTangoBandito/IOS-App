//
//  ViewController.swift
//  ImageRequest
//
//  Created by Jarrod Parkes on 11/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageUrl = NSURL(string: "https://texasstateaquarium.org/wp-content/uploads/2014/10/Eel-6.jpg")!
        //https://texasstateaquarium.org/wp-content/uploads/2014/10/Eel-6.jpg
        //I need a http site!!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(imageUrl) {(data, response, error) in
            print("Task finished")
            
            if error == nil{
                let downloadedImage = UIImage(data: data!)
                
                performUIUpdatesOnMain {
                    self.imageView.image = downloadedImage
                }
            }
        }
        
        task.resume()
    }
}
