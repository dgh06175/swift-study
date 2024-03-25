//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardsViewModel
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    
    let model: Card
    @Binding var player: User
    @Binding var progressAmount: Double
    
    var body: some View {
        ZStack{
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.travelWallet3)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                    )
                SwipeActionIndicatorView(xOffsett: $xOffset)
            }
            
            Text(model.question)
                .font(.title)
                .foregroundColor(.black)
                .padding()
        }
        .onReceive(viewModel.$buttonSwipeAction, perform: { action in // O, X 버튼 작동 위한 코드
            onReveiveSwipeAction(action) 
        })
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
        
    }
    
    func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
    
    func swipeRight() {
        player.status.adventure += model.status.adventure
        player.status.plan += model.status.plan
        player.status.energy += model.status.energy
        player.status.money += model.status.money
        
        withAnimation {
            xOffset = 500
            degrees = 12
        } completion: {
            viewModel.removeCard(model)
            progressAmount += 1.0
            print(progressAmount)
        }

    }
    
    func swipeLeft() {
        player.status.adventure -= model.status.adventure
        player.status.plan -= model.status.plan
        player.status.energy -= model.status.energy
        player.status.money -= model.status.money
        
        withAnimation { 
            xOffset = -500
            degrees = -12
        } completion: {
            viewModel.removeCard(model)
            progressAmount += 1.0
            print(progressAmount)
        }
    }
    
    // O, X 버튼 작동 함수
    func onReveiveSwipeAction(_ action: SwipeAction?) {
        guard let action else { return }
        
        let topCard = viewModel.cardModels.last
        
        if topCard == model {
            switch action {
            case .NO:
                swipeLeft()
            case .YES:
                swipeRight()
            }
        }
    }
}

private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let moveAmount = value.translation.width
        
        if abs(moveAmount) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        
        if moveAmount > SizeConstants.screenCutoff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}
