//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

struct CardService {
    func fetchCardModels() async throws -> [Card] {
        let cardsData = cards
        return cardsData
    }
}
