import Foundation

struct DataTests {

    static let decodableIssue = """
    {
        "url": "https://api.github.com/repos/apple/swift/issues/36100",
        "repository_url": "https://api.github.com/repos/apple/swift",
        "labels_url": "https://api.github.com/repos/apple/swift/issues/36100/labels{/name}",
        "comments_url": "https://api.github.com/repos/apple/swift/issues/36100/comments",
        "events_url": "https://api.github.com/repos/apple/swift/issues/36100/events",
        "html_url": "https://github.com/apple/swift/pull/36100",
        "id": 1,
        "node_id": "MDExOlB1bGxSZXF1ZXN0NTc4MTAyNTUy",
        "number": 36100,
        "title": "Test title.",
        "user": {
          "login": "userLogin",
          "id": 499423,
          "node_id": "MDQ6VXNlcjQ5OTQyMw==",
          "avatar_url": "https://avatars.githubusercontent.com/u/499423?v=4",
          "gravatar_id": "",
          "url": "https://api.github.com/users/gottesmm",
          "html_url": "https://github.com/gottesmm",
          "followers_url": "https://api.github.com/users/gottesmm/followers",
          "following_url": "https://api.github.com/users/gottesmm/following{/other_user}",
          "gists_url": "https://api.github.com/users/gottesmm/gists{/gist_id}",
          "starred_url": "https://api.github.com/users/gottesmm/starred{/owner}{/repo}",
          "subscriptions_url": "https://api.github.com/users/gottesmm/subscriptions",
          "organizations_url": "https://api.github.com/users/gottesmm/orgs",
          "repos_url": "https://api.github.com/users/gottesmm/repos",
          "events_url": "https://api.github.com/users/gottesmm/events{/privacy}",
          "received_events_url": "https://api.github.com/users/gottesmm/received_events",
          "type": "User",
          "site_admin": false
        },
        "labels": [

        ],
        "state": "open",
        "locked": false,
        "assignee": null,
        "assignees": [

        ],
        "milestone": null,
        "comments": 1,
        "created_at": "2021-02-23T03:13:26Z",
        "updated_at": "2021-02-23T03:13:43Z",
        "closed_at": null,
        "author_association": "MEMBER",
        "active_lock_reason": null,
        "pull_request": {
          "url": "https://api.github.com/repos/apple/swift/pulls/36100",
          "html_url": "https://github.com/apple/swift/pull/36100",
          "diff_url": "https://github.com/apple/swift/pull/36100.diff",
          "patch_url": "https://github.com/apple/swift/pull/36100.patch"
        },
        "body": "This is now just a draft to get some testing.",
        "performed_via_github_app": null
    }
    """

    static let undecodableIssue = """
    {
        
    }
    """
}
