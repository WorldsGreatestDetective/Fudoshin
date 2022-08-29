//
//  LoginViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 4/29/22.
//

import UIKit

class LoginViewController: UIViewController, LoginViewDelegateProtocol {
    
    private var loginServiceModel: LoginServiceModelProtocol? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let view = self.view as? LoginView else {return}
        view.clearTextFields()
    }
    
    private func setView() {
        let loginView = LoginView(frame: self.view.frame)
        loginView.setDelegate(delegate: self)
        
        self.view = loginView
    }
    
    func pushToRegisterVC() {
        let registerViewController = RegisterViewController()
        
        present(registerViewController, animated: true, completion: nil)
    }
    
    func loginUser() {
        guard let loginView = view as? LoginView else {print("3"); return}
        
        if let email = loginView.getEmail(), let password = loginView.getPassword() {
            loginServiceModel = LoginServiceModel(email: email, password: password, appDatabase: AppDatabase.sharedPool)
            
            guard let loginServiceModel = loginServiceModel else {return}
            
            if loginServiceModel.fetchUserByLogin() == nil {
                
                if let id = loginServiceModel.id, let firstName = loginServiceModel.firstName, let lastName = loginServiceModel.lastName, let beltLevel = loginServiceModel.beltLevel {
                    
                    guard let navigationController = self.navigationController else {print("5"); return}
                    
                    let profileServiceModel = ProfileServiceModel(appDatabase: AppDatabase.sharedPool, email: email, password: password, id: id, firstName: firstName, lastName: lastName, beltLevel: beltLevel)
                    let profileViewController = ProfileViewController()
                    
                    profileViewController.setServiceModel(serviceModel: profileServiceModel)
                    navigationController.pushViewController(profileViewController, animated: true)
                }
            } else {
                presentLoginErrorAlert()
            }
        }
    }
    
    private func presentLoginErrorAlert() {
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: "Error", message: "User not found", preferredStyle: .alert)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }

}
