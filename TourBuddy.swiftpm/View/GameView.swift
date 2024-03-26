//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel = CardsViewModel(service: CardService())
    @Binding var player: User
    @State var progressAmount: Double = 00.0
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.cardModels.isEmpty {
                    FakeLoadingView(player: $player)
                } else {
                    ProgressView(value: progressAmount, total: Double(cards.capacity))
                        .animation(.snappy, value: progressAmount)
                        .frame(width: 300)
                        .padding(100)
                    Spacer()
                    CardStackView(player: $player, progressAmount: $progressAmount, viewModel: viewModel)
                        .frame(width: 300)
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    @State static var previewPlayer: User = MockData.users[0]
    
    static var previews: some View {
        GameView(player: $previewPlayer)
    }
}
