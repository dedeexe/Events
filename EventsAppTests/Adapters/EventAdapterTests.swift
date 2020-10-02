import XCTest
import HexagonEdges
import Combine
@testable import EventsApp

class EventAdapterTests: XCTestCase {

    var sut: EventsAdapter!
    
    var cancellables: Set<AnyCancellable> = []

    func testGetAllEventsSuccess() throws {
        sut = EventsAdapterWorker(service: MockedEventsService(isFail: false))
        let expectation = XCTestExpectation()
        
        sut.allEvents().sink(
            receiveCompletion: { _ in },
            receiveValue: { events in
                XCTAssertEqual(events.count, 3)
                checkEvent(events.first!)
                checkPerson(events.first!.people.first!)
                expectation.fulfill()
            }
        )
        .store(in: &cancellables)
            
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testGetAllEventsFail() throws {
        sut = EventsAdapterWorker(service: MockedEventsService(isFail: true))
        let expectation = XCTestExpectation()
        
        sut.allEvents().sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure(let error as NSError):
                    XCTAssertEqual(error.code, 1000)
                    XCTAssertEqual(error.domain, "TestError")
                    expectation.fulfill()
                    
                default:
                    break
                }
            },
            receiveValue: { _ in }
        )
        .store(in: &cancellables)
            
        wait(for: [expectation], timeout: 5.0)
    }
}


fileprivate class MockedEventsService: EventsService {
    let isFail: Bool
    let error = NSError(domain: "TestError", code: 1000, userInfo: nil)
    
    init(isFail: Bool) {
        self.isFail = isFail
    }
    
    func getAllEvents(completion: @escaping DecodedCompletion<[InputModel.Event]>) {
        if isFail {
            let result = DecodedResult<[InputModel.Event]>.failure(error)
            completion(result)
            return
        }
        
        let events = try! JSONDecoder().decode([InputModel.Event].self, from: Fixture.EventList.data)
        let result = DecodedResult<[InputModel.Event]>.success(events)
        completion(result)
    }
    
    func getEvent(id: String, completion: @escaping DecodedCompletion<InputModel.Event>) {}
}

func checkEvent(_ model: Event) {
    XCTAssertEqual(model.description, "description")
    XCTAssertEqual(model.image, "event.png")
    XCTAssertEqual(model.longitude, -1.1)
    XCTAssertEqual(model.latitude, -2.2)
    XCTAssertEqual(model.title, "Event Test")
    XCTAssertEqual(model.id, "1")
}

func checkPerson(_ model: Person) {
    XCTAssertEqual(model.picture, "person.png")
    XCTAssertEqual(model.name, "Person1")
    XCTAssertEqual(model.eventId, "1")
    XCTAssertEqual(model.id, "1")
}
