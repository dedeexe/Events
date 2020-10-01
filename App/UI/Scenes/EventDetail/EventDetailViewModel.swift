import SwiftUI
import Combine

final class EventDetailViewModel {
    let event: Event
    private let adapter: EventsAdapter
    
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
    
    func locationViewModel() -> LocationViewModel {
        LocationViewModel(latitude: event.latitude, longitude: event.longitude)
    }
}
