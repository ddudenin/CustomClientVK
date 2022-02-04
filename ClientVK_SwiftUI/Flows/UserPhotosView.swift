//
//  UserPhotosView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 05.12.2021.
//

import SwiftUI

struct UserPhotosView: View {
    
    @ObservedObject var viewModel = UserPhotoViewModel(vkService: VKService())
    let user: RLMUser
    
    let columns = Array(repeating: GridItem(.flexible(minimum: 0, maximum: .infinity)),
                        count: 3)
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
                    ForEach(self.viewModel.photos) { photo in
                        let displayItem = PhotoDisplayItemFactory.make(for: photo)
                        UserPhotoCellView(photo: displayItem, isLiked: displayItem.hasUserLike)
                            .frame(height: geometry.size.width/3)
                    }
                }
            }
        }
        .onAppear {
            self.viewModel.fetchPhotos(for: self.user)
        }
        .navigationTitle(self.user.fullName)
        .listStyle(.plain)
    }
    
    
}

struct UserPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        UserPhotosView(user: RLMUser())
    }
}
