import SwiftUI

struct ContentView: View {
    
    @State private var key = UUID()
    private let base = "https://loremflickr.com/320/320"
    
    var body: some View {
        VStack(spacing: 40) {
            AsyncImage(url: URL(string: "\(base)?\(key.uuidString)")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray.opacity(0.5)
            }
            .frame(width: 320, height: 320)

    
            
            Button(action: refreshImage) {
                Text("Show next")
                    .foregroundColor(.white)
                    .frame(width: 160, height: 40)
                    .background(Color.blue.cornerRadius(8))
            }
        }
    }
    
    private func refreshImage() {
        key = UUID()
    }
}
