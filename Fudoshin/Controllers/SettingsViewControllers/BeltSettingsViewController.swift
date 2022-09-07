//
//  BeltSettingsViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 9/2/22.
//

import UIKit

class BeltSettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var settingsServiceModel: SettingsServiceModelProtocol?
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Belt promotion"
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
        let beltCell = tableView.dequeueReusableCell(withIdentifier: "beltCell", for: indexPath) as! BeltFieldTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        beltCell.setTextFieldDelegate(delegate: self)
        
        switch indexPath.section {
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
        return 1
    }
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            print("promoted")
            // See SettingsServiceModel
        }
    }
    
    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let settingsServiceModel = settingsServiceModel else {return true}
        let indexPath = IndexPath(row: 0, section: 0)
        
        guard let cell = tableView?.cellForRow(at: indexPath) as? BeltFieldTableViewCell else {return true}
        
        
        
        return true
    }

}
