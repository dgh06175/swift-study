//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/26/24.
//

import SwiftUI

struct UserSelectView: View {
    @ObservedObject var userSelectionViewModel: UserSelectionViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("X")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color.red)
                    .frame(width: 100)
                
                Text("선택 현황")
                    .font(.system(size: 22, weight: .semibold))
                    .frame(width: 130)
                
                Text("O")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color.brandColor)
                    .frame(width: 100)
            }
            HStack {
                VStack(alignment: .trailing) {
                    ForEach(userSelectionViewModel.XSelectUsers) { user in
                        GameUserView(user: user)
                    }
                    Spacer()
                }
                .frame(width: 100)
                VStack {
                    ForEach(userSelectionViewModel.users) { user in
                        GameUserView(user: user)
                    }
                    Spacer()
                }
                .frame(width: 130)
                VStack {
                    ForEach(userSelectionViewModel.OSelectUsers) { user in
                        GameUserView(user: user)
                    }
                    Spacer()
                }
                .frame(width: 100)
            }
        }
        .frame(height: 245)
        .onAppear() {
            userSelectionViewModel.initializeUsers()
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
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.gray, lineWidth: 1)
                        }
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

//
//#Preview {
//    UserSelectView(users: MockData.users)
//}
