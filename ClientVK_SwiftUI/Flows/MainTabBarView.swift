//
//  MainTabBarView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 18.12.2021.
//

import SwiftUI

struct MainTabBarView: View {

    var body: some View {
        TabView {
            FriendsView()
                .navigationBarTitle("", displayMode: .inline)
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Друзья")
                }
            
            GroupsView()
                .navigationBarTitle("", displayMode: .inline)
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Группы")
                }
            
            NewsfeedView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Новости")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}
