//
//  GroupsViewModel.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 11.12.2021.
//

import Foundation

import Foundation
import RealmSwift

class GroupsViewModel: ObservableObject {
  
    var detachedGroups: [RLMGroup] { realmGroups?.map { $0.detached() } ?? [] }
   
    let realmService: AnyRealmService
    let vkService: AnyVKService
    
    private var notificationToken: NotificationToken?
    let objectWillChange = ObjectWillChangePublisher()
    var error: Error?
    
    private lazy var realmGroups: Results<RLMGroup>? = try? realmService.get(RLMGroup.self, configuration: .deleteIfMigration)
    
    init(realmService: AnyRealmService, vkService: AnyVKService) {
        self.realmService = realmService
        self.vkService = vkService
        
        subscribeForDatabaseChanges()
    }
    
    private func subscribeForDatabaseChanges() {
        notificationToken = realmGroups?.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    func fetchGroups() {
        vkService.getGroups { [weak self] items in
            guard let self = self else { return }
            
            try? self.realmService.save(items: items,
                                        configuration: .deleteIfMigration,
                                        update: .modified)
        }
    }
}
