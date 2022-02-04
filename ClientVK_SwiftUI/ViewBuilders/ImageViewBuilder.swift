//
//  ImageViewBuilder.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 30.11.2021.
//

import SwiftUI
import Kingfisher

struct CellImage: View {
    var content: KFImage
    var shadowColor: Color
    
    init(color: Color = .black, @ViewBuilder content: () -> KFImage) {
        self.shadowColor = color
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
            .padding()
    }
}
