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
    @State private var isMicOn = true 
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 40)
                Text("참여를 대기하고 있습니다")
                    .font(.system(size: 24, weight: .bold))
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.brandColorLight)
                        .frame(width: 100, height: 45)
                    Text("\(readyCount)/6")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(Color.brandColorHeavy)
                }
                Spacer()
                VStack {
                    HStack {
                        UserReadyView(readyCount: $readyCount, user: MockData.users[0])
                        UserReadyView(readyCount: $readyCount, user: MockData.users[1])
                        UserReadyView(readyCount: $readyCount, user: MockData.users[2])
                    }
                    HStack {
                        UserReadyView(readyCount: $readyCount, user: MockData.users[3])
                        UserReadyView(readyCount: $readyCount, user: MockData.users[4])
                        UserReadyView(readyCount: $readyCount, user: MockData.users[5])
                    }
                    
                }
                .navigationDestination(isPresented: $navigateToGame) {
                    GameView(player: $player)
                }
                Spacer()
                GameStartButtonView(readyCount: readyCount, navigateToGame: $navigateToGame)
//                NavigationLink(destination: GameView(player: $player), isActive: $navigateToGame) {
//                    EmptyView()
//                }
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
}

struct UserReadyView: View {
    @Binding var readyCount: Int
    @State var isReady : Bool = false
    var user: User
    
    var body: some View {
        VStack {
            Button(action: {
                isReady.toggle()
                if isReady {
                    readyCount += 1
                } else {
                    readyCount -= 1
                }
            }) {
                UserImageButtonView(isReady: $isReady, user: user)
            }
            Text(user.name)
                .foregroundStyle(isReady ? Color.black : Color.gray)
        }
        .opacity(isReady ? 1 : 0.3)
        .padding()
    }
}

struct UserImageButtonView: View {
    @Binding var isReady : Bool
    var user: User
    
    var body: some View {
        ZStack {
            user.image
                .resizable()
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.gray, lineWidth: 3)
                }
                .frame(width: 80, height: 80)
            Circle()
                .fill(Color.onlineColor)
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .frame(width: 22, height: 22)
                .offset(CGSize(width: 26.0, height: 26.0))
                .opacity(isReady ? 1 : 0)
        }
    }
}

struct GameStartButtonView: View {
    let readyCount: Int
    @Binding var navigateToGame: Bool
    
    var body: some View {
        Button("게임 시작!"){
            navigateToGame = true
        }
        .frame(width: 140, height: 60)
        .disabled(readyCount != 6)
        .background(readyCount == 6 ? Color.brandColor : Color.lightGray)
        .foregroundColor(readyCount == 6 ? Color.white : Color.gray)
        .font(.system(size: 20, weight: .semibold))
        .cornerRadius(30)
        .padding()
    }
}

#Preview {
    GameReadyView()
}
