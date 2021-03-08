import Foundation
@testable import ImprovingExam

class APIServiceMockIncompleteData: APIInterface {

    func fetchIssues(completionHandler: @escaping (Result<[Issue], ErrorMessage>) -> Void) {
        completionHandler(.failure(ErrorMessage(message: "Error fetching issues")))
    }

    func fetchUserAvatar(imageUrl url: URL,
                         completionHandler: @escaping (Result<Data, ErrorMessage>) -> Void) {
        completionHandler(.failure(ErrorMessage(message: "Error fetching image data")))
    }
}

class APIServiceMockCompleteData: APIInterface {

    func fetchIssues(completionHandler: @escaping (Result<[Issue], ErrorMessage>) -> Void) {
        completionHandler(.success([IssuePageViewModelTestData.completeIssue]))
    }

    func fetchUserAvatar(imageUrl url: URL,
                         completionHandler: @escaping (Result<Data, ErrorMessage>) -> Void) {
        completionHandler(.success(Data()))
    }
}
