import Foundation

class IssuesViewModel {
    private var issuesList: [Issue]
    private let apiService: APIInterface

    init(apiService: APIInterface) {
        issuesList = [Issue]()
        self.apiService = apiService
    }
}

// MARK: - Issues Interface
extension IssuesViewModel: IssuesInterface {

    func fetchIssues(completionHandler: @escaping (Result<[Issue], ErrorMessage>) -> Void) {
        apiService.fetchIssues { result in
            completionHandler(result)
        }
    }

    func executeFetchResult(delegate: IssuesTableViewDelegate,
                                    result: Result<[Issue], ErrorMessage>) {
        switch result {
            case .failure(let error):
                errorFetchingIssues(delegate: delegate,
                                    errorMessage: error.message)
            case .success(let issues):
                displayIssues(delegate: delegate,
                              issues: issues)
        }
    }

    func fillIssueData(withDelegate delegate: IssueTableViewCellDelegate,
                       forCellAt index: Int) {
        let issue = issuesList[index]
        delegate.setIssueCell(withTitle: issue.title,
                              andStatus: issue.state)
    }

    func getNumberOfIssues() -> Int { issuesList.count }

    func getIssuePageInterface(forIndex index: Int) -> IssuePageInterface {
        return IssuePageViewModel(issue: issuesList[index],
                                  apiService: apiService)
    }
}

// MARK: - Private methods
extension IssuesViewModel {

    private func errorFetchingIssues(delegate: IssuesTableViewDelegate,
                                     errorMessage: String) {
        issuesList.removeAll()
        delegate.showErrorMessage(errorMessage)
    }

    private func displayIssues(delegate: IssuesTableViewDelegate,
                               issues: [Issue]) {
        issuesList = issues
        delegate.reloadIssuesList()
    }
}
