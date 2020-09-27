import Foundation
import HexagonEdges

class EventsServiceWorker: EventsService {
    private let requestService: RequestServicePort

    init(service: RequestServicePort = RequestServiceAdapter()) {
        self.requestService = service
    }

    func getAllEvents(completion: @escaping DecodedCompletion<[InputModel.Event]>) {
        let urlPath = Config.baseURL + "/events"
        let request = ServiceRequest(url: urlPath,
                                     method: .get,
                                     body: nil,
                                     headers: [:],
                                     timeout: 30.0)
        
        requestService.request([InputModel.Event].self, from: request, additionalHeaders: [:]) { result in
            completion(result)
        }
    }
    
    func getEvent(id: String, completion: @escaping DecodedCompletion<InputModel.Event>) {
        let urlPath = Config.baseURL + "events/\(id)"
        let request = ServiceRequest(url: urlPath,
                                     method: .get,
                                     body: nil,
                                     headers: [:],
                                     timeout: 30.0)
        
        requestService.request(InputModel.Event.self, from: request, additionalHeaders: [:]) { result in
            completion(result)
        }
    }
}
