//
//  UserPhotoCellView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 05.12.2021.
//

import SwiftUI

struct UserPhotoCellView: View {
    let photo: Photo
    
    var body: some View {
        VStack {
            Image(self.photo.url)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
            
            HStack {
                Button(action: { print("press button") }) {
                    Image(systemName: "\(self.photo.userLikes ? "heart.fill" : "heart")")
                }
                
                Text("\(self.photo.likesCount)")
            }
            .lineLimit(1)
        }
        .frame(width: 100, height: 125)
    }
}

struct UserPhotoCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserPhotoCellView(photo: Photo(url: "TimCook", likesCount: 213, userLikes: true))
    }
}
