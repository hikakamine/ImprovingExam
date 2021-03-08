import Foundation

struct Issue: Decodable {
    var id: Int
    var htmlUrl: URL?
    var state: String
    var title: String
    var body: String
    var user: User?
    var createdAt: Date?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case htmlUrl = "html_url"
        case state = "state"
        case title = "title"
        case body = "body"
        case user = "user"
        case createdAt = "created_at"
    }
}

// MARK: - Issue extensions
extension Issue {
    var userLogin: String { self.user?.login ?? "[unknown user]" }
    var creationDate: String { self.createdAt?.formatted() ?? "[unknown date]" }

    func getIssueCreationDetails() -> String {
        "User \(self.userLogin) created the issue in \(self.creationDate)"
    }
}
