//
//  taskyItems.swift
//  tasky
//
//  Created by Aryan Kadam on 27/08/25.
//

import Foundation
struct TaskyItem : Codable , Identifiable {
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createdDate : TimeInterval
    var isDone : Bool
    
    
    mutating func setDone(_ state : Bool) {
        isDone = state
    }
        }
    
