//
//  UserData.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 10.12.2021.
//

import Foundation
import RealmSwift

struct FriendsRequestData: Codable {
    let response: FriendsResponse
}

struct FriendsResponse: Codable {
    let count: Int
    let items: [RLMUser]
}

class RLMUser: Object, Codable {
    @objc dynamic var firstName: String = ""
    @objc dynamic var id: Int = -1
    @objc dynamic var lastName: String = ""
    @objc dynamic var canAccessClosed: Bool = false
    @objc dynamic var photo200Orig: String = ""
    @objc dynamic var trackCode: String = ""
    
    var fullName: String  {
        return firstName + " " + lastName
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

