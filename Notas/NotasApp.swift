//
//  NotasApp.swift
//  Notas
//
//  Created by Alessandre Martins on 6/8/22.
//

import SwiftUI
import FirebaseCore
import UIKit

@main
struct NotasApp: App {
    @StateObject private var notasFactory = NotasFactory()
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView(notasFactory: testFactory)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
