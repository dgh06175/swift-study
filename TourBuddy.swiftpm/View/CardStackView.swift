//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

struct CardStackView: View {
    @Binding var player: User
    // CardService 에 의존한다.
    @StateObject var viewModel: CardsViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                ForEach(Array(viewModel.cardModels.enumerated()), id: \.element.id) { index, card in
                        CardView(
                            viewModel: viewModel,
                            model: card,
                            player: $player,
                            xCardMove: CGFloat(index * 2),
                            yCardMove: CGFloat(index * 2)
                        )
                    }
            }
            
            if !viewModel.cardModels.isEmpty {
                SwipeActionButtonView(viewModel: viewModel)
            }
        }
    } 
}

struct CardStackView_Previews: PreviewProvider {
    @State static var previewPlayer: User = MockData.users[0]
    
    static var previews: some View {
        CardStackView(player: $previewPlayer, viewModel: CardsViewModel(service: CardService()))
    }
}
