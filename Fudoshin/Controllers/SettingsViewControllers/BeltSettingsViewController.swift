//
//  BeltSettingsViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 9/2/22.
//

import UIKit

class BeltSettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var settingsServiceModel: SettingsServiceModelProtocol?
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Belt promotion"
        //navigationItem.backBarButtonItem?.tintColor = .white
        configureTableView()
    }
    
    func setServiceModel(serviceModel: SettingsServiceModelProtocol) {
        settingsServiceModel = serviceModel
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: view.frame, style: .insetGrouped)
        guard let tableView = tableView else {return}
        
        view.addSubview(tableView)
        tableView.register(BeltFieldTableViewCell.self, forCellReuseIdentifier: "beltCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(white: 0.05, alpha: 1)
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beltCell = tableView.dequeueReusableCell(withIdentifier: "beltCell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            beltCell.selectionStyle = .none
            return beltCell
        case 1:
            var content = cell.defaultContentConfiguration()
            
            content.text = "Promote"
            
            cell.contentConfiguration = content
            return cell
        default:
            return cell
        }
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Test to see if textfield will work without using this method
        
        if indexPath.row == 1 {
            // See SettingsServiceModel
        }
    }

}
