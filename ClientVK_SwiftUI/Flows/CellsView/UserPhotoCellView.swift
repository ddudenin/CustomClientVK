//
//  UserPhotoCellView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 05.12.2021.
//

import SwiftUI
import Kingfisher

struct UserPhotoCellView: View {
    
    let photo: PhotoDisplayItem
    @State var isLiked: Bool
    
    private var likesCount: Int {
        var likeCount = self.photo.likesCount
        
        if self.photo.hasUserLike {
            likeCount += 1
        }
        
        return likeCount
    }
    
    var body: some View {
        VStack {
            KFImage(URL(string: self.photo.photoURL))
                .cancelOnDisappear(true)
                .resizable()
                .frame(width: 90, height: 90)
            
            HStack {
                LikeButton(isLiked: $isLiked)
                Text("\(likesCount)")
            }
            .lineLimit(1)
        }
        .frame(width: 100, height: 125)
    }
}

struct UserPhotoCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserPhotoCellView(photo: PhotoDisplayItem(photoURL: "", likesCount: 0, hasUserLike: false),
                          isLiked: false)
    }
}
