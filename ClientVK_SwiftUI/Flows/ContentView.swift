//
//  ContentView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 05.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shouldShowMainView: Bool = false
    @ObservedObject var contentViewModel = ContentViewModel()
    
    var body: some View {
        if contentViewModel.isUserAuthorized {
            TabView {
                FriendsView()
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Друзья")
                    }
                GroupsView()
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
            .transition(AnyTransition.asymmetric(insertion: .scale, removal: .opacity))
        } else {
            VKLoginWebView()
                .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("vkTokenSaved"))) { _ in
                    contentViewModel.isUserAuthorized = true
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
