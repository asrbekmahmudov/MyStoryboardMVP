
import Foundation

protocol CreatePresenterProtocol {
    func apiCreateContact(contact: Contact)
}

class CreatePresenter: CreatePresenterProtocol {
    var createView: CreateView!
    var controller: BaseViewController!
    
    func apiCreateContact(contact: Contact) {
        controller?.successIndicator()
        
        AFHttp.post(url: AFHttp.API_CONTACT_CREATE, params: AFHttp.paramsContactCreate(contact: contact), handler: { [self] response in
            controller?.hideProgress()
            switch response.result {
            case .success:
                let contact = try! JSONDecoder().decode(Contact.self, from: response.data!)
                createView.onCreateContact(contact: contact)
            case let .failure(error):
                print(error)
                createView.onCreateContact(contact: Contact())
            }
        })
    }
}
