//
//  MonthlyVisitsViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 10/28/22.
//

import UIKit

class MonthlyVisitsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // monthly visits service model
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        //
    }
    
    func configureTableView() {
        let tableView = UITableView(frame: view.frame)
        self.tableView = tableView
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }

}
