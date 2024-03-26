//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/26/24.
//

import SwiftUI

struct FakeLoadingView: View {
    @State private var isLoadingComplete = false // 로딩 완료 상태를 관리하는 상태 변수
    @Binding var player: User

    var body: some View {
        if isLoadingComplete {
            ResultView(player: player)
        } else {
            // 로딩 중 FakeLoading 화면 표시
            VStack(spacing: 50) {
                Text("계산 중...")
                    .font(.title)
                ProgressBarView()
            }
            .onAppear {
                // 1초 후에 isLoadingComplete 상태를 true로 변경
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isLoadingComplete = true
                }
            }
        }
    }
}

struct ProgressBarView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(5)
            .padding()
    }
}
