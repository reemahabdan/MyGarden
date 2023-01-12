//
//  MyGarden2App.swift
//  MyGarden2
//
//  Created by Reema Alhabdan on 09/01/2023.
//

import SwiftUI

@main
struct MyGarden2App: App {
    
    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            ContentView(selectedItem: .init())
            
        }
    }
}
