import SwiftUI
import Combine

final class DownloadPhotoViewModel: ObservableObject {
    @Published var image: Image {
        didSet {
            print("Foi")
        }
    }
    
    private let url: String
    private let fallbackImage: Image
    private let adapter: ImageDownloadAdapter
    private var cancellable: AnyCancellable?
    
    init(url: String, fallbackImage:Image, adapter: ImageDownloadAdapter = ImageDownloadAdapterWorker()) {
        self.image = fallbackImage
        self.fallbackImage = fallbackImage
        self.url = url
        self.adapter = adapter
    }
        
    func load() {
        cancellable = self.adapter
            .getImage(at: self.url)
            .receive(on: DispatchQueue.main)
            .catch{ _ in Just(self.fallbackImage).eraseToAnyPublisher() }
            .assign(to: \.image, on: self)
    }
}

struct DownloadPhotoView: View {
    @ObservedObject var viewModel: DownloadPhotoViewModel
    
    var body: some View {
        PhotoView(image: viewModel.image)
            .onAppear {
                self.viewModel.load()
            }
    }
}

struct DownloadPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadPhotoView(
            viewModel: DownloadPhotoViewModel(url: "", fallbackImage: Image(systemName: "star"))
        )
    }
}
