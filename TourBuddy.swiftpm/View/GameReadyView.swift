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
                Text("참여를 대기하고 있습니다.")
                    .font(.system(size: 24, weight: .bold))
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.brandColorLight)
                        .frame(width: 80, height: 35)
                    Text("\(readyCount)/6")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(Color.brandColorHeavy)
                }
                Spacer()
                VStack {
                    HStack {
                        UserView(readyCount: $readyCount, user: MockData.users[0])
                        UserView(readyCount: $readyCount, user: MockData.users[1])
                        UserView(readyCount: $readyCount, user: MockData.users[2])
                    }
                    HStack {
                        UserView(readyCount: $readyCount, user: MockData.users[3])
                        UserView(readyCount: $readyCount, user: MockData.users[4])
                        UserView(readyCount: $readyCount, user: MockData.users[5])
                    }
                    
                }
                .navigationDestination(isPresented: $navigateToGame) {
                    GameView(player: $player)
                }
                Spacer()
                GameStartButtonView(readyCount: readyCount, navigateToGame: $navigateToGame)
                    .padding()
                HStack {
                    Spacer()
                    Image(systemName: isMicOn ? "mic.circle" : "mic.slash.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(Color.gray)
                        .onTapGesture {
                            isMicOn.toggle()
                        }
                }
                .padding()
            }
        }
    }
}

struct UserView: View {
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
            }, label: {
                ZStack {
                    Circle()
                        .fill(Color.lightGray)
                        .frame(width: 78, height: 78)
                    user.image
                        .resizable()
                        .foregroundStyle(Color.gray)
                        .frame(width: 80, height: 80)
                    Circle()
                        .fill(Color.onlineColor)
                        .frame(width: 22, height: 22)
                        .offset(CGSize(width: 24.0, height: 24.0))
                        .opacity(isReady ? 1 : 0)
                }
            })
            Text(user.name)
                .foregroundStyle(isReady ? Color.black : Color.gray)
        }
        .opacity(isReady ? 1 : 0.3)
        .padding()
    }
}

struct GameStartButtonView: View {
    let readyCount: Int
    @Binding var navigateToGame: Bool
    
    var body: some View {
        Button("게임 시작!") {
            if readyCount == 6 {
                navigateToGame = true
            }
        }
        .frame(width: 140, height: 60)
        .disabled(readyCount != 6)
        .background(readyCount == 6 ? Color.brandColor : Color.lightGray)
        .foregroundColor(readyCount == 6 ? Color.white : Color.gray)
        .font(.system(size: 20, weight: .semibold))
        .cornerRadius(30)
    }
}

#Preview {
    GameReadyView()
}
