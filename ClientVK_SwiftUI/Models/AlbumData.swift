//
//  AlbumData.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 10.12.2021.
//

import Foundation
import UIKit

struct AlbumsRequestData: Codable {
    let response: AlbumResponse
}

struct AlbumResponse: Codable {
    let count: Int
    let items: [Album]
}

struct Album: Codable {
    let id, thumbId, ownerId: Int
    let title: String
    let itemDescription: String?
    let created, updated: Int?
    let size: Int
    let sizes: [Thumb]
}

class Thumb: Codable {
    var height: Int = 0
    var src: String = ""
    var type: String = ""
    var width: Int = 0
    
    var aspectRatio: Float { return Float(self.height) / Float(self.width) }
}

