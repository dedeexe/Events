import Foundation

extension Fixture {
    struct Event {
        static let data = Event.json.data(using: .utf8) ?? Data(capacity: 0)
        static let json = #"""

        {"people":[{"picture":"person.png","name":"Person1","eventId":"1","id":"1"}],"date":12345,"description":"description","image":"event.png","longitude":-1.1,"latitude":-2.2,"price":12.34,"title":"Event Test","id":"1"}

        """#
    }
    
    struct EventList {
        static let data = EventList.json.data(using: .utf8) ?? Data(capacity: 0)
        static let json = #"""
        [{"people":[{"picture":"person.png","name":"Person1","eventId":"1","id":"1"}],"date":12345,"description":"description","image":"event.png","longitude":-1.1,"latitude":-2.2,"price":12.34,"title":"Event Test","id":"1"}, {"people":[{"picture":"person.png","name":"Person1","eventId":"1","id":"1"}],"date":12345,"description":"description","image":"event.png","longitude":-1.1,"latitude":-2.2,"price":12.34,"title":"Event Test","id":"1"}, {"people":[{"picture":"person.png","name":"Person1","eventId":"1","id":"1"}],"date":12345,"description":"description","image":"event.png","longitude":-1.1,"latitude":-2.2,"price":12.34,"title":"Event Test","id":"1"}]
        """#
    }
}
