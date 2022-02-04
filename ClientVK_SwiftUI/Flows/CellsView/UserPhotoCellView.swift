//
//  UserPhotoCellView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 05.12.2021.
//

import SwiftUI
import Kingfisher

struct UserPhotoCellView: View {
    
    let photo: RLMPhoto
    @State var isLiked: Bool
    
    private var likesCount: Int {
        var likeCount = 0
        
        if let likeInfo = photo.likes {
            likeCount = likeInfo.count
        }
        
        if isLiked {
            likeCount += 1
        }
        
        return likeCount
    }
    
    var body: some View {
        VStack {
            if let url = self.photo.url {
                KFImage(URL(string: url))
                    .cancelOnDisappear(true)
                    .resizable()
                    .frame(width: 90, height: 90)
            }
            
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
        UserPhotoCellView(photo: RLMPhoto(), isLiked: false)
    }
}
