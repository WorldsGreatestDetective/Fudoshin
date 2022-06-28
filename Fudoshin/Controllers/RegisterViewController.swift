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
                
                guard let registerService = RegisterServiceModel(db: AppDatabase.sharedPool, userModel: user) as? RegisterServiceModelProtocol else {return}
                setServiceModel(serviceModel: registerService)
                
                registerServiceModel?.insertNewUser()
            } else {
                presentAlertEmptyField()
            }
        }
    }
    
    func presentAlertEmptyField() {
        <#code#>
    }

}
