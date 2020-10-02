import Foundation

extension InputModel {
    public struct Event: Decodable {
        public var id: String?
        public var people: [Person]?
        public var date: Int?
        public var description: String?
        public var image: String?
        public var longitude: Double?
        public var latitude: Double?
        public var price: Double?
        public var title: String?
    }
}

extension InputModel.Event {
    public struct Person: Decodable {
        public var picture: String?
        public var name: String?
        public var eventId: String?
        public var id: String?
    }
}
