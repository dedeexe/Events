import SwiftUI
import Combine

final class EventsViewModel: ObservableObject, Identifiable {
    private(set) var id = UUID().uuidString
    private let adapter: EventsAdapter
    @Published var state: DataState<[EventCardViewModel]> = .idle
    
    var cancellables: Set<AnyCancellable> = []
    
    init(adapter: EventsAdapter = EventsAdapterWorker()) {
        self.adapter = adapter
    }

    func getEvents() {
        state = .loading
        adapter.allEvents()
            .receive(on: DispatchQueue.main)
            .map { $0.map(EventCardViewModel.init) }
            .map { DataState.loaded($0) }
            .catch { error in
                Just(error)
                    .map(DataState.error)
                    .eraseToAnyPublisher()
            }
            .assign(to: \.state, on: self)
            .store(in: &cancellables)
    }
}
