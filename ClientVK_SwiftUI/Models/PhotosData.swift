//
//  PhotosData.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 10.12.2021.
//

import Foundation
import RealmSwift

struct PhotosRequestData: Codable {
    let response: PhotosResponse
}

struct PhotosResponse: Codable {
    let count: Int
    let items: [RLMPhoto]
}

class RLMPhoto: Object, Codable, Identifiable {
    @objc dynamic var albumId: Int = -1
    @objc dynamic var date: Int = 0
    @objc dynamic var id: Int = -1
    @objc dynamic var ownerId: Int = -1
    @objc dynamic var hasTags: Bool = false
    var postId: Int?
    var sizes = List<Size>()
    @objc dynamic var text: String = ""
    @objc dynamic var likes: Likes?
    @objc dynamic var reposts: Reposts?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Likes: Object, Codable {
    @objc dynamic var userLikes: Int = 0
    @objc dynamic var count: Int = 0
}

class Reposts: Object, Codable {
    @objc dynamic var count: Int = 0
}

class Size: Object, Codable {
    @objc dynamic var height: Int = 0
    @objc dynamic var url: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var width: Int = 0
    
    var aspectRatio: Float {
        return Float(self.height) / Float(self.width)
    }
}

enum TypeEnum: String, Codable {
    case m = "m"
    case o = "o"
    case p = "p"
    case q = "q"
    case r = "r"
    case s = "s"
    case w = "w"
    case x = "x"
    case y = "y"
    case z = "z"
}

struct PhotoDisplayItem {
    let photoURL: String
    let likesCount: Int
    let hasUserLike: Bool
}
