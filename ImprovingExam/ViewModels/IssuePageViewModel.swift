import Foundation

class IssuePageViewModel {
    private let issue: Issue
    private let apiService: APIInterface

    init(issue: Issue, apiService: APIInterface) {
        self.issue = issue
        self.apiService = apiService
    }
}

// MARK: - Issue Page Interface
extension IssuePageViewModel: IssuePageInterface {

    func fillIssueDetailsData(withDelegate delegate: IssuePageViewDelegate) {
        delegate.setIssueInformation(title: issue.title,
                                     creationInfo: issue.getIssueCreationDetails(),
                                     description: issue.body)
    }

    func fetchUserAvatar(completionHandler: @escaping (Result<Data, ErrorMessage>) -> Void) {
        guard let imageUrl = issue.user?.avatarUrl else {
            completionHandler(.failure(ErrorMessage(message: "User avatar url not available")))
            return
        }

        apiService.fetchUserAvatar(imageUrl: imageUrl) { result in
            completionHandler(result)
            return
        }
    }

    func setUserAvatar(withDelegate delegate: IssuePageViewDelegate,
                       forResult result: Result<Data, ErrorMessage>) {
        switch result {
        case .failure(let error):
            delegate.showErrorMessage(error.message)
        case .success(let data):
            delegate.setUserAvatar(fromData: data)
        }
    }

    func openIssuePage(withDelegate delegate: IssuePageViewDelegate) {
        guard let url = issue.htmlUrl else {
            delegate.showErrorMessage("No url available for this issue")
            return
        }
        delegate.openIssueUrl(url: url)
    }
}
