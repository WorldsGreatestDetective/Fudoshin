//
//  MonthlyVisitsViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 10/28/22.
//

import UIKit

class MonthlyVisitsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // monthly visits service model; inject sm from yearly visits
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
    }
    
    func configureTableView() {
        tableView = UITableView(frame: view.frame, style: .grouped)
        guard let tableView = self.tableView else {return}
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 // weekdays.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "" // weeks[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = "" // weekdays[indexPath.row]
        content.secondaryText = "" // noGiVisits/giVisits[indexPath.row] 
        
        cell.contentConfiguration = content
        
        return cell
    }
}
