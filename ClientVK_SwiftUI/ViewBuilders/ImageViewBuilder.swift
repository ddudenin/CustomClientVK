//
//  ImageViewBuilder.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 30.11.2021.
//

import SwiftUI
import Kingfisher

struct CellImage: View {
    
    @State private var scaleFactor = 1.0
    @State private var hasBegun = false
    @State private var hasEnded = false
    
    var content: KFImage
    var shadowColor: Color
    
    init(shadowColor: Color = .black, @ViewBuilder content: () -> KFImage) {
        self.shadowColor = shadowColor
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .scaledToFill()
            .frame(width: 30, height: 30)
            .cornerRadius(15)
            .modifier(CircleShadow(shadowColor: self.shadowColor,
                                   shadowRadius: 5,
                                   shadowOpacity: 0.75))
            .scaleEffect(scaleFactor)
            .animation(.spring(response: 0.5, dampingFraction: 0.35, blendDuration: 0.25), value: self.scaleFactor)
            .padding()
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { event in
                        guard !self.hasEnded else { return }
                        
                        if self.hasBegun == false {
                            self.hasBegun = true
                            withAnimation {
                                self.scaleFactor = 1.75
                            }
                        } else if self.isTooFar(event.translation) {
                            self.hasEnded = true
                            withAnimation {
                                self.scaleFactor = 1.0
                            }
                        }
                    }
                    .onEnded { event in
                        if !self.hasEnded {
                            withAnimation {
                                self.scaleFactor = 1.0
                            }
                        }
                        self.hasBegun = false
                        self.hasEnded = false
                    })
    }
    
    private func isTooFar(_ translation: CGSize) -> Bool {
        let distance = pow(translation.width, 2) + pow(translation.height, 2)
        return distance >= 255.0
    }
}
