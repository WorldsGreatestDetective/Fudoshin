//
//  SettingsViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 8/5/22.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var settingsServiceModel: SettingsServiceModelProtocol?
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        navigationItem.backBarButtonItem?.tintColor = .white
        configureTableView()
    }
    
    func setServiceModel(serviceModel: SettingsServiceModelProtocol) {
        settingsServiceModel = serviceModel
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: view.frame, style: .insetGrouped)
        guard let tableView = tableView else {return}
        
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(white: 0.05, alpha: 1)
    }
    
    func presentAlertConfirmDelete() {
        let yesAction = UIAlertAction(title: "yes", style: .destructive, handler: nil)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        let alertController = UIAlertController(title: "Warning", message: "Delete all user visits and profile?", preferredStyle: .alert)
        
        alertController.addAction(cancelAction)
        alertController.addAction(yesAction)
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let someCell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

            var content = cell.defaultContentConfiguration()
            
            content.text = "Delete all user data"
            content.textProperties.color = .red
            
            cell.contentConfiguration = content
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

            var content = cell.defaultContentConfiguration()
            
            content.text = "Belt promotion"
            content.textProperties.color = .white
            
            cell.contentConfiguration = content
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            var content = cell.defaultContentConfiguration()
            
            content.text = "Change email"
            content.textProperties.color = .white
            
            cell.contentConfiguration = content
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            var content = cell.defaultContentConfiguration()
            
            content.text = "Change password"
            content.textProperties.color = .white
            
            cell.contentConfiguration = content
            
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            var content = cell.defaultContentConfiguration()
            
            content.text = "Logout"
            content.textProperties.color = .white
            
            cell.contentConfiguration = content
            
            return cell
        default:
            return someCell
        }
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            guard let settingsServiceModel = settingsServiceModel else {return}
            guard let navigationController = self.navigationController else {return}
            
            let yesAction = UIAlertAction(title: "yes", style: .destructive) { action in
                settingsServiceModel.removeUserData()
                navigationController.popToRootViewController(animated: true)
            }
            let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            
            let alertController = UIAlertController(title: "Warning", message: "Delete all user visits and profile?", preferredStyle: .alert)
            
            alertController.addAction(cancelAction)
            alertController.addAction(yesAction)
            
            present(alertController, animated: true)
        case 1:
            print("tapped")
        case 2:
            print("tapped")
        case 3:
            print("tapped")
        case 4:
            navigationController?.popToRootViewController(animated: true)
        default:
            return
        }
    }
    
}
