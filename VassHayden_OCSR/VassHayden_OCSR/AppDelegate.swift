//
//  AppDelegate.swift
//  VassHayden_OCSR
//
//  Created by Hayden Vass on 5/19/19.
//  Copyright © 2019 Hayden Vass. All rights reserved.
//

import UIKit
import WatchConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
//    var session: WCSession?{
//        didSet{
//            if let session = session{
//                session.delegate = self
//                //required before objects interact - phone / watch
//                session.activate()
//            }
//        }
//    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        if WCSession.isSupported(){
//            session = WCSession.default
//        }
//
        return true
    }
}

//extension AppDelegate: WCSessionDelegate{
//
//
//    func sessionDidDeactivate(_ session: WCSession) {
//        // gets called if session ends for any reason
//
//    }
//    func sessionDidBecomeInactive(_ session: WCSession) {
//        //sessions prepares to stop communicatiing with the watch
//    }
//
//    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
//        //
//    }
//
//    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
//        DispatchQueue.main.async {
//             //can open phone app to pull data - but we dont want to block the main thread
////            var dataSoruce = ViewController.constructAnimals()
////
////            if message["selectedIndex"] != nil {
////                let sIndex = message["selectedIndex"] as? Int
////                NSKeyedArchiver.setClassName("Animal", for: Animal.self)
////                let balanceObject = dataSoruce[sIndex ?? 0]
////                do{
////                    let data = try NSKeyedArchiver.archivedData(withRootObject: balanceObject, requiringSecureCoding: false)
////                    replyHandler(["newAnimal":data])
////
////                }catch{
////                    print("archiving failed")
////                }
////            }
//        }
//    }
//}

