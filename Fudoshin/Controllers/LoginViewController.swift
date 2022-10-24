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
        setupToHideKeyboardOnTapOnView()
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
    
    func setServiceModel(serviceModel: LoginServiceModelProtocol) {
        loginServiceModel = serviceModel
    }
    
    func setServiceModelToNil() {
        loginServiceModel = nil
    }
    
    func pushToRegisterVC() {
        let registerViewController = RegisterViewController()
        
        present(registerViewController, animated: true, completion: nil)
    }
    
    func loginUser() {
        guard let loginView = view as? LoginView else {return}
        
        if let email = loginView.getEmail(), let password = loginView.getPassword() {
            loginServiceModel = LoginServiceModel(email: email, password: password, appDatabase: AppDatabase.sharedPool)
            
            guard let loginServiceModel = loginServiceModel else {return}
            
            if loginServiceModel.fetchUserByLogin() == nil {
                
                if let id = loginServiceModel.id, let firstName = loginServiceModel.firstName, let lastName = loginServiceModel.lastName, let beltLevel = loginServiceModel.beltLevel {
                    
                    guard let navigationController = self.navigationController else {return}
                    
                    let profileServiceModel = ProfileServiceModel(appDatabase: AppDatabase.sharedPool, email: email, password: password, id: id, firstName: firstName, lastName: lastName, beltLevel: beltLevel)
                    let profileViewController = ProfileViewController()
                    
                    profileViewController.setServiceModel(serviceModel: profileServiceModel)
                    navigationController.pushViewController(profileViewController, animated: true)
                }
            } else if loginServiceModel.fetchUserByLogin() == .userNotFound {
                presentUserNotFoundAlert()
            } else if loginServiceModel.fetchUserByLogin() == .invalidPassword {
                presentInvalidPasswordAlert()
            }
        }
    }
    
    private func presentUserNotFoundAlert() {
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: "Error", message: "User not found", preferredStyle: .alert)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func presentInvalidPasswordAlert() {
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: "Error", message: "Invalid password", preferredStyle: .alert)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func persistDemoUser() {
        guard let loginServiceModel = loginServiceModel else {return}
        loginServiceModel.insertDemoUser()
    }
    
    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        
        //tap.cancelsTouchesInView = false
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

}
