import Foundation
import SwiftUI

final class PersonViewModel {
    private let adapter: ImageDownloadAdapter
    let person: Person
        
    var id: String {
        person.id
    }
    
    init(person: Person, adapter: ImageDownloadAdapter = ImageDownloadAdapterWorker()) {
        self.person = person
        self.adapter = adapter
    }
    
    func photoViewModel() -> DownloadPhotoViewModel {
        DownloadPhotoViewModel(url: person.picture, fallbackImage: Image("forest"), adapter: adapter)
    }
}

