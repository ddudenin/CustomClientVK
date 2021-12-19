//
//  Group.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 05.12.2021.
//

import Foundation

class Group: Identifiable {
    
    let id: UUID = UUID()
    let name: String
    let avatar: String?
    
    init(name: String, avatar: String?) {
        self.name = name
        self.avatar = avatar
    }
}
