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
        guard let loginView = view as? LoginView else {return}
        
        if let email = loginView.getEmail(), let password = loginView.getPassword() {
            loginServiceModel = LoginServiceModel(email: email, password: password, appDatabase: AppDatabase.sharedPool)
            guard let loginServiceModel = loginServiceModel else {return}
            
            if loginServiceModel.fetchUserByLogin() == nil {
                // if-let lsm stuff
                // pass public loginsm properties to profilesm
                
                // configure and push to nav controller; embed profile vc
            } else {
                presentLoginErrorAlert()
            }
        }
    }
    
    private func pushToProfileVC() {
        // May have to push to nav controller
    }
    
    private func configureNavController() {
        guard let navigationController = self.navigationController else {return}
        let barAppearance = UINavigationBarAppearance()
        barAppearance.configureWithDefaultBackground()
        
        navigationController.navigationBar.standardAppearance = barAppearance
    }
    
    private func presentLoginErrorAlert() {
        // present alert
    }

}
