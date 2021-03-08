import Foundation

struct GitHubAPI {
    let url = URL(string: "https://api.github.com/repos/apple/swift/issues")!
    let jsonDecoder: JSONDecoder

    init() {
        jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
    }
}

// MARK: - APIInterface
extension GitHubAPI: APIInterface {

    func fetchIssues(completionHandler: @escaping (Result<[Issue], ErrorMessage>) -> Void) {
        url.execute { result in
            if case .failure(let error) = result {
                completionHandler(.failure(error))
                return
            }
            do {
                completionHandler(decodeData(data: try result.get()))
            } catch {
                completionHandler(.failure(ErrorMessage(message: "Could not retrieve Data")))
            }
        }
    }

    func fetchUserAvatar(imageUrl url: URL,
                         completionHandler: @escaping (Result<Data, ErrorMessage>) -> Void) {
        url.execute { result in
            completionHandler(result)
        }
    }
}

// MARK:- Private methods
extension GitHubAPI {

    private func decodeData(data: Data) -> Result<[Issue], ErrorMessage> {

        do {
            return .success(try data.decode(withDecoder: jsonDecoder,
                                            toType: [Issue].self))
        } catch {
            return .failure(error as! ErrorMessage)
        }
    }
}

