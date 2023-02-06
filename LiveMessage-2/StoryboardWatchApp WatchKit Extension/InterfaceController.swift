//
//  InterfaceController.swift
//  StoryboardWatchApp WatchKit Extension
//
//  Created by Benoit Briatte on 21/09/2022.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

    @IBAction func handleLiveMessage() {
        guard WCSession.default.isReachable else {
            return
        }
        WCSession.default.sendMessage([
            "action": "hello"
        ], replyHandler: nil)
    }
}
