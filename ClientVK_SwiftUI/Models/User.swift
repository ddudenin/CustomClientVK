//
//  User.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 05.12.2021.
//

import Foundation

class User: Identifiable {
    
    let id: UUID = UUID()
    let lastName: String
    let firstName: String
    let avatar: String?
    let city: String?
    let isOnline: Bool
    
    var fullName: String {
        return "\(self.firstName) \(self.lastName)"
    }
    
    init(lastName: String, firstName: String, avatar: String?, city: String?, isOnline: Bool) {
        self.lastName = lastName
        self.firstName = firstName
        self.avatar = avatar
        self.city = city
        self.isOnline = isOnline
    }
}
