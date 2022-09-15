//
//  EmailSettingsViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 9/3/22.
//

import UIKit

class EmailSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var settingsServiceModel: SettingsServiceModelProtocol?
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Change email"
        configureTableView()
    }
    
    func setServiceModel(serviceModel: SettingsServiceModelProtocol) {
        settingsServiceModel = serviceModel
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: view.frame, style: .insetGrouped)
        guard let tableView = tableView else {return}
        
        view.addSubview(tableView)
        tableView.register(EmailFieldTableViewCell.self, forCellReuseIdentifier: "emailCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(white: 0.05, alpha: 1)
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emailCell = tableView.dequeueReusableCell(withIdentifier: "emailCell", for: indexPath) as! EmailFieldTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let settingsServiceModel = settingsServiceModel else {return cell}
        
        emailCell.setTextFieldDelegate(delegate: self)
        
        switch indexPath.section {
        case 0:
            emailCell.selectionStyle = .none
            return emailCell
        case 1:
            var content = cell.defaultContentConfiguration()
            
            content.text = "Change"
            content.textProperties.color = UIColor.beltLevelToColor(beltLevel: settingsServiceModel.getBeltLevel())
            
            // change email; ssm method
            
            cell.contentConfiguration = content
            return cell
        default:
            return cell
        }
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let settingsServiceModel = settingsServiceModel else {return}
        let indexPath = IndexPath(row: 0, section: 0)
        guard let cell = tableView.cellForRow(at: indexPath) as? EmailFieldTableViewCell else {return}
        
        if indexPath.section == 1 {
            settingsServiceModel.updateEmail()
            cell.clearTextField()
            tableView.deselectRow(at: indexPath, animated: true)
            
            presentAlertSuccess()
            //navigationController?.popViewController(animated: true)
        }
    }
    
    private func presentAlertSuccess() {
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: "Success", message: "Your email has been updated", preferredStyle: .alert)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let settingsServiceModel = settingsServiceModel else {return true}
        
        let indexPath = IndexPath(row: 0, section: 0)
        guard let cell = tableView?.cellForRow(at: indexPath) as? EmailFieldTableViewCell else {return true}
        
        if let email = cell.getEmail() {
            settingsServiceModel.setNewEmail(email: email)
        }
        
        return true
    }

}
