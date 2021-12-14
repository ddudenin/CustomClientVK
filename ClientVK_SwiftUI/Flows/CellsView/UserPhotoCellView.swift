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
    @State private var isLiked = false
    
    var body: some View {
        VStack {
            if let url = self.photo.url {
                KFImage(URL(string: url))
                    .cancelOnDisappear(true)
                    .resizable()
                    .frame(width: 90, height: 90)
            }
            
            HStack {
                HeartButton(isLiked: $isLiked)
                Text("\(self.photo.likes?.count ?? 0)")
            }
            .lineLimit(1)
        }
        .frame(width: 100, height: 125)
    }
}

struct HeartButton: View {
    
    @Binding var isLiked: Bool
    @State private var animate = false

    private let animationDuration = 0.1
    private var animationScale: CGFloat {
        isLiked ? 0.7 : 1.3
    }
    
    var body: some View {
        Button(action: {
            self.animate = true
            
            DispatchQueue
                .main
                .asyncAfter(deadline: .now() + self.animationDuration,
                            execute: {
                    self.animate = false
                    self.isLiked.toggle()
                })
        }, label: {
            Image(systemName: self.isLiked ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 20)
                .foregroundColor(self.isLiked ? .red : .gray)
        })
            .scaleEffect(self.animate ? animationScale : 1.0)
            .animation(.easeIn(duration: animationDuration), value: self.isLiked)
    }
}

struct UserPhotoCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserPhotoCellView(photo: RLMPhoto())
    }
}
