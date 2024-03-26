//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/23/24.
//

import SwiftUI

struct GameReadyView: View {
    @State var readyCount: Int = 0
    @State private var navigateToGame = false
    @State var player: User = MockData.users[0]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                ForEach(MockData.users) { user in
                    UserView(readyCount: $readyCount, user: user)
                }
                GameStartButtonView(readyCount: readyCount, navigateToGame: $navigateToGame)
            }
            .navigationDestination(isPresented: $navigateToGame) {
                GameView(player: $player)
            }
        }
        .padding()
        
    }
}

struct UserView: View {
    @Binding var readyCount: Int
    @State var isReady : Bool = false
    var user: User
    
    var body: some View {
        HStack(spacing: 28) {
            ZStack {
                Circle()
                    .fill(Color.lightGray)
                    .frame(width: 58, height: 58)
                user.image
                    .resizable()
                    .foregroundStyle(Color.gray)
                    .frame(width: 60, height: 60)
            }
            
            Button(action: {
                isReady.toggle()
                if isReady {
                    readyCount += 1
                } else {
                    readyCount -= 1
                }
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(isReady ? Color.travelWallet3 : Color.lightGray)
                        .frame(width: 250, height: 60)
                    Text(user.name).foregroundStyle(Color.black)
                        .font(.title2)
                }
            })
        }
    }
}

struct GameStartButtonView: View {
    let readyCount: Int
    @Binding var navigateToGame: Bool
    
    var body: some View {
        Button("게임 시작") {
            if readyCount == 6 {
                navigateToGame = true
            }
        }
        .disabled(readyCount != 6)
        .padding(40)
        .background(readyCount == 6 ? Color.travelWallet2 : Color.lightGray)
        .foregroundColor(.black)
        .cornerRadius(10)
        .padding(40)
    }
}

#Preview {
    GameReadyView()
}
