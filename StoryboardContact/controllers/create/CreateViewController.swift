//
//  CreateViewController.swift
//  StoryboardContact
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 23/10/21.
//

import UIKit

class CreateViewController: BaseViewController, CreateView {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    private var contact = Contact()
    var presenter: CreatePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }
    
    // MARK: - Method
    func onCreateContact(contact: Contact) {
        if contact.id != nil {
            //navigationController?.popViewController(animated: true)
        }
    }
    func initViews() {
        addButton.layer.cornerRadius = 5
        addButton.layer.borderWidth = 0.5
        
        presenter = CreatePresenter()
        presenter.createView = self
        presenter.controller = self
    }
    
    // MARK: - Action
    
    @IBAction func addContact(_ sender: UIButton) {
        self.contact.name = nameTextField.text
        self.contact.phone = phoneTextField.text
        presenter.apiCreateContact(contact: contact)
    }
    
}
