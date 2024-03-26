import SwiftUI

struct ResultUserView: View {
    var player: User
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: 356, height: 136)
                .shadow(color: Color.black.opacity(0.3), radius: 6, x: 2, y: 4)
            HStack(spacing: 18) {
                VStack {
                    player.image
                        .resizable()
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.gray, lineWidth: 2)
                        }
                        .frame(width: 60, height: 60)
                    Text(player.name)
                        .foregroundStyle(Color.gray)
                }
                VStack(alignment: .leading, spacing: 12){
                    StatusBarView(iconImage: Image(systemName: "figure.run"), statusPoint: player.status.energy)
                    StatusBarView(iconImage: Image(systemName: "dollarsign"), statusPoint: player.status.money)
                    StatusBarView(iconImage: Image(systemName: "map"), statusPoint: player.status.adventure)
                    StatusBarView(iconImage: Image(systemName: "calendar"), statusPoint: player.status.plan)
                }
            }
        }
        .frame(width: 356, height: 136)
    }
}

struct StatusBarView: View {
    let iconImage: Image
    var statusPoint: Int
    
    var body: some View {
        HStack {
            iconImage
                .foregroundStyle(Color.gray)
                .frame(width: 20, height: 20)
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 6.5)
                    .fill(Color.lightGray)
                    .frame(width: 220, height: 13)
                RoundedRectangle(cornerRadius: 6.5)
                    .fill(getColor())
                    .frame(width: CGFloat(220) * getStatusBarPercentage(), height: 13)
            }
        }
    }
    
    private func getStatusBarPercentage() -> CGFloat {
        return CGFloat((Double(statusPoint) + 12.0) / 24.0)
    }
    
    private func getColor() -> Color {
        let percentage = getStatusBarPercentage()
        if percentage >= 0.75 {
            return Color.lightGreen1
        }
        if percentage >= 0.5 {
            return Color.lightGreen2
        }
        if percentage >= 0.25 {
            return Color.gray
        }
        return Color.lightGray
    }
}

#Preview {
    ResultUserView(player: MockData.users[0])
}
