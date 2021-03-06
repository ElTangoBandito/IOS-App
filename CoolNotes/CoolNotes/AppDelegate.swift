//
//  AppDelegate.swift
//  CoolNotes
//
//  Created by Hsu, KuoCheng on 7/12/16.
//  Copyright © 2016 Hsu, KuoCheng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let stack = CoreDataStack(modelName: "NotesData")!
    
    func preloadData(){
        do{
            try stack.dropAllData()
        }catch{
            print("Error dropping objects in DB")
        }
        
        let codeNotes = Notebook(name: "Coding Notes", context: stack.context)
        let appIdeas  = Notebook(name: "Ideas for new Apps", context: stack.context)
        
        print(codeNotes)
        print(appIdeas)
        
        let wwdc = Note(text: "Watch some WWDC sessions", context: stack.context)
        let kitura = Note(text: "Learn about Kitura, a web framework in Swift by IBM", context: stack.context)
        
        
        wwdc.notebook = codeNotes
        kitura.notebook = codeNotes
        
        let daDump = Note(text: "daDump: social network for people using the toilet", context: stack.context)
        daDump.notebook = appIdeas
        
        print(wwdc)
        print(kitura)
        print(daDump)
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        preloadData()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        do{
            try stack.saveContext()
        }catch{
            print("Error while saving")
        }
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        do{
            try stack.saveContext()
        }catch{
            print("Error while save")
        }
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

