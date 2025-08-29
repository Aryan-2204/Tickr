//
//  Profileview.swift
//  tasky
//
//  Created by Aryan Kadam on 27/08/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileviewViewmodels()

    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.red)
                        .frame(width: 125, height: 125)
                        .padding()

                    // Info
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Name")
                                .bold()
                            Text(user.name)
                        }

                        HStack {
                            Text("Email")
                                .bold()
                            Text(user.email)
                        }

                        HStack {
                            Text("Member Since")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                    }
                    .padding()

                    // Signout
                    Button("LOG OUT") {
                        viewModel.logOut()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    .padding(.top)

                    Spacer()
                } else {
                    Text("Loading Profile...")
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}

