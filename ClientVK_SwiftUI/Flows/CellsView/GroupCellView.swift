//
//  GroupCellView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 30.11.2021.
//

import SwiftUI
import Kingfisher

struct GroupCellView: View {
    
    let group: RLMGroup
    
    var body: some View {
        HStack {
            CellImage() {
                KFImage(URL(string: group.imageUrl))
                    .cancelOnDisappear(true)
                    .resizable()
            }
            
            Text(group.title)
            
            Spacer()
        }
    }
}

struct GroupCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupCellView(group: RLMGroup())
    }
}
