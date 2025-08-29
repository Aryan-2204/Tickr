//
//  ContentView.swift
//  tasky
//
//  Created by Aryan Kadam on 26/08/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewModels()
    var body: some View {
        if viewModel.isSignedIn ,!viewModel.currentUserId.isEmpty{
            accountView
        }
        else {
           LoginView()
            
        }
       
    }
    @ViewBuilder
    var accountView : some View {
        TabView{
            TaskyView(userId : viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem{
                    Label("profile", systemImage: "person.circle")
                }
            
        }
    }
}

#Preview {
   ContentView()
}

