//
//  loginViewviewmodels.swift
//  tasky
//
//  Created by Aryan Kadam on 27/08/25.
//

import Foundation
import FirebaseAuth
class LoginViewViewModels: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    func login() {
        guard validate() else {
            return
        }
      Auth.auth().signIn(withEmail: email, password: password)
            
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in:.whitespaces).isEmpty else {
            errorMessage = "Please enter email and password"
            return false
        }
        guard email.contains("@") && email.contains(".")else {
            errorMessage = "Invalid email format"
            return false
        }
        return true
    }
}
