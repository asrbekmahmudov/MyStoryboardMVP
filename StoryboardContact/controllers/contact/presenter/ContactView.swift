
import Foundation

protocol ContactView {
    func onLoadContact(contacts: [Contact])
    func onDeleteContact(deleted: Bool)
}
