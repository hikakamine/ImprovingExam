import Foundation

extension URL {

    func execute(completionHandler: @escaping (Result<Data, ErrorMessage>) -> Void) {
        let urlSession = URLSession(configuration: .default)
        let dataTask = urlSession.dataTask(with: self) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else {
                completionHandler(.failure(ErrorMessage(message: "Network Error")))
                return
            }

            guard let data = data else {
                completionHandler(.failure(ErrorMessage(message: "No Data Available")))
                return
            }

            if (200...209).contains(response.statusCode) {
                completionHandler(.success(data))
            } else {
                completionHandler(.failure(ErrorMessage(message: "\(response.statusCode) HTTP Status Code Error")))
            }

        }
        dataTask.resume()
    }
}
