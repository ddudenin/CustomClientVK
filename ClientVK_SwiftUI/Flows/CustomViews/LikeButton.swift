//
//  LikeButton.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 15.12.2021.
//

import SwiftUI

struct CirclesView : View {
    
    @Binding var isLiked: Bool
    
    let angle: CGFloat = 45
    let radius: CGFloat
    let speed: Double
    let scale: CGFloat
    
    private let colors = [#colorLiteral(red: 0.9568627477, green: 0.7246241045, blue: 0.6286502079, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.6321644531, blue: 0.7319221681, alpha: 1),#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.7328718878, blue: 0.6570692674, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.6530110473, blue: 0.7002155785, alpha: 1),#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)]
    
    var body: some View {
        ForEach (0..<9) { index in
            let angle = CGFloat(index) * self.angle * .pi / 180
            Circle()
                .fill(Color(self.colors[index]))
                .frame(width: 10)
                .scaleEffect(self.isLiked ? 0.1 : self.scale)
                .animation(.linear(duration: self.speed),
                           value: self.isLiked)
                .offset(x: self.radius * cos(angle),
                        y: self.radius * sin(angle))
        }
    }
}

struct LikeButton : View {
    
    @Binding var isLiked: Bool
    
    @State var scale: CGFloat = 1
    @State var opacity = 0.0
    
    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .opacity(self.isLiked ? 1 : 0)
                .scaleEffect(self.isLiked ? 1.0 : 0.1)
                .animation(.linear,
                           value: self.isLiked)
            
            Image(systemName: "heart")
            
            CirclesView(isLiked: $isLiked,
                        radius: 25,
                        speed: 0.1,
                        scale: 0.7)
                .opacity(self.opacity)
            
            CirclesView(isLiked: $isLiked,
                        radius: 45,
                        speed: 0.2,
                        scale: 0.5)
                .opacity(self.opacity)
                .rotationEffect(Angle(degrees: 20))
        }
        .onTapGesture {
            self.isLiked.toggle()
            withAnimation(.linear(duration: 0.2)) {
                self.scale = self.scale == 1 ? 1.3 : 1
                self.opacity = 1 - self.opacity
            }
            withAnimation {
                self.opacity = 1 - self.opacity
            }
        }
        .scaleEffect(self.scale)
        .foregroundColor(self.isLiked ? .red : .gray)
    }
}
