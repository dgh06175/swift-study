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
    @State var index: Int = 0
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 40)
            GameProgressBarView(currentIndex: index, totalCount: 7)
                .frame(height: 20)
                .padding(.horizontal)
            UserSelectView(userSelectionViewModel: userSelectionViewModel)
            Spacer()
            CardStackView(
                player: $player,
                viewModel: viewModel,
                userSelectionViewModel: userSelectionViewModel,
                index: $index
            )
            .frame(width: 250)
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

struct GameProgressBarView: View {
    var currentIndex: Int // 현재 인덱스
    var totalCount: Int // 총 카운트

    var body: some View {
            ProgressView(value: Float(currentIndex), total: Float(totalCount))
                .progressViewStyle(LinearProgressViewStyle(tint: Color.blue)) // 프로그레스 바의 색상 지정
                .scaleEffect(x: 1, y: 2, anchor: .center) // 프로그레스 바의 높이 조절
                .animation(.linear, value: currentIndex)
                .padding() // 적절한 패딩 추가
        }
}

struct GameView_Previews: PreviewProvider {
    @State static var previewPlayer: User = MockData.users[0]
    
    static var previews: some View {
        GameView(player: $previewPlayer)
    }
}
