//
//  GroupsView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 05.12.2021.
//

import SwiftUI

struct GroupsView: View {
    @State private var groups: [Group] = [
        testGroup,
        Group(name: "Полное прекращение работы Telegram в России", avatar: nil),
        Group(name: "Дворец Путина", avatar: "number.square.fill"),
        Group(name: "Соловьев. Live", avatar: "mic.slash.circle"),
    ]
    
    var body: some View {
        List(groups.sorted(by: { $0.name < $1.name}), rowContent: { group in
            GroupCellView(group: group)
        })
            .listStyle(.plain)
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
