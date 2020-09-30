import Combine
import UIKit
import SwiftUI
import HexagonEdges
import HexagonArchtecture

protocol ImageDownloadAdapter: AnyObject {
    func getImage(at url: String) -> AnyPublisher<Image, Error>
}

final class ImageDownloadAdapterWorker: ImageDownloadAdapter, ObservableObject {

    private let service: DataService
    
    @Published var eventsList = PassthroughSubject<[Event], Error>()
    
    init(service: DataService = DataServiceProvider.default()) {
        self.service = service
    }
    
    func getImage(at url: String) -> AnyPublisher<Image, Error> {
        let future = Future<Image, Error> { promise in
            self.service.getData(url: url) { result in
                switch result {
                case .failure(let error):
                    promise(.failure(error))
    
                case .success(let data):
                    if let uiImage = UIImage(data: data) {
                        let image = Image(uiImage: uiImage)
                        promise(.success(image))
                        return
                    }
                    let error = NSError(domain: "Fail to convert Data", code: 600, userInfo: nil)
                    promise(.failure(error))
                }
            }
        }
        
        return future.eraseToAnyPublisher()
    }
}
