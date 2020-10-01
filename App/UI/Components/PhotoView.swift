import SwiftUI

struct PhotoView: View {
    let image: Image
    
    var body: some View {
        ZStack {
            image.resizable().scaledToFill()
            Rectangle().background(Color.black).opacity(0.3)
        }
    }
}
