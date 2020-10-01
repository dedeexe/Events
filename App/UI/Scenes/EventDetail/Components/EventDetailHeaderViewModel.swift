import SwiftUI

final class EventDetailHeaderViewModel {
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
}
