
import Foundation

protocol EditPresenterProtocol {
    func apiContactEdit(contact: Contact)
}

class EditPresenter: EditPresenterProtocol {
    
    var editView: EditView!
    var controller: BaseViewController!
    
    func apiContactEdit(contact: Contact) {
        controller?.showProgress()
        
        AFHttp.put(url: AFHttp.API_CONTACT_UPDATE + contact.id!, params: AFHttp.paramsContactUpdate(contact: contact), handler: { [self] response in
            controller?.hideProgress()
            switch response.result {
            case .success:
                editView.onEditView(edited: true)
            case let .failure(error):
                print(error)
                editView.onEditView(edited: false)
            }
        })
    }
}
