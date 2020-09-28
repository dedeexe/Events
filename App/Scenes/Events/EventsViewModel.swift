import SwiftUI
import Combine

final class EventsViewModel: ObservableObject {

    enum State {
        case idle
        case loading
        case loaded([Event])
        case error(Error)
    }

    private let adapter: EventsAdapter
    @Published var state: DataState<[Event]> = .idle
    
    var cancellables: Set<AnyCancellable> = []
    
    init(adapter: EventsAdapter = EventsAdapterWorker()) {
        self.adapter = adapter
    }

    func getEvents() {
        state = .loading
        adapter.allEvents()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        self.state = .error(error)
                    case .finished:
                        return
                    }
                },
                receiveValue: { events in
                    self.state = .loaded(events)
                }
            )
            .store(in: &cancellables)
    }
}

