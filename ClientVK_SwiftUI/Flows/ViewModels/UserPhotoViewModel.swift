//
//  UserPhotoViewModel.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 11.12.2021.
//

import Foundation

class UserPhotoViewModel: ObservableObject {
   
    @Published var photos: [RLMPhoto] = []
    let vkService: AnyVKService
    
    init(vkService: AnyVKService) {
        self.vkService = vkService
    }
    
    func fetchPhotos(for user: RLMUser) {
        vkService.getPhotos(userId: user.id) { [weak self] items in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.photos = items
            }
        }
    }
}

