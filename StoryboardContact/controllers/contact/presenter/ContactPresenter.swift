
import Foundation

protocol ContactPresenterProtocol {
    func apiContactList()
    func apiContactDelete(contact: Contact)
}

class ContactPresenter: ContactPresenterProtocol {
    var contactView: ContactView!
    var controller: BaseViewController!
    
    func apiContactList() {
        controller?.showProgress()
        
        AFHttp.get(url: AFHttp.API_CONTACT_LIST, params: AFHttp.paramsEmpty(), handler: { [self] response in
            controller?.hideProgress()
            switch response.result {
            case .success:
                let contacts = try! JSONDecoder().decode([Contact].self, from: response.data!)
                contactView.onLoadContact(contacts: contacts)
            case let .failure(error):
                print(error)
                contactView.onLoadContact(contacts: [Contact]())
            }
        })
    }
    
    func apiContactDelete(contact: Contact) {
        controller?.showProgress()
        
        AFHttp.del(url: AFHttp.API_CONTACT_DELETE + contact.id!, params: AFHttp.paramsEmpty(), handler: { [self] response in
            controller?.hideProgress()
            switch response.result {
            case .success:
                print(response.result)
                contactView.onDeleteContact(deleted: true)
            case let .failure(error):
                print(error)
                contactView.onDeleteContact(deleted: false)
            }
        })
    }
    
}
