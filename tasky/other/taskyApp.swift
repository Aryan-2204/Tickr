
//
//  taskyApp.swift
//  tasky
//
//  Created by Aryan Kadam on 26/08/25.
//
import FirebaseCore
import SwiftUI

@main
struct taskyApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
