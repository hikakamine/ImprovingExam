import Foundation

struct User: Decodable {
    var login: String
    var id: Int
    var nodeId: String
    var avatarUrl: URL?

    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
    }
}
