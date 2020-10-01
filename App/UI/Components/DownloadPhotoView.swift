import SwiftUI
import Combine

final class DownloadPhotoViewModel: ObservableObject {
    @Published var image: Image 
    
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
    private let loadOnAppear: Bool
    
    init(viewModel: DownloadPhotoViewModel, loadOnAppear: Bool = true) {
        self.viewModel = viewModel
        self.loadOnAppear = loadOnAppear
    }
    
    var body: some View {
        PhotoView(image: viewModel.image)
            .onAppear {
                if self.loadOnAppear {
                    self.loadImage()
                }
            }
    }
    
    func loadImage() {
        viewModel.load()
    }
}

struct DownloadPhotoView_Previews: PreviewProvider {
    class MockedAdapter: ImageDownloadAdapter {
        func getImage(at url: String) -> AnyPublisher<Image, Error> {
            Future<Image, Error> { $0(.success(Image("forest"))) }
                .eraseToAnyPublisher()
        }
    }
    
    static var previews: some View {
        DownloadPhotoView(
            viewModel: DownloadPhotoViewModel(
                url: "",
                fallbackImage: Image(systemName: "star"),
                adapter: MockedAdapter()
            )
        )
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
