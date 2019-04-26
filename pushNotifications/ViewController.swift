//
//  ViewController.swift
//  pushNotifications
//
//  Created by Neil Shah on 4/19/19.
//  Copyright © 2019 Neil Shah. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [UNAuthorizationOptions.alert, .sound, .badge]) { (success, error) in
            
        }
    }

    @IBAction func didTapNotification(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Notification Test"
        content.subtitle = "iOS CodePath"
        content.body = "Testing push notifications"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
        let request = UNNotificationRequest(identifier: "contentIdentifier", content: content, trigger: trigger)
        
        center.add(request) { (error) in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
        
    }
    
}

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([UNNotificationPresentationOptions.alert, .badge, .sound])
    }
}

