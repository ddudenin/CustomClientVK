//
//  GroupCellView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 30.11.2021.
//

import SwiftUI

struct GroupCellView: View {
    var body: some View {
        HStack {
            CellImage {
                Image("photo")
            }

            Text("group name")
            
            Spacer()
        }
    }
}

struct GroupCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupCellView()
    }
}
