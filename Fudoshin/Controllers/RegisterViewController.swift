//
//  RegisterViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/14/22.
//

import UIKit

class RegisterViewController: UIViewController, RegisterViewDelegateProtocol {
    
    private var registerServiceModel: RegisterServiceModelProtocol? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    private func setView() {
        let registerView = RegisterView(frame: self.view.frame)
        registerView.setDelegate(delegate: self)
        
        self.view = registerView
    }
    
    func setServiceModel(serviceModel: RegisterServiceModelProtocol) {
        registerServiceModel = serviceModel
    }
    
    func registerUser() {
        guard let registerView = self.view as? RegisterView else {return}
        
        if let email = registerView.getEmail(), let password = registerView.getPassword(), let confirmPass = registerView.getConfirmPassword(), let firstname = registerView.getFirstName(), let lastName = registerView.getLastName(), let beltLevel = registerView.getBeltLevel() {
            
            if password == confirmPass {
                let user = User(id: User.setid(), firstName: firstname, lastName: lastName, email: email, password: password, beltLevel: beltLevel)
                
                let registerService = RegisterServiceModel(appDatabase: AppDatabase.sharedPool, userModel: user) 
                setServiceModel(serviceModel: registerService)
                
                registerServiceModel?.insertNewUser()
                dismiss(animated: true)
            } else {
                presentAlertEmptyField()
            }
        }
    }
    
    func presentAlertEmptyField() { // TODO: Make nicer message 
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: "Error", message: "Required fields are empty", preferredStyle: .alert)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func presentAlertNameField() {
        //
    }
    
    func presentAlertPasswordField() {
        //
    }

}
