//
//  ContentViewModel.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 11.12.2021.
//

import Foundation
import SwiftKeychainWrapper

class ContentViewModel: ObservableObject {
    
    @Published var isUserAuthorized: Bool = false
    private let timeToSecond: Double = 86400.0
    
    init() {
        checkValidToken()
    }
    
    private func checkValidToken()  {
        if let keychainData = KeychainWrapper.standard.string(forKey: "user") {
            let data = Data(keychainData.utf8)
            
            if let decodeUser = decode(json: data, as: KeychainUser.self) {
             
                let now = Date().timeIntervalSince1970
                let isValidDate = (now - decodeUser.date) < timeToSecond
                
                if isValidDate {
                    UserDefaults.standard.set(decodeUser.token, forKey: "vkToken")
                    UserDefaults.standard.set(decodeUser.id, forKey: "userId")
                    
                    isUserAuthorized = true
                }
            }
        }
    }
    
}
