import UIKit

protocol UIViewControllerDelegate {

    func showErrorMessage(_ message: String)
}

// MARK: - UIViewController Delegate
extension UIViewController: UIViewControllerDelegate {

    func showErrorMessage(_ message: String) {
        print(message)
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
