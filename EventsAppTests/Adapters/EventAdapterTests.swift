import XCTest
import HexagonEdges
@testable import EventsApp

class EventAdapterTests: XCTestCase {

    var sut: EventsAdapter!
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testAllEventsSuccess() throws {
        
    }
}


fileprivate class MockedEventsService: EventsService {
    let isFail: Bool
    let error = NSError(domain: "TestErrir", code: 1000, userInfo: nil)
    
    init(isFail: Bool) {
        self.isFail = isFail
    }
    
    func getAllEvents(completion: @escaping DecodedCompletion<[InputModel.Event]>) {
        if isFail {
            let result = DecodedResult<[InputModel.Event]>.failure(error)
            completion(result)
            return
        }
        
        
    }
    
    func getEvent(id: String, completion: @escaping DecodedCompletion<InputModel.Event>) {
        
    }
    
    let mockEvents: [InputModel.Event] = [
    
    ]
}


