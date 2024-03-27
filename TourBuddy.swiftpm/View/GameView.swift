//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel = CardsViewModel(service: CardService())
    @StateObject var userSelectionViewModel = UserSelectionViewModel()
    
    @Binding var player: User
    
    var body: some View {
        NavigationStack {
            if viewModel.cardModels.isEmpty {
                FakeLoadingView(player: $player)
            } else {
                GameMainView(
                    viewModel: viewModel,
                    userSelectionViewModel: userSelectionViewModel,
                    player: $player
                )
            }
        }
    }
}

struct GameMainView: View {
    @StateObject var viewModel: CardsViewModel
    @StateObject var userSelectionViewModel: UserSelectionViewModel
    @Binding var player: User
    @State private var isMicOn = true
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 40)
            UserSelectView(userSelectionViewModel: userSelectionViewModel)
            Spacer()
            CardStackView(
                player: $player,
                viewModel: viewModel,
                userSelectionViewModel: userSelectionViewModel
            )
                .frame(width: 250)
            Spacer()
                .frame(height: 30)
            HStack {
                Spacer()
                Image(systemName: isMicOn ? "mic.circle" : "mic.slash.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(isMicOn ? Color.gray : Color.lightGray)
                    .onTapGesture {
                        isMicOn.toggle()
                    }
            }
            .padding()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    @State static var previewPlayer: User = MockData.users[0]
    
    static var previews: some View {
        GameView(player: $previewPlayer)
    }
}
