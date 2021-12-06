//
//  FriendsView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 05.12.2021.
//

import SwiftUI

struct FriendsView: View {
    @State private var users: [User] = [
        User(lastName: "Cook",
             firstName: "Tim",
             avatar: "TimCook",
             city: "Mobile",
             isOnline: Bool.random()),
        User(lastName: "Adams",
             firstName: "Katherine",
             avatar: "KatherineAdams",
             city: "New York",
             isOnline: Bool.random()),
        User(lastName: "Cue",
             firstName: "Eddy",
             avatar: "EddyCue",
             city: nil,
             isOnline: Bool.random()),
        User(lastName: "Federighi",
             firstName: "Craig",
             avatar: "CraigFederighi",
             city: "Miami",
             isOnline: Bool.random()),
        User(lastName: "Giannandrea",
             firstName: "John",
             avatar: "JohnGiannandrea",
             city: nil,
             isOnline: Bool.random()),
        User(lastName: "Joswiak",
             firstName: "Greg",
             avatar: "GregJoswiak",
             city: nil,
             isOnline: Bool.random()),
        User(lastName: "Khan",
             firstName: "Sabih",
             avatar: "SabihKhan",
             city: nil,
             isOnline: Bool.random()),
        User(lastName: "Maestri",
             firstName: "Luca",
             avatar: "LucaMaestri",
             city: "Rome",
             isOnline: Bool.random()),
        User(lastName: "O'Brien",
             firstName: "Deirdre",
             avatar: "DeirdreOBrien",
             city: nil,
             isOnline: Bool.random()),
        User(lastName: "Srouji",
             firstName: "Johny",
             avatar: "JohnySrouji",
             city: "Haifa",
             isOnline: Bool.random()),
        User(lastName: "Ternus",
             firstName: "John",
             avatar: "JohnTernus",
             city: nil,
             isOnline: Bool.random()),
        User(lastName: "Williams",
             firstName: "Jeff",
             avatar: "JeffWilliams",
             city: nil,
             isOnline: Bool.random()),
        User(lastName: "Jackson",
             firstName: "Lisa",
             avatar: "LisaJackson",
             city: nil,
             isOnline: Bool.random()),
        User(lastName: "Low",
             firstName: "Stella",
             avatar: "StellaLow",
             city: nil,
             isOnline: Bool.random()),
        User(lastName: "Ge Mahe",
             firstName: "Isabel",
             avatar: "IsabelGeMahe",
             city: "Shenyang",
             isOnline: Bool.random()),
        User(lastName: "Myhren",
             firstName: "Tor",
             avatar: "TorMyhren",
             city: nil,
             isOnline: Bool.random()),
        User(lastName: "Perica",
             firstName: "Adrian",
             avatar: "AdrianPerica",
             city: nil,
             isOnline: Bool.random()),
        User(lastName: "Schiller",
             firstName: "Phil",
             avatar: "PhilSchiller",
             city: "Boston",
             isOnline: Bool.random()),
    ]
    
    var body: some View {
        List(arrayLetter(), rowContent: { section in
            Section(header: Text("\(section.letter)")) {
                ForEach(arrayByLetter(section.letter)) { user in
                    NavigationLink(destination: UserPhotosView(user: user)) {
                        UserCellView(user: user)
                    }
                }
            }
        })
            .listStyle(.plain)
    }
    
    private func arrayLetter() -> [SectionDataModel] {
        var resultArray = [SectionDataModel]()
        
        for user in users {
            let nameLetter = String(user.lastName.prefix(1))
            let letterModel = SectionDataModel(letter: nameLetter)
            if !resultArray.contains(letterModel) {
                resultArray.append(letterModel)
            }
        }
        
        resultArray = resultArray.sorted(by: { $0.letter < $1.letter })
        
        return resultArray
    }
    
    private func arrayByLetter(_ letter: String) -> [User] {
        var resultArray = [User]()
        
        for user in users {
            let nameLetter = String(user.lastName.prefix(1))
            if nameLetter == letter {
                resultArray.append(user)
            }
        }
        
        return resultArray
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
