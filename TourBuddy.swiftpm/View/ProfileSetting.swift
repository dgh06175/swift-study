//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/26/24.
//

import SwiftUI

struct ProfileSetting: View {
    @State var player: User = MockData.users[0]

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 40)
                Text("닉네임과 프로필 사진을 등록해주세요")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                Spacer()
                UserView(user: MockData.users[0])
                Spacer()
                
                NavigationLink(destination: UserInviteView()) {
                    UserInviteViewButtonView()
                }
                .padding()
                Spacer()
                    .frame(height: 60)
            }
        }
    }
}

struct UserView: View {
    var user: User
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.lightGray)
                    .frame(width: 140, height: 140)
                user.image
                    .resizable()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.gray, lineWidth: 4)
                    }
                    .frame(width: 140, height: 140)
            }
            Spacer()
                .frame(height: 14)
            Text(user.name)
                .foregroundStyle(Color.black)
                .font(.system(size: 20, weight: .semibold))
        }
        .padding()
    }
}

struct UserInviteViewButtonView: View {
    var body: some View {
        Text("다음")
            .frame(width: 140, height: 60)
            .background(Color.brandColor)
            .foregroundColor(Color.white)
            .font(.system(size: 20, weight: .semibold))
            .cornerRadius(30)
    }
}

#Preview {
    ProfileSetting()
}
