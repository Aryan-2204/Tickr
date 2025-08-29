//
//  Registerview.swift
//  tasky
//
//  Created by Aryan Kadam on 27/08/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel  =  RegisterViewViewModels()
    var body : some View {
        
        VStack(spacing: 16){
            //header
            Headerview(title:"Register", subtitle: "Start Mananging Your Tasks", angle: 50, backgroundColor:            Color(red: 0.90, green: 0.10, blue: 0.10))
            
            Form{
                TextField("Full Name", text: $viewModel.fullName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.words)
                                .disableAutocorrection(true)
                            
                TextField("Email Address", text: $viewModel.email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                            
                SecureField("Password", text: $viewModel.password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TLview( title : "Explore",
                        backgroundColor :.green){
                    //Attempt to log in
                    viewModel.register()
                }
                            
            }
            .offset(y:-70)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
