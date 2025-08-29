//
//  taskyviewviewmodels.swift
//  tasky
//
//  Created by Aryan Kadam on 27/08/25.
//
import FirebaseFirestore
import Foundation
///ViewModel for list of items view
///primary tab
class TaskyviewViewModels : ObservableObject{
    @Published var showingNewItemView: Bool = false
    private let userId : String
    init(userId:String) {
        self.userId = userId
    }
    func delete(id:String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("tasks")
            .document(id)
            .delete()
    }
}
