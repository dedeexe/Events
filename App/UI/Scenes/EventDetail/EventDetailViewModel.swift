import SwiftUI
import Combine

final class EventDetailViewModel {
    private let adapter: EventsAdapter
    
    let event: Event
    let hasParticipants: Bool
    
    init(event: Event, adapter: EventsAdapter = EventsAdapterWorker()) {
        self.adapter = adapter
        self.event = event
        self.hasParticipants = event.people.isEmpty == false
    }
    
    func eventDetailHeaderViewModel() -> EventDetailHeaderViewModel {
        EventDetailHeaderViewModel(event: event)
    }
    
    func personViewModels() -> [PersonViewModel] {
        event.people.map {
            PersonViewModel(person: $0)
        }
    }
    
    func locationViewModel() -> LocationViewModel {
        LocationViewModel(latitude: event.latitude, longitude: event.longitude)
    }
}
