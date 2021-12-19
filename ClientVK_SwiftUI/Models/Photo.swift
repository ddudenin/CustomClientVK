//
//  Photo.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 05.12.2021.
//

import Foundation

class Photo: Identifiable {
    
    let id: UUID = UUID()
    let url: String
    let likesCount: Int
    let userLikes: Bool
    
    init(url: String, likesCount: Int, userLikes: Bool) {
        self.url = url
        self.likesCount = likesCount
        self.userLikes = userLikes
    }
}
