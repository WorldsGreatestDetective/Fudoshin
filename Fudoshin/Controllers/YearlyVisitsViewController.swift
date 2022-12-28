//
//  YearlyVisitsViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 11/14/22.
//

import UIKit

class YearlyVisitsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var monthlyVisitsServiceModel: MonthlyVisitsProtocol?
    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let monthlyVisitsServiceModel = monthlyVisitsServiceModel else {return}
        
        let month = Date.monthIntToMonthString(monthInt: monthlyVisitsServiceModel.monthofYear)
        monthlyVisitsServiceModel.appendYearsByVisits()
        
        title = month
        navigationItem.backBarButtonItem?.tintColor = .white
        configureTableView()
    }
    
    func setServiceModel(serviceModel: MonthlyVisitsProtocol) {
        monthlyVisitsServiceModel = serviceModel
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: view.frame, style: .grouped)
        guard let tableView = self.tableView else {return}
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let monthlyVisitsServiceModel = monthlyVisitsServiceModel else {print("error 1"); return 0}
        guard let count = monthlyVisitsServiceModel.yearsByVisits?.count else {print("error 2");return 0}
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let monthlyVisitsServiceModel = monthlyVisitsServiceModel else {return cell}
        guard let year = monthlyVisitsServiceModel.yearsByVisits?[indexPath.row] else {return cell}
        
        var content = cell.defaultContentConfiguration()
        content.text = String(year)
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        guard let content = cell?.contentConfiguration as? UIListContentConfiguration else {return}
        
        print(content.text)
        // Cast the text as Int then pass into service model method to filter visits by year (use visits by year to present data); inject model
    }

}
