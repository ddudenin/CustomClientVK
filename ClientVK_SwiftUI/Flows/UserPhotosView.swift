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
    
    @ObservedObject var viewModel = UserPhotoViewModel(vkService: VKService())
    let user: RLMUser
    
    var body: some View {
        ASCollectionView(data: self.viewModel.photos) { photo, _ in
            let displayItem = PhotoDisplayItemFactory.make(for: photo)
            UserPhotoCellView(photo: displayItem, isLiked: displayItem.hasUserLike)
        }
        .layout {
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            let width = UIScreen.main.bounds.width / 2
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.itemSize = CGSize(width: width, height: width)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            layout.scrollDirection = .vertical
            return layout
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
