public struct Event: Decodable, Identifiable {
    public var id: String
    public var people: [Person]
    public var date: String
    public var description: String
    public var image: String
    public var longitude: Double
    public var latitude: Double
    public var price: String
    public var title: String
}

public struct Person: Decodable, Identifiable {
    public var picture: String
    public var name: String
    public var eventId: String
    public var id: String
}
