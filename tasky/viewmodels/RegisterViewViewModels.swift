//
//  Registerviewviewmodels.swift
//  tasky
//
//  Created by Aryan Kadam on 27/08/25.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewViewModels: ObservableObject {
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""

    init() {}

    func register() {
        guard validate() else {
            print("Validation failed")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                print("Failed to create user: \(error.localizedDescription)")
                return
            }
            
            guard let userId = result?.user.uid else {
                print("No user ID found")
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }

    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: fullName,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary()!)
    }

    private func validate() -> Bool {
        guard !fullName.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }

        guard email.contains("@"), email.contains(".") else {
            return false
        }

        guard password.count >= 6 else {
            return false
        }

        return true
    }
}

