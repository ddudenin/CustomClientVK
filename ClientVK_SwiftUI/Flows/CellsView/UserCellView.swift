//
//  UserCellView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 30.11.2021.
//

import SwiftUI
import Kingfisher

struct UserCellView: View {
    
    let user: UserDisplayItem
    
    var body: some View {
        HStack {
            CellImage(shadowColor: self.user.shadowColor) {
                KFImage(URL(string: self.user.avatarURL))
                    .cancelOnDisappear(true)
                    .resizable()
            }
            
            VStack (alignment: .leading) {
                Text(self.user.fullName)
                Text(self.user.cityName)
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
        UserCellView(user: UserDisplayItem(fullName: "Tim Cook", avatarURL: "", cityName: "Cupertino", shadowColor: Color.green))
    }
}
