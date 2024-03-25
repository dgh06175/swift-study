//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

struct CardStackView: View {
    @Binding var player: User
    @Binding var progressAmount: Double
    // CardService 에 의존한다.
    @StateObject var viewModel = CardsViewModel(service: CardService())
    
    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                ForEach(viewModel.cardModels) { card in
                    CardView(
                        viewModel: viewModel,
                        model: card,
                        player: $player,
                        progressAmount: $progressAmount
                    )
                }
            }
            
            if !viewModel.cardModels.isEmpty {
                SwipeActionButtonView(viewModel: viewModel)
            }
        }
    } 
}
