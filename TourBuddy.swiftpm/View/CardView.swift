//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

struct CardView: View {
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    
    let model: Card
    
    var body: some View {
        ZStack{
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(radius: 5)
                SwipeActionIndicatorView(xOffsett: $xOffset)
            }
            
            Text(model.question)
                .font(.title)
                .foregroundColor(.black)
                .padding()
        }
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
        xOffset = 500
        degrees = 12
    }
    
    func swipeLeft() {
        xOffset = -500
        degrees = -12
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



#Preview {
    CardView(model: cards[0])
}
