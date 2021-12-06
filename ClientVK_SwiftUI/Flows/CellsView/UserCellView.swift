//
//  UserCellView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 30.11.2021.
//

import SwiftUI

struct UserCellView: View {
    let user: User
    
    var body: some View {
        HStack {
            let color = self.user.isOnline ? Color.green : Color.black
            CellImage(color: color) {
                Image(self.user.avatar ?? "person.fill")
            }
            
            VStack (alignment: .leading){
                Text(self.user.getFullName())
                Text(self.user.city ?? "")
                    .font(.footnote)
                    .fontWeight(.thin)
            }
            .lineLimit(1)
            
            Spacer()
        }
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView(user: testUser)
    }
}
