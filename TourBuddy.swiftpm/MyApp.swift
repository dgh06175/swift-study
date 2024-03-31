import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            //ProfileSetting()
            ViewTest()
        }
    }
}

struct ViewTest: View {
    var body: some View {
        Circle()
            .fill(Color.gray)
            .frame(width: 140, height: 140)
        Circle()
            .stroke(.black, lineWidth: 4)
            .frame(width: 100)
    }
}
