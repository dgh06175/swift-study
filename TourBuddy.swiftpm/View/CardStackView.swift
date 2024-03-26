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
    @State var index: Int = 0
    
    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                ForEach(Array(viewModel.cardModels.enumerated()), id: \.element.id) { i, card in
                    CardView(
                        viewModel: viewModel,
                        model: card,
                        player: $player,
                        index: $index,
                        xCardMove: CGFloat(i * 2),
                        yCardMove: CGFloat(i * 2)
                    )
                }
            }
            SwipeActionTutorial()
                .opacity(index == 0 ? 1 : 0)
//            if !viewModel.cardModels.isEmpty {
//                SwipeActionButtonView(viewModel: viewModel)
//            }
        }
    } 
}

struct SwipeActionTutorial: View {
    var body: some View {
        Text("좌우로 밀어서 선택")
            .foregroundStyle(Color.gray)
            .padding()
    }
}

struct CardStackView_Previews: PreviewProvider {
    @State static var previewPlayer: User = MockData.users[0]
    @State var index: Int = 0
    @State var isSelectionFinished: Bool = false
    
    static var previews: some View {
        CardStackView(
            player: $previewPlayer,
            viewModel: CardsViewModel(
                service: CardService()
            )
        )
    }
}
