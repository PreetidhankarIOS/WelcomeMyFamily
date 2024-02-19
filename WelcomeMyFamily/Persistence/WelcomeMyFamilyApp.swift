//
//  WelcomeMyFamilyApp.swift
//  WelcomeMyFamily
//
//  Created by Ashish Viltoriya on 18/02/24.
//

import SwiftUI

@main
struct WelcomeMyFamilyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
