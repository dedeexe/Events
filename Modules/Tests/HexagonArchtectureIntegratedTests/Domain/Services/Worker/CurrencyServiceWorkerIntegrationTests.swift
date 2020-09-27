@testable import HexagonArchtecture
import HexagonEdges
import DDXNetwork
import XCTest

class CurrencyServiceWorkerIntegrationTests: XCTestCase {

    var sut: EventsServiceWorker!
    var service: RequestServicePort!

    ///
    /// Testes if endpoint to get the list of currencies is working and giving back a valida structure of data
    ///

    func testGetAllEvents() {
        sut = EventsServiceWorker(service: RequestServiceAdapter())

        let expectation = XCTestExpectation()

        sut.getAllEvents { result in

            switch result {
            case .success(let eventsList):
                XCTAssertTrue(eventsList.count > 0)

            case .failure:
                XCTFail("Unexpected error. It shout be success")
            }

            expectation.fulfill()

        }

        wait(for: [expectation], timeout: 10.0)
    }

    ///
    /// Testes if endpoint to get the quotation of currencies is working and giving back a valida structure of data
    ///

    func testEvent() {
        sut = EventsServiceWorker(service: RequestServiceAdapter())

        let expectation = XCTestExpectation()

        sut.getEvent(id: "2") { result in

            switch result {
            case .success(let event):
                XCTAssertEqual(event.people?.count ?? 100, 0)
                XCTAssertEqual(event.longitude ?? 0.0, -51.2148497)
                XCTAssertEqual(event.latitude ?? 0.0, -30.037878)
                XCTAssertEqual(event.id ?? "", "2")
                XCTAssertEqual(event.price ?? 0.0, 59.99)

            case .failure:
                XCTFail("Unexpected error. It shout be success")
            }

            expectation.fulfill()

        }

        wait(for: [expectation], timeout: 10.0)
    }
    
    // =============================================================================
    // Remove this test after endpoint first element error beeen fixed
    // It's a test for a WorkAround(Gambiarra) 😅
    func testWorkArountEvent() {
        sut = EventsServiceWorker(service: RequestServiceAdapter())

        let expectation = XCTestExpectation()

        sut.getEvent(id: "1") { result in

            switch result {
            case .success(let event):
                XCTAssertEqual(event.people?.count ?? 100, 5)
                XCTAssertEqual(event.longitude ?? 0.0, -51.2146267)
                XCTAssertEqual(event.latitude ?? 0.0, -30.0392981)
                XCTAssertEqual(event.id ?? "", "1")
                XCTAssertEqual(event.price ?? 0.0, 29.99)

            case .failure:
                XCTFail("Unexpected error. It shout be success")
            }

            expectation.fulfill()

        }

        wait(for: [expectation], timeout: 10.0)
    }
    // =============================================================================
}
