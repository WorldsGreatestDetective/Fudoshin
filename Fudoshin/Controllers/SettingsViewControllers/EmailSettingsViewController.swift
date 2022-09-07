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
        let emailCell = tableView.dequeueReusableCell(withIdentifier: "emailCell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            emailCell.selectionStyle = .none
            return emailCell
        case 1:
            var content = cell.defaultContentConfiguration()
            
            content.text = "Change"
            
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
        
        if indexPath.section == 1 {
            print("changed")
            // See SettingsServiceModel
        }
    }

}
