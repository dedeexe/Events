@testable import HexagonArchtecture
import HexagonEdges
import DDXNetwork
import XCTest

class CurrencyServiceWorkerTests: XCTestCase {

    var sut: EventsServiceWorker!
    var service: RequestServicePort!

    func testGetAllEvents() {
        let service = MockedRequestServiceAdapter(data: Fixture.EventList.data)
        sut = EventsServiceWorker(service: service)
        let expectation = XCTestExpectation()

        sut.getAllEvents { result in

            switch result {
            case .success(let eventList):
                eventList.forEach {
                    checkEvent($0)
                }

            case .failure:
                XCTFail("Unexpected error. It shout be success")
            }

            expectation.fulfill()

        }

        wait(for: [expectation], timeout: 10.0)
    }

    func testGetAllEventsFail() {
        let error = NSError(domain: "Expected error", code: 555, userInfo: nil)
        let service = MockedRequestServiceAdapter(error: error)
        sut = EventsServiceWorker(service: service)
        let expectation = XCTestExpectation()

        sut.getAllEvents { result in

            switch result {
            case .success:
                XCTFail("Unexpected error. It shout get a fail")

            case .failure(let error as NSError):
                XCTAssertEqual(error.code, 555)
                XCTAssertEqual(error.domain, "Expected error")
            }

            expectation.fulfill()

        }

        wait(for: [expectation], timeout: 10.0)
    }
    
    func testGetEvent() {
        let service = MockedRequestServiceAdapter(data: Fixture.Event.data)
        sut = EventsServiceWorker(service: service)
        let expectation = XCTestExpectation()

        sut.getEvent(id: "1") { result in

            switch result {
            case .success(let event):
                checkEvent(event)

            case .failure:
                XCTFail("Unexpected error. It shout be success")
            }

            expectation.fulfill()

        }

        wait(for: [expectation], timeout: 10.0)
    }

    func testGetEventFail() {
        let error = NSError(domain: "Expected error", code: 555, userInfo: nil)
        let service = MockedRequestServiceAdapter(error: error)
        sut = EventsServiceWorker(service: service)
        let expectation = XCTestExpectation()

        sut.getEvent(id: "1") { result in

            switch result {
            case .success:
                XCTFail("Unexpected error. It shout get a fail")

            case .failure(let error as NSError):
                XCTAssertEqual(error.code, 555)
                XCTAssertEqual(error.domain, "Expected error")
            }

            expectation.fulfill()

        }

        wait(for: [expectation], timeout: 10.0)
    }

}

func checkEvent(_ model: InputModel.Event) {
    XCTAssertEqual(model.people?.count ?? 0, 1)
    XCTAssertTrue(model.date == 12345)
    XCTAssertTrue(model.description == "description")
    XCTAssertTrue(model.image == "event.png")
    XCTAssertTrue(model.longitude == -1.1)
    XCTAssertTrue(model.latitude == -2.2)
    XCTAssertTrue(model.price == 12.34)
    XCTAssertTrue(model.title == "Event Test")
    XCTAssertTrue(model.id == "1")
}

func checkPerson(_ model: InputModel.Event.Person) {
    XCTAssertTrue(model.picture == "person.png")
    XCTAssertTrue(model.name == "Person1")
    XCTAssertTrue(model.eventId == "1")
    XCTAssertTrue(model.id == "1")
}
