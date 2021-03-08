import Foundation
@testable import ImprovingExam

struct IssuePageViewModelTestData {
    static let incompleteIssue = Issue(id: 1,
                                       htmlUrl: nil,
                                       state: "Closed",
                                       title: "Title for incomplete Issue",
                                       body: "Description for incomplete Issue",
                                       user: nil,
                                       createdAt: nil)

    static let completeIssue = Issue(id: 2,
                                     htmlUrl: URL(string: "https://github.com/apple/swift/pull/36100"),
                                     state: "Closed",
                                     title: "Title for complete Issue",
                                     body: "Description for complete Issue",
                                     user: user,
                                     createdAt: creationDate())

    private static let user = User(login: "userName",
                                   id: 3,
                                   nodeId: "node",
                                   avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/1"))

    private static func creationDate() -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let dateComponents = DateComponents(calendar: calendar,
                                            year: 2021,
                                            month: 02,
                                            day: 20)
        return dateComponents.date!
    }
}
