import SwiftUI

struct ResultView: View {
    var player: User
    
    var mockedUsers: [User] {
        MockData.users.dropFirst().map { user -> User in
            var mutableUser = user
            mutableUser.status = Status.mockStatus()
            return mutableUser
        }
    }
    
    var body: some View {
        VStack {
            Text("결과 화면")
                .font(.title)
                .padding(15)
                .foregroundStyle(Color.gray)
            HStack(spacing: 32) {
                iconDescription(
                    width: 25,
                    height: 35,
                    icon: Image(systemName: "figure.run"),
                    iconText: "체력"
                )
                iconDescription(
                    width: 20,
                    height: 35,
                    icon: Image(systemName: "dollarsign"),
                    iconText: "자금"
                )
                iconDescription(
                    width: 30,
                    height: 30,
                    icon: Image(systemName: "map"),
                    iconText: "모험"
                )
                iconDescription(
                    width: 30,
                    height: 30,
                    icon: Image(systemName: "calendar"),
                    iconText: "계획"
                )
            }
            .foregroundStyle(Color.gray)
            ScrollView {
                ResultUserView(player: player)
                    .padding(8)
                ForEach(mockedUsers) { user in
                    ResultUserView(player: user)
                        .padding(8)
                }
            }
        }
    }
}

struct iconDescription: View {
    let width: CGFloat
    let height: CGFloat
    let icon: Image
    let iconText: String
    
    var body: some View {
        VStack {
            icon
                .resizable()
                .frame(width: width, height: height)
            Spacer()
            Text(iconText)
        }
        .frame(height: 70)
    }
}

#Preview {
    ResultView(player: MockData.users[0])
}
