//
//  GroupsView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 05.12.2021.
//

import SwiftUI

struct GroupsView: View {
    
    @ObservedObject var viewModel = GroupsViewModel(realmService: RealmService(), vkService: VKService())
    
    var body: some View {
        List(self.viewModel.detachedGroups) { group in
            GroupCellView(group: GroupDisplayItemFactory.make(for: group))
        }
        .onAppear {
            self.viewModel.fetchGroups()
        }
        .navigationTitle("Группы")
        .listStyle(.plain)
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
