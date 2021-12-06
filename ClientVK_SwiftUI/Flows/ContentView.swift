//
//  ContentView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 05.12.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldShowMainView: Bool = false
    
    var body: some View {
        NavigationView {
            HStack {
                AuthView(isUserSignedIn: $shouldShowMainView)
                
                NavigationLink(
                    destination:
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
                        .navigationBarBackButtonHidden(true),
                    isActive: $shouldShowMainView,
                    label: {
                        EmptyView()
                    }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
