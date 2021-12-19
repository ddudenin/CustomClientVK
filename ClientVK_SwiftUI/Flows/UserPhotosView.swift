//
//  UserPhotosView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 05.12.2021.
//

import Foundation

import SwiftUI
import ASCollectionView

struct UserPhotosView: View {
    
    let user: User
    
    @State private var photos: [Photo] =
    Array(repeating: Photo(url: "Tim Cook",
                           likesCount: Int.random(in: 1...1000),
                           userLikes: Bool.random()),
          count: Int.random(in: 1...10))
    
    var body: some View {
        ASCollectionView(data: photos) { photo, _ in
            UserPhotoCellView(photo: photo)
        }.layout {
            .grid(
                layoutMode: .fixedNumberOfColumns(3),
                itemSpacing: 0,
                lineSpacing: 16
            )
        }
        .navigationTitle(self.user.fullName)
    }
}

struct UserPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        UserPhotosView(user: testUser)
    }
}
