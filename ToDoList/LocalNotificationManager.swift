//
//  LocalNotificationManager.swift
//  ToDoList
//
//  Created by Jia H Li on 3/8/20.
//  Copyright © 2020 Jia H Li. All rights reserved.
//

import Foundation
import UserNotifications

struct LocalNotificationManager {
    
    static func authorizeLocalNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error)
            in
            guard error == nil else {
                print("ERROR: \(error!.localizedDescription)")
                return
            }
            if granted {
                print("Notfications Authorization Granted!")
            } else {
                print("The user has denied notifications!")
            }
        }
    }
    
    static func setCalenderNotification(title: String, subtitle: String, body: String, badgeNumber: NSNumber?, sound: UNNotificationSound?, date: Date) -> String {
        let content = UNMutableNotificationContent()
        //create content
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.sound = sound
        content.badge = badgeNumber
        
        //create trigger
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        dateComponents.second = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //create request
        let notificationID = UUID().uuidString
        let request = UNNotificationRequest(identifier: notificationID, content: content, trigger: trigger)
        
        //register request with the notifcation center
        UNUserNotificationCenter.current().add(request) {(error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            } else {
                print("Notification scheduled \(notificationID), title: \(content.title)")
            }
        }
        return notificationID
    }
}
