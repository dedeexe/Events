import XCTest
@testable import EventsApp

class Int_DateTests: XCTestCase {
    func testConvertion() throws {
        XCTAssertEqual(1597018600.timestampDate, "09/08/2020")
        XCTAssertEqual(1576018600.timestampDate, "10/12/2019")
        XCTAssertEqual(197018600.timestampDate, "30/03/1976")
        XCTAssertEqual(15970600.timestampDate, "04/07/1970")
    }
}
