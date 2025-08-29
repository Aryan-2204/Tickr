//
//  newitemsviewviewmodels.swift
//  tasky
//
//  Created by Aryan Kadam on 27/08/25.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewItemsViewViewModels : ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var  showAlert = false
    init() {}
    
    func save()
    {
        guard canSave else {
            return
        }
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newItem = TaskyItem(id: newId,
                                title: title,
                                dueDate: dueDate.timeIntervalSince1970,
                                createdDate:Date().timeIntervalSince1970,
                                isDone: false
        )
        if let itemDict = newItem.asDictionary(){
            let db = Firestore.firestore()
            db.collection("users")
                .document(uid)
                .collection("tasks")
                .document(newId)
                .setData(itemDict)
        }
        else{
            print("error converting to dictionary")
        }
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else
        { return false
        }
        guard dueDate > Date().addingTimeInterval(-86400)
        else{
            return false
        }
            
            
            return true
    }
}

