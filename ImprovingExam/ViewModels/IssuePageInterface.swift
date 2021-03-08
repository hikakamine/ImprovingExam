import Foundation

protocol IssuePageInterface {

    func fillIssueDetailsData(withDelegate delegate: IssuePageViewDelegate)

    func fetchUserAvatar(completionHandler: @escaping (Result<Data, ErrorMessage>) -> Void)

    func setUserAvatar(withDelegate delegate: IssuePageViewDelegate,
                       forResult result: Result<Data, ErrorMessage>)

    func openIssuePage(withDelegate delegate: IssuePageViewDelegate)
}
