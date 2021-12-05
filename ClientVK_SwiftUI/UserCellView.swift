//
//  UserCellView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 30.11.2021.
//

import SwiftUI

struct UserCellView: View {
    var body: some View {
        HStack {
            CellImage {
                Image("person.fill")
            }
            
            VStack (alignment: .leading){
                Text("User name")
                Text("Status")
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
        UserCellView()
    }
}
