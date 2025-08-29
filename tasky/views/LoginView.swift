//
//  loginView.swift
//  tasky
//
//  Created by Aryan Kadam on 27/08/25.
//
import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModels()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16){
                //header
                Headerview(title: "Tickr", subtitle: " Get things done right " ,angle:15 ,backgroundColor:Color(red: 0.90, green: 0.10, blue: 0.10))
                
                //login form
                
                Form {
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLview( title : "Log in ", backgroundColor :.red){
                        viewModel.login()
                    }
                   
                }
                .offset(y: -70)
                
                //create account
                VStack{
                    Text("new around here?")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .bold()
                    
                    NavigationLink ( "Create an Account", destination: RegisterView())
                        
                    
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}
    #Preview {
        LoginView()
    }

