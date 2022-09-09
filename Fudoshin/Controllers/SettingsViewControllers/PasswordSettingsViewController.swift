//
//  PasswordSettingsViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 9/6/22.
//

import UIKit

class PasswordSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var settingsServiceModel: SettingsServiceModelProtocol?
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Change password"
        configureTableView()
    }
    
    func setServiceModel(serviceModel: SettingsServiceModelProtocol) {
        settingsServiceModel = serviceModel
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: view.frame, style: .insetGrouped)
        guard let tableView = tableView else {return}
        
        view.addSubview(tableView)
        tableView.register(PasswordFieldTableViewCell.self, forCellReuseIdentifier: "passwordCell")
        tableView.register(ConfirmFieldTableViewCell.self, forCellReuseIdentifier: "confirmCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(white: 0.05, alpha: 1)
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let passwordCell = tableView.dequeueReusableCell(withIdentifier: "passwordCell", for: indexPath) as! PasswordFieldTableViewCell
        let confirmCell = tableView.dequeueReusableCell(withIdentifier: "confirmCell", for: indexPath) as! ConfirmFieldTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let settingsServiceModel = settingsServiceModel else {return cell}
        
        passwordCell.setTextFieldDelegate(delegate: self)
        confirmCell.setTextFieldDelegate(delegate: self)
        
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                passwordCell.selectionStyle = .none
                
                return passwordCell
            } else if indexPath.row == 1 {
                confirmCell.selectionStyle = .none
                
                return confirmCell
            } else {
                return cell
            }
        case 1:
            var content = cell.defaultContentConfiguration()
            
            content.text = "Change"
            content.textProperties.color = UIColor.beltLevelToColor(beltLevel: settingsServiceModel.getBeltLevel())
            
            cell.contentConfiguration = content
            return cell
        default:
            return cell
        }
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let settingsServiceModel = settingsServiceModel else {return}
        
        if indexPath.section == 1 {
            if settingsServiceModel.isPasswordConfirmed() == true {
                settingsServiceModel.updatePassword()
                presentAlertSuccess()
            } else {
                presentAlertPasswordMatch()
            }
        }
    }
    
    private func presentAlertPasswordMatch() {
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: nil, message: "Passwords do not match", preferredStyle: .alert)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func presentAlertEmptyFields() {
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: nil, message: "One or more fields are empty", preferredStyle: .alert)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func presentAlertSuccess() {
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: "Success", message: "Your password has been updated", preferredStyle: .alert)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let settingsServiceModel = settingsServiceModel else {return true}
        
        let passwordIndex = IndexPath(row: 0, section: 0)
        let confirmIndex = IndexPath(row: 1, section: 0)
        
        guard let passwordCell = tableView?.cellForRow(at: passwordIndex) as? PasswordFieldTableViewCell else {return true}
        guard let confirmCell = tableView?.cellForRow(at: confirmIndex) as? ConfirmFieldTableViewCell else {return true}
        
        if textField == passwordCell.getTextField() {
            if let password = passwordCell.getPassword() {
                settingsServiceModel.setPassword(password: password)
            }
        } else if textField == confirmCell.getTextField() {
            if let confirm = confirmCell.getConfirmPassword() {
                settingsServiceModel.setConfirmPassword(confirmPassword: confirm)
            }
        }
        return true
    }

}
