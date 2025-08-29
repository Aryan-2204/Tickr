//
//  ContentViewview models.swift
//  tasky
//
//  Created by Aryan Kadam on 27/08/25.
//

import Foundation
import FirebaseAuth

class ContentViewViewModels: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?

    init() {
        handler = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    deinit {
        // Clean up the listener when this view model is destroyed
        if let handler = handler {
            Auth.auth().removeStateDidChangeListener(handler)
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
