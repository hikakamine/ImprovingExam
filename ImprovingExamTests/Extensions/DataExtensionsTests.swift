import XCTest
@testable import ImprovingExam

class DataExtensionsTests: XCTestCase {

    var jsonDecoder: JSONDecoder!

    override func setUp() {
        super.setUp()
        jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
    }

    func test_WhenDataIsNotCorrupted_ThenDecodeIssueJsonToObject() throws {
        let data = Data(DataTests.decodableIssue.utf8)

        XCTAssertNoThrow(try data.decode(withDecoder: jsonDecoder,
                                         toType: Issue.self))

        let issue = try! data.decode(withDecoder: jsonDecoder,
                                     toType: Issue.self)
        XCTAssertEqual(1, issue.id)
        XCTAssertEqual("Test title.", issue.title)
        XCTAssertEqual("This is now just a draft to get some testing.", issue.body)
        XCTAssertEqual("User userLogin created the issue in 2021/02/23", issue.getIssueCreationDetails())
        XCTAssertEqual(URL(string: "https://github.com/apple/swift/pull/36100"), issue.htmlUrl)
    }

    func test_WhenDataIsCorrupted_ThenThrowsErrorWithAMessage() throws {
        let subject = Data(DataTests.undecodableIssue.utf8)

        XCTAssertThrowsError(try subject.decode(withDecoder: jsonDecoder,
                                                toType: Issue.self),
                             "Data parsing to type[Issue] error")
    }
}
