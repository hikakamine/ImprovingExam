import Foundation
@testable import ImprovingExam

class IssueTableViewCellResult: IssueTableViewCellDelegate {
    var title: String?
    var status: String?

    func setIssueCell(withTitle title: String,
                      andStatus status: String) {
        self.title = title
        self.status = status
    }
}
