import XCTest
@testable import EventsApp

class Double_CurrencyTests: XCTestCase {
    func testConvertion() throws {
        XCTAssertEqual(Double(123.45).currency, "R$ 123,45")
        XCTAssertEqual(Double(123).currency, "R$ 123,00")
        XCTAssertEqual(Double(0.01).currency, "R$ 0,01")
    }
}
