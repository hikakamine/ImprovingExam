import Foundation
@testable import ImprovingExam

class IssuePageViewResult: IssuePageViewDelegate {
    var title: String?
    var creationInfo: String?
    var description: String?
    var imageData: Data?
    var issueUrl: URL?
    var errorMessage: String?

    func setIssueInformation(title: String,
                             creationInfo: String,
                             description: String) {
        self.title = title
        self.creationInfo = creationInfo
        self.description = description
    }

    func setUserAvatar(fromData data: Data) {
        self.imageData = data
    }

    func openIssueUrl(url: URL) {
        self.issueUrl = url
    }

    func showErrorMessage(_ message: String) {
        self.errorMessage = message
    }
}
