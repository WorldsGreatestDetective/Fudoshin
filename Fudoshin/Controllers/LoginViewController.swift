//
//  LoginViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 4/29/22.
//

import UIKit

class LoginViewController: UIViewController, LoginViewDelegateProtocol {
    
    // Model or Service(View)Model

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    func setView() {
        let loginView = LoginView(frame: self.view.frame)
        loginView.setDelegate(delegate: self)
        
        self.view = loginView
    }
    
    func pushToRegisterVC() {
        
    }

}
