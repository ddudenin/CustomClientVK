//
//  FriendsViewModel.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 11.12.2021.
//

import Foundation
import RealmSwift

class FriendsViewModel: ObservableObject {
    
    var detachedFriends: [RLMUser] {
        return self.realmFriends?.map { $0.detached() } ?? []
    }
    
    let realmService: AnyRealmService
    let vkService: AnyVKService
    
    private var notificationToken: NotificationToken?
    let objectWillChange = ObjectWillChangePublisher()
    var error: Error?
    
    private lazy var realmFriends: Results<RLMUser>? = try? realmService.get(RLMUser.self,
                                                                             configuration: .deleteIfMigration).sorted(byKeyPath: "firstName")
    
    init(realmService: AnyRealmService, vkService: AnyVKService) {
        self.realmService = realmService
        self.vkService = vkService
        
        self.subscribeForDatabaseChanges()
    }
    
    private func subscribeForDatabaseChanges() {
        self.notificationToken = self.realmFriends?.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    func fetchFriends() {
        self.vkService.getFriends() { [weak self] users in
            guard let self = self else { return }
            
            try? self.realmService.save(items: users,
                                        configuration: .deleteIfMigration,
                                        update: .modified)
        }
    }
}
