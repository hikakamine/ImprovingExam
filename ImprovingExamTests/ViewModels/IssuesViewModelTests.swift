import XCTest
@testable import ImprovingExam

class IssuesViewModelTests: XCTestCase {

    func test_WhenThereWasAnErrorFetchingIssues_ThenReturnErrorMessage() {

        let expectations = expectation(description: "Loading issues")
        let subject = IssuesViewModel(apiService: APIServiceMockIncompleteData())
        let tableResult = IssuesTableViewResult()

        subject.fetchIssues { subjectResult in
            subject.executeFetchResult(delegate: tableResult,
                                       result: subjectResult)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5)

        XCTAssertEqual("Error fetching issues", tableResult.errorMessage)
    }

    func test_WhenSuccessfulFetching_ThenCountIssues() {
        let expectations = expectation(description: "Loading issues")
        let subject = IssuesViewModel(apiService: APIServiceMockCompleteData())
        let tableResult = IssuesTableViewResult()

        subject.fetchIssues { subjectResult in
            subject.executeFetchResult(delegate: tableResult,
                                       result: subjectResult)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5)

        XCTAssertEqual(1, subject.getNumberOfIssues())
    }

    func test_WhenSuccessfulFetching_ThenFillIssueCellData() {
        let expectations = expectation(description: "Loading issues")
        let subject = IssuesViewModel(apiService: APIServiceMockCompleteData())
        let tableResult = IssuesTableViewResult()
        let cellResult = IssueTableViewCellResult()

        subject.fetchIssues { subjectResult in
            subject.executeFetchResult(delegate: tableResult,
                                       result: subjectResult)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 5)

        subject.fillIssueData(withDelegate: cellResult,
                              forCellAt: 0)
        XCTAssertEqual("Title for complete Issue", cellResult.title)
        XCTAssertEqual("Closed", cellResult.status)
    }
}
