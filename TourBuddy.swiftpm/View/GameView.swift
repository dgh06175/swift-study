//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

struct GameView: View {
    @Binding var player: User
    @State var progressAmount: Double = 00.0
    
    var body: some View {
        VStack {
            ProgressView(value: progressAmount, total: Double(cards.capacity))
                .animation(.snappy, value: progressAmount)
                .frame(width: 300)
                .padding(100)
            HStack(spacing: 50) {
                Text("\(player.status.energy)")
                Text("\(player.status.money)")
                Text("\(player.status.adventure)")
                Text("\(player.status.plan)")
            }
            Spacer()
            CardStackView(player: $player, progressAmount: $progressAmount)
                .frame(width: 300)
            Spacer()
            Spacer()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    @State static var previewPlayer: User = MockData.users[0] // 예시 데이터
    
    static var previews: some View {
        GameView(player: $previewPlayer) // @State 변수를 @Binding으로 변환
    }
}
