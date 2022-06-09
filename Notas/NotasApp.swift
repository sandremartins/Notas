//
//  NotasApp.swift
//  Notas
//
//  Created by Alessandre Martins on 6/8/22.
//

import SwiftUI

@main
struct NotasApp: App {
    @StateObject private var notasFactory = NotasFactory()
    
    var body: some Scene {
        WindowGroup {
            ContentView(notasFactory: testFactory)
        }
    }
}
