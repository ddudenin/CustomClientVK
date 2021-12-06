//
//  SectionDataModel.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 05.12.2021.
//

import Foundation

struct SectionDataModel: Identifiable {
    
    var id: String {
        return letter
    }
    
    let letter: String
}

extension SectionDataModel: Equatable {
    static func == (lhs: SectionDataModel, rhs: SectionDataModel) -> Bool {
        return lhs.letter == rhs.letter
    }
}
