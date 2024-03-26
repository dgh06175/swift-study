import SwiftUI


extension Color {
    static let lightGray = Color(hexString: "D9D9D9")
    static let lightGreen1 = Color(hexString: "7FFF00")
    static let lightGreen2 = Color(hexString: "BEFF7C")    
    static let travelWallet1 = Color(red: 99/255, green: 173/255, blue: 252/255)
    static let travelWallet2 = Color(red: 129/255, green: 217/255, blue: 229/255)
    static let travelWallet3 = Color(red: 183/255, green: 255/255, blue: 241/255)

    static let brandColor = Color(hexString: "36C13B")
    static let brandColorLight = Color(hexString: "DFF2E0")
    static let brandColorHeavy = Color(hexString: "17821B")

}

// Color(hexColor: "FFCE30")
extension Color {
    init(hexString: String, opacity: Double = 1.0) {
        let hex: Int = Int(hexString, radix: 16)!
        let red = Double((hex >> 16) & 0xff) / 255
        let green = Double((hex >> 8) & 0xff) / 255
        let blue = Double((hex >> 0) & 0xff) / 255
        
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
