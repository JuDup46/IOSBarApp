//
//  ViewController.swift
//  StoryboardWatchApp
//
//  Created by Benoit Briatte on 21/09/2022.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        WCSession.default.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    @IBAction func handleLiveMessageWithReply(_ sender: Any) {
        
        guard WCSession.default.isReachable else {
            return
        }
        WCSession.default.sendMessage([
            "say": "hello"
        ]) { res in
            print(res)
        }
        
    }
    
}

extension ViewController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("iPhone \(activationState) \(error)")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("VC \(message["action"])")
    }
}

