import SwiftUI
import Combine

final class EventsViewModel: ObservableObject {
    private let adapter: EventsAdapter
    @Published var state: DataState<[Event]> = .loading
    
    var cancellables: Set<AnyCancellable> = []
    
    init(adapter: EventsAdapter = EventsAdapterWorker()) {
        self.adapter = adapter
    }
    
    func getEvents() {
        state = .loading
        adapter.allEvents()
            .map { result in
                DataState.loaded(result)
            }
        .mapError { $0 }
        .eraseToAnyPublisher()
        
    }
}


