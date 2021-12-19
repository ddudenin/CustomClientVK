//
//  Factories.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 19.12.2021.
//

import SwiftUI

enum UserDisplayItemFactory {
    static func make(for user: RLMUser) -> UserDisplayItem {
        let fullName = user.fullName
        let url = user.photo200Orig
        let cityName = user.city?.title ?? ""
        let color = user.online == 1 ? Color.green : Color.black
        
        return UserDisplayItem(fullName: fullName,
                               avatarURL: url,
                               cityName: cityName,
                               shadowColor: color)
    }
}

enum GroupDisplayItemFactory {
    static func make(for group: RLMGroup) -> GroupDisplayItem {
        let name = group.name
        let avatarURL = group.photo200
        
        return GroupDisplayItem(title: name, avatarURL: avatarURL)
    }
}

enum PhotoDisplayItemFactory {
    static func make(for photo: RLMPhoto) -> PhotoDisplayItem {
        let photoURL = photo.sizes.first { $0.type == "x" }?.url ?? photo.sizes.last?.url ?? ""
        let likesInfo = photo.likes ?? Likes()
        
        return PhotoDisplayItem(photoURL: photoURL,
                                likesCount: likesInfo.count,
                                hasUserLike: likesInfo.userLikes == 1)
    }
}
