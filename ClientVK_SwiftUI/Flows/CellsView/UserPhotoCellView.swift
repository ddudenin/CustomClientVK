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
    
    var body: some View {
        VStack {
            if let url = self.photo.url {
                KFImage(URL(string: url))
                    .cancelOnDisappear(true)
                    .resizable()
                    .frame(width: 90, height: 90)
            }
            
            HStack {
                Button(action: { print("press button") }) {
                    Image(systemName: self.photo.likes?.userLikes == 1 ? "heart.fill" : "heart")
                }
                
                Text("\(self.photo.likes?.count ?? 0)")
            }
            .lineLimit(1)
        }
        .frame(width: 100, height: 125)
    }
}

struct UserPhotoCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserPhotoCellView(photo: RLMPhoto())
    }
}
