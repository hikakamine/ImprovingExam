import XCTest
@testable import ImprovingExam

class DateExtensionsTests: XCTestCase {

    var subject: Date!

    override func setUp() {
        super.setUp()
        let calendar = Calendar(identifier: .gregorian)
        let dateComponents = DateComponents(calendar: calendar,
                                            year: 2021,
                                            month: 02,
                                            day: 20)
        subject = dateComponents.date
    }

    func test_WhenUsingTheDefaultDateFormat_ThenReturnFormattedDate() throws {
        let result = subject.formatted()
        XCTAssertEqual("2021/02/20", result)
    }

    func test_WhenThereIsADateFormat_ThenReturnFormattedDate() throws {
        let result = subject.formatted(withFormat: "yyyy, MMM dd")
        XCTAssertEqual("2021, Feb 20", result)
    }
}
