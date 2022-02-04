//
//  UserCellView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 30.11.2021.
//

import SwiftUI
import Kingfisher

struct UserCellView: View {
    
    let user: RLMUser
    
    var body: some View {
        HStack {
            CellImage(color: self.user.online == 1 ? Color.green : Color.black) {
                KFImage(URL(string: self.user.avatarURL))
                    .cancelOnDisappear(true)
                    .resizable()
            }
            
            VStack (alignment: .leading) {
                Text(self.user.fullName)
                Text(self.user.city?.title ?? "")
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
        UserCellView(user: RLMUser())
    }
}
