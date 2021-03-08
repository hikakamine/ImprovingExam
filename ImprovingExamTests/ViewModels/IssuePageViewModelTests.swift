import XCTest
@testable import ImprovingExam

class IssuePageViewModelTests: XCTestCase {

    let result = IssuePageViewResult()

    func test_WhenDataIsIncomplete_ThenFillSomeIssueDetails() throws {
        let subject = IssuePageViewModel(issue: IssuePageViewModelTestData.incompleteIssue,
                                         apiService: APIServiceMockIncompleteData())

        subject.fillIssueDetailsData(withDelegate: result)

        XCTAssertEqual("Title for incomplete Issue", result.title)
        XCTAssertEqual("Description for incomplete Issue", result.description)
        XCTAssertEqual("User [unknown user] created the issue in [unknown date]", result.creationInfo)
    }

    func test_WhenDataIsComplete_ThenFillAllIssueDetails() throws {
        let subject = IssuePageViewModel(issue: IssuePageViewModelTestData.completeIssue,
                                         apiService: APIServiceMockCompleteData())

        subject.fillIssueDetailsData(withDelegate: result)

        XCTAssertEqual("Title for complete Issue", result.title)
        XCTAssertEqual("Description for complete Issue", result.description)
        XCTAssertEqual("User userName created the issue in 2021/02/20", result.creationInfo)
    }

    func test_WhenThereIsNoImageUrl_ThenReturnErrorMessage() throws {
        let expectations = expectation(description: "Loading avatar")
        let subject = IssuePageViewModel(issue: IssuePageViewModelTestData.incompleteIssue,
                                         apiService: APIServiceMockIncompleteData())

        subject.fetchUserAvatar { [unowned self] subjectResult in
            subject.setUserAvatar(withDelegate: self.result,
                                  forResult: subjectResult)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5)

        XCTAssertNil(result.imageData)
        XCTAssertEqual("User avatar url not available", result.errorMessage)
    }

    func test_WhenThereIsImageUrlButNoData_ThenReturnErrorMessage() {
        let expectations = expectation(description: "Loading avatar")
        let subject = IssuePageViewModel(issue: IssuePageViewModelTestData.completeIssue,
                                         apiService: APIServiceMockIncompleteData())

        subject.fetchUserAvatar { [unowned self] subjectResult in
            subject.setUserAvatar(withDelegate: self.result,
                                  forResult: subjectResult)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5)

        XCTAssertNil(result.imageData)
        XCTAssertEqual("Error fetching image data", result.errorMessage)
    }

    func test_WhenThereIsImageUrl_ThenReturnImageData() throws {
        let expectations = expectation(description: "Loading avatar")
        let subject = IssuePageViewModel(issue: IssuePageViewModelTestData.completeIssue,
                                         apiService: APIServiceMockCompleteData())

        subject.fetchUserAvatar { [unowned self] subjectResult in
            subject.setUserAvatar(withDelegate: self.result,
                                  forResult: subjectResult)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5)

        XCTAssertNotNil(result.imageData)
    }

    func test_WhenThereIsNoURLForIssue_ThenReturnErrorMessage() throws {
        let subject = IssuePageViewModel(issue: IssuePageViewModelTestData.incompleteIssue,
                                         apiService: APIServiceMockIncompleteData())

        subject.openIssuePage(withDelegate: result)

        XCTAssertEqual("No url available for this issue", result.errorMessage)
    }

    func test_WhenThereIsURLForIssue_ThenReturnIssueURL() throws {
        let subject = IssuePageViewModel(issue: IssuePageViewModelTestData.completeIssue,
                                         apiService: APIServiceMockCompleteData())

        subject.openIssuePage(withDelegate: result)

        XCTAssertNotNil(result.issueUrl)
        XCTAssertEqual(URL(string: "https://github.com/apple/swift/pull/36100"), result.issueUrl)
    }
}
