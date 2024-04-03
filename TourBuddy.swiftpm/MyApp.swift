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
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 40)
                Text("닉네임과 프로필 사진을 등록해주세요")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                Spacer()
                    .frame(height: 50)
                NavigationLink(destination: ScrollViewTest()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 100, height: 50)
                        Text("다음")
                            .font(.title3)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}


struct ScrollViewTest: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(0..<100) {
                    Text("Row \($0)")
                }
            }
       }
    }
}
