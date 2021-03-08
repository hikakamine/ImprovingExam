import UIKit

extension Data {
    var asImage: UIImage { UIImage(data: self) ?? UIImage() }

    func decode<T: Decodable>(withDecoder decoder: JSONDecoder,
                              toType type: T.Type) throws -> T {
        do {
            return (try decoder.decode(type, from: self))
        } catch {
            throw ErrorMessage(message: "Data parsing to type[\(type)] error")
        }
    }
}
