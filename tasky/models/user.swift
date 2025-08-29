//
//  user.swift
//  tasky
//
//  Created by Aryan Kadam on 27/08/25.
//

import Foundation

struct User : Codable {
    let id : String
    let name : String
    let email : String
    let joined: TimeInterval
}
