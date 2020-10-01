import UIKit
import SwiftUI

struct LoadingView: UIViewRepresentable {
    
    var isAnimating: Bool = false
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .medium)
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if isAnimating {
            uiView.startAnimating()
            return
        }
        
        uiView.stopAnimating()
    }
}
