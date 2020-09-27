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
        public var price: Float?
        public var title: String?

        //============================================
        //Paliative situation until endpoint is fixed
        //TODO: Remove it once it been fixed
        enum CodingKeys: String, CodingKey{
            case id
            case people
            case date
            case description
            case image
            case longitude
            case latitude
            case price
            case title
        }
        
        public init(from decoder: Decoder) {
            let container = try? decoder.container(keyedBy: CodingKeys.self)
            
            self.id = try? container?.decodeIfPresent(String.self, forKey: .id)
            self.people = try? container?.decodeIfPresent([Person].self, forKey: .people)
            self.date = try? container?.decodeIfPresent(Int.self, forKey: .date)
            self.description = try? container?.decodeIfPresent(String.self, forKey: .description)
            self.image = try? container?.decodeIfPresent(String.self, forKey: .image)
            self.price = try? container?.decodeIfPresent(Float.self, forKey: .price)
            self.title = try? container?.decodeIfPresent(String.self, forKey: .title)
            
            if let value = try? container?.decodeIfPresent(String.self, forKey: .longitude) {
                self.longitude = Double(value)
            }
            
            if let value = try? container?.decodeIfPresent(Double.self, forKey: .longitude) {
                self.longitude = value
            }
            
            if let value = try? container?.decodeIfPresent(String.self, forKey: .latitude) {
                self.latitude = Double(value)
            }
            
            if let value = try? container?.decodeIfPresent(Double.self, forKey: .latitude) {
                self.latitude = value
            }
        }
        //============================================
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
