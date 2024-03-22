//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

struct SwipeActionIndicatorView: View {
    @Binding var xOffsett: CGFloat
    
    var body: some View {
        HStack {
            Text("O")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundStyle(.green)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.green, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(-30))
                .opacity(Double(xOffsett / SizeConstants.screenCutoff))
            Spacer()
            
            Text("X")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundStyle(.red)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.red, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(30))
                .opacity(Double(xOffsett / SizeConstants.screenCutoff) * -1)
        }
        .padding(40)
    }
}


#Preview {
    SwipeActionIndicatorView(xOffsett: .constant(20))
}
