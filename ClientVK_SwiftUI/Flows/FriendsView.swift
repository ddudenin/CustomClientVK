//
//  FriendsView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 05.12.2021.
//

import SwiftUI

struct FriendsView: View {
    
    @ObservedObject var viewModel = FriendsViewModel(realmService: RealmService(), vkService: VKService())
    
    var body: some View {
        NavigationView {
            if let error = self.viewModel.error {
                Text(error.localizedDescription)
            } else {
                List(self.prepareSectionsData(), rowContent: { section in
                    Section(header: Text("\(section.letter)")) {
                        ForEach(getUsersArray(section: section.letter)) { user in
                            NavigationLink(destination: UserPhotosView(user: user)) {
                                UserCellView(user: UserDisplayItemFactory.make(for: user))
                            }
                        }
                    }
                })
                    .listStyle(.plain)
                    .onAppear {
                        self.viewModel.fetchFriends()
                    }
                    .navigationTitle("Друзья")
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private func prepareSectionsData() -> [SectionDataModel] {
        var resultArray = [SectionDataModel]()
        
        for user in viewModel.detachedFriends {
            let letterModel = SectionDataModel(letter: String(user.lastName.prefix(1)))
            if !resultArray.contains(letterModel) {
                resultArray.append(letterModel)
            }
        }
        
        resultArray = resultArray.sorted(by: { $0.letter < $1.letter })
        
        return resultArray
    }
    
    private func getUsersArray(section letter: String) -> [RLMUser] {
        var resultArray = [RLMUser]()
        
        for user in self.viewModel.detachedFriends where String(user.lastName.prefix(1)) == letter {
            resultArray.append(user)
        }
        
        return resultArray
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
