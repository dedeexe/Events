import Foundation
import HexagonEdges

class DataServiceWorker: DataService {
    private let requestService: RequestServicePort

    init(service: RequestServicePort = RequestServiceAdapter()) {
        self.requestService = service
    }
    
    func getData(url: String, completion: @escaping DecodedCompletion<Data>) {
        let urlPath = url
        let request = ServiceRequest(url: urlPath,
                                     method: .get,
                                     body: nil,
                                     headers: [:],
                                     timeout: 30.0)
        
        requestService.requestData(from: request, additionalHeaders: [:]) { result in            
            completion(result)
        }
    }
}
