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
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(MockData.users) { user in
                    UserView(readyCount: $readyCount, user: user)
                }
                GameStartButtonView(readyCount: readyCount, navigateToGame: $navigateToGame)
            }
            .navigationDestination(isPresented: $navigateToGame) {
                GameView()
            }
        }
    }
}

struct UserView: View {
    @Binding var readyCount: Int
    @State var isReady : Bool = false
    var user: User
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 58, height: 58)
                user.image
                    .resizable()
                    .foregroundStyle(Color.black)
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
                        .fill(isReady ? Color.blue : Color.lightGray)
                        .frame(width: 300, height: 60)
                    Text(user.name).foregroundStyle(Color.black)
                        .font(.title2)
                }
            })
        }
        .padding(6)
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
        .padding()
        .background(readyCount == 6 ? Color.green : Color.lightGray)
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding()
    }
}

#Preview {
    GameReadyView()
}
