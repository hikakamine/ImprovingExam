import Foundation
@testable import ImprovingExam

class IssuesTableViewResult: IssuesTableViewDelegate {
    var errorMessage: String?

    func reloadIssuesList() {
        // Does nothing
    }

    func showErrorMessage(_ message: String) {
        self.errorMessage = message
    }
}
