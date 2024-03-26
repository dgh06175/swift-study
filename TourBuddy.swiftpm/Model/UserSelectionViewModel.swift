//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/26/24.
//

import SwiftUI

class UserSelectionViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var XSelectUsers: [User] = []
    @Published var OSelectUsers: [User] = []
    
    // 사용자 선택 로직
    func randomSelectRandomTime() {
        // 배열의 초기 크기 만큼 반복
        for _ in users.indices {
            let randomDelay = Double.random(in: 2...5) // 2초에서 5초 사이의 랜덤 지연 시간
            
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
    
    func initializeUsers() {
        withAnimation(.easeInOut(duration: 0.2)) {
            self.users = {
                MockData.users.dropFirst().map { user -> User in
                    return user
                }
            }()
            self.XSelectUsers = []
            self.OSelectUsers = []
            randomSelectRandomTime()
        }
    }
}
