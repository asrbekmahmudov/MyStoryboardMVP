//
//  EditViewController.swift
//  StoryboardContact
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 23/10/21.
//

import UIKit

class EditViewController: BaseViewController, EditView {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var editButton: UIButton!
    
    var contact = Contact()
    var presenter: EditPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    // MARK: - Method
    
    func onEditView(edited: Bool) {
        if edited {
            
        } else {
            // error
        }
    }
    
    func initViews() {
        initNavigation()
        
        nameTextField.text = contact.name
        phoneTextField.text = contact.phone
        
        editButton.layer.cornerRadius = 5
        editButton.layer.borderWidth = 0.5
        
        presenter = EditPresenter()
        presenter.editView = self
        presenter.controller = self
    }
    
    func initNavigation() {
        title = "Edit Contact"
    }
    
    // MARK: - Action
    @IBAction func editContact(_ sender: Any) {
        contact.name = nameTextField.text
        contact.phone = phoneTextField.text
        presenter.apiContactEdit(contact: contact)
        self.dismiss(animated: true, completion: nil)
    }
    
}
