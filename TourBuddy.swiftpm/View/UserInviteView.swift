//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/26/24.
//

import SwiftUI

struct UserInviteView: View {
    @State var player: User = MockData.users[0]
    @State private var navigateToReady = false

    var body: some View {
        ZStack {
            GameReadyView()
                .opacity(navigateToReady ? 1 : 0)
            // 화면 전환 애니메이션을 적용합니다.
                .animation(.easeInOut(duration: 0.5), value: navigateToReady)
            // 애니메이션 효과를 위해 조건부로 ZStack 내부에 배치합니다.
            if !navigateToReady {
                VStack {
                    Spacer()
                        .frame(height: 40)
                    Text("여행 인원을 초대해주세요")
                        .font(.system(size: 24, weight: .bold))
                    HStack(spacing: 100) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.brandColorLight)
                                .frame(width: 100, height: 45)
                            Text("6명")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(Color.brandColorHeavy)
                        }
                        Image(systemName: "person.badge.plus")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    Spacer()
                    VStack {
                        HStack {
                            InvitedUserView(user: MockData.users[0])
                            InvitedUserView(user: MockData.users[1])
                            InvitedUserView(user: MockData.users[2])
                        }
                        HStack {
                            InvitedUserView(user: MockData.users[3])
                            InvitedUserView(user: MockData.users[4])
                            InvitedUserView(user: MockData.users[5])
                        }
                        
                    }
                    Spacer()
                    GameReadyViewButtonView(navigateToReady: $navigateToReady)
                        .padding()
                    Spacer()
                        .frame(height: 60)
                }
                .transition(.asymmetric(insertion: .identity, removal: .move(edge: .leading)))
                .animation(.easeInOut(duration: 0.5), value: navigateToReady)
            }
        }
    }
}

struct InvitedUserView: View {
    var user: User
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.lightGray)
                    .frame(width: 78, height: 78)
                user.image
                    .resizable()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.gray, lineWidth: 3)
                    }
                    .frame(width: 80, height: 80)
            }
            Text(user.name)
                .foregroundStyle(Color.black)
        }
        .padding()
    }
}

struct GameReadyViewButtonView: View {
    @Binding var navigateToReady: Bool
    
    var body: some View {
        Button("다음") {
            navigateToReady = true
        }
        .frame(width: 140, height: 60)
        .background(Color.brandColor)
        .foregroundColor(Color.white)
        .font(.system(size: 20, weight: .semibold))
        .cornerRadius(30)
    }
}


#Preview {
    UserInviteView()
}
