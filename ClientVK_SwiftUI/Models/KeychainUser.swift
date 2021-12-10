//
//  KeychainUser.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 10.12.2021.
//

import Foundation

struct KeychainUser: Codable {
    let id: Int
    let token: String
    let date: TimeInterval
}
