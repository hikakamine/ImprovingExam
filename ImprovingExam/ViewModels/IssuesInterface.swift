import Foundation

protocol IssuesInterface {

    func fetchIssues(completionHandler: @escaping (Result<[Issue], ErrorMessage>) -> Void)

    func executeFetchResult(delegate: IssuesTableViewDelegate,
                                    result: Result<[Issue], ErrorMessage>)

    func fillIssueData(withDelegate delegate: IssueTableViewCellDelegate,
                       forCellAt index: Int)

    func getNumberOfIssues() -> Int

    func getIssuePageInterface(forIndex index: Int) -> IssuePageInterface
}
