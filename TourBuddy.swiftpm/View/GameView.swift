//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

struct GameView: View {
    var body: some View {
            VStack {
                CardStackView()
                HStack {
                    Button("X") {
                        print("X Pressed")
                    }
                    Spacer()
                    Button("O") {
                        print("O Pressed")
                    }
                }
                .frame(width: 300)
            }
        }
}

#Preview {
    GameView()
}
