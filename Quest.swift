//
//  Quest.swift
//  VolunteerSearch
//
//  Created by Aravind Subramanian on 6/18/26.
//

import SwiftUI
import FirebaseCore
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        FirebaseApp.configure()
    }
}


struct YourApp: App {

    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
      
            QuestView()
        
        }
    }
}


#Preview {
    QuestView()
}





