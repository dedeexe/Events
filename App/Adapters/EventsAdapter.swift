import Combine
import Foundation
import HexagonEdges
import HexagonArchtecture

protocol EventsAdapter: AnyObject {
    func allEvents() -> AnyPublisher<[Event], Error>
}

final class EventsAdapterWorker: EventsAdapter, ObservableObject {
    private let service: EventsService
    
    @Published var eventsList = PassthroughSubject<[Event], Error>()
    
    init(service: EventsService = EventsServiceProvider.default()) {
        self.service = service
    }
    
    func allEvents() -> AnyPublisher<[Event], Error> {
        let future = Future<[Event], Error> { promise in
            self.service.getAllEvents {result in
                switch result {
                case .failure(let error):
                    promise(.failure(error))
    
                case .success(let events):
                    let eventList = events.compactMap(Event.init)
                    promise(.success(eventList))
                }
            }
        }
        
        return future.eraseToAnyPublisher()
    }
}

private extension Event {
    init(from model: InputModel.Event) {
        self.id = model.id ?? UUID().uuidString
        self.people = model.people?.compactMap(Person.init) ?? []
        self.date = (model.date ?? 0).timestampDate
        self.description = model.description ?? ""
        self.image = model.image ?? ""
        self.longitude = model.longitude ?? 0.0
        self.latitude = model.latitude ?? 0.0
        self.price = (model.price ?? 0.0).currency
        self.title = model.title ?? ""
    }
}

private extension Person {
    init(from model: InputModel.Event.Person) {
        self.id = model.id ?? UUID().uuidString
        self.name = model.name ?? ""
        self.eventId = model.eventId ?? ""
        self.picture = model.picture ?? ""
    }
}
