import Foundation
import SwiftUI

final class EventCardViewModel: Identifiable, Equatable {
    let event: Event
    
    var id: String {
        event.id
    }
        
    init(event: Event) {
        self.event = event
    }
    
    func eventDetailViewModel() -> EventDetailViewModel {
        EventDetailViewModel(event: event)
    }
    
    func photoViewModel() -> DownloadPhotoViewModel {
        DownloadPhotoViewModel(url: event.image, fallbackImage: Image.imagePlaceholder)
    }
    
    static func == (lhs: EventCardViewModel, rhs: EventCardViewModel) -> Bool {
        lhs.event == rhs.event
    }
}
