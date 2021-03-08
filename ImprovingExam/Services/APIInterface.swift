import Foundation

protocol APIInterface {

    func fetchIssues(completionHandler: @escaping (Result<[Issue], ErrorMessage>) -> Void)

    func fetchUserAvatar(imageUrl url: URL,
                         completionHandler: @escaping (Result<Data, ErrorMessage>) -> Void)
}
