//
//  RegisterViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 6/14/22.
//

import UIKit

class RegisterViewController: UIViewController, RegisterViewDelegateProtocol {
    
    // service model

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    func setView() {
        let registerView = RegisterView(frame: self.view.frame)
        registerView.setDelegate(delegate: self)
        
        self.view = registerView
    }

}
