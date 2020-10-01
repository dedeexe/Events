import SwiftUI
import Combine

final class EventDetailViewModel: ObservableObject, Identifiable {
    let event: Event
    private let adapter: EventsAdapter
    var cancellables: Set<AnyCancellable> = []
    
    init(event: Event, adapter: EventsAdapter = EventsAdapterWorker()) {
        self.adapter = adapter
        self.event = event
    }
    
    func eventDetailHeaderViewModel() -> EventDetailHeaderViewModel {
        EventDetailHeaderViewModel(event: event)
    }
    
    func personViewModels() -> [PersonViewModel] {
        event.people.map {
            PersonViewModel(person: $0)
        }
    }
}
