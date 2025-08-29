//
//  taskyitemsviewviewmodels.swift
//  tasky
//
//  Created by Aryan Kadam on 27/08/25.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
///ViewModel for single to do list item view (each row i itemss list)
///primary tab
class TaskyItemsViewViewModels  : ObservableObject{
    init() {}
    func toggleIsDone(item : TaskyItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("tasks")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary() ?? [:])
            
    }
}
