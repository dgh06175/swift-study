//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/26/24.
//

import SwiftUI

struct UserSelectView: View {
    @State var users: [User]
    @State var XSelectUsers: [User] = []
    @State var OSelectUsers: [User] = []
    
    var body: some View {
        VStack {
            HStack {
                Text("X")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color.red)
                    .frame(width: 100)
                
                Text("선택 대기")
                    .font(.system(size: 22, weight: .semibold))
                    .frame(width: 130)
                
                Text("O")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color.brandColor)
                    .frame(width: 100)
                
            }
            HStack {
                VStack(alignment: .trailing) {
                    ForEach(XSelectUsers) { user in
                        GameUserView(user: user)
                    }
                    Spacer()
                }
                .frame(width: 100)
                VStack {
                    ForEach(users) { user in
                        GameUserView(user: user)
                    }
                    Spacer()
                }
                .frame(width: 130)
                VStack {
                    ForEach(OSelectUsers) { user in
                        GameUserView(user: user)
                    }
                    Spacer()
                }
                .frame(width: 100)
            }
        }
        .frame(height: 245)
        .onAppear() {
            randomSelectRandomTime()
        }
        
    }
    
    private func randomSelectRandomTime() {
        // 배열의 초기 크기 만큼 반복
        for _ in users.indices {
            let randomDelay = Double.random(in: 2...7) // 0초에서 5초 사이의 랜덤 지연 시간
            
            // 비동기 작업을 각 다른 스레드에 예약한다.
            DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + randomDelay) {
                // 실제 배열 수정은 메인 스레드에서 수행된다. -> 동시성 문제가 발생하지 않는다.
                DispatchQueue.main.async {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        guard !self.users.isEmpty else { return } // 배열이 비었으면 반복 종료
                        
                        // users 배열에서 랜덤한 원소 선택
                        let randomIndex = self.users.indices.randomElement()!
                        let selectedUser = self.users.remove(at: randomIndex)
                        
                        // XSelectUsers 또는 OSelectUsers 배열로 랜덤하게 이동
                        if Bool.random() {
                            self.XSelectUsers.append(selectedUser)
                        } else {
                            self.OSelectUsers.append(selectedUser)
                        }
                    }
                }
            }
        }
    }
}

struct GameUserView: View {
    var user: User
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.lightGray2)
                .frame(width: 80, height: 28)
                
            HStack {
                Spacer()
                    .frame(width: 5)
                ZStack(alignment: .center) {
                    Circle()
                        .fill(Color.lightGray)
                        .frame(width: 18, height: 18)
                    user.image
                        .resizable()
                        .foregroundStyle(Color.gray)
                        .frame(width: 20, height: 20)
                }
                Spacer()
                Text(user.name)
                    .font(.system(size: 15, weight: .semibold))
                Spacer()
            }
            .frame(width: 80, height: 28)
        }
    }
}

#Preview {
    UserSelectView(users: MockData.users)
}
