//
//  ProfileViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 7/14/22.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var profileServiceModel: ProfileServiceModel? = nil
    private var tableView: UITableView?
    private let cellIdentifiers = ["headerCell", "cellByWeek", "cellByMonth", "cellByYear", "cellByTotal"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configureTableView()
    }
    
    func setServiceModel(appDatabase: AppDatabaseProtocol, email: String, password: String, id: String, firstName: String, lastName: String, beltLevel: BeltLevel) {
        
        profileServiceModel = ProfileServiceModel(appDatabase: appDatabase, email: email, password: password, id: id, firstName: firstName, lastName: lastName, beltLevel: beltLevel)
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: view.frame)
        guard let tableView = tableView else {return}

        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: "headerCell")
        tableView.register(VisitsByWeekCell.self, forCellReuseIdentifier: "cellByWeek")
        tableView.register(VisitsByMonthCell.self, forCellReuseIdentifier: "cellByMonth")
        tableView.register(VisitsByYearCell.self, forCellReuseIdentifier: "cellByYear")
        tableView.register(VisitsByTotalCell.self, forCellReuseIdentifier: "cellByTotal")
        tableView.backgroundColor = view.backgroundColor
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellIdentifiers.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let someCell = UITableViewCell()
        guard let profileServiceModel = profileServiceModel else {return someCell}
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as? HeaderTableViewCell else {return someCell}
            
            cell.setNameLabelText(firstName: profileServiceModel.firstName, lastName: profileServiceModel.lastName)
            cell.setBeltLabelText(beltLevel: profileServiceModel.beltLevel)
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellByWeek", for: indexPath) as? VisitsByWeekCell else {return someCell}
            guard let count = profileServiceModel.getCountByWeek() else {return someCell}
            guard let countGi = profileServiceModel.getCountByWeekGi() else {return someCell}
            guard let countNoGi = profileServiceModel.getCountByWeekNoGi() else {return someCell}
            
            cell.setAllVisitsByWeek(visits: count)
            cell.setGiVisitsByWeek(visits: countGi)
            cell.setNoGiVisitsByWeek(visits: countNoGi)
            
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellByMonth", for: indexPath) as? VisitsByMonthCell else {return someCell}
            guard let count = profileServiceModel.getCountByMonth() else {return someCell}
            guard let countGi = profileServiceModel.getCountByMonthGi() else {return someCell}
            guard let countNoGi = profileServiceModel.getCountByMonthNoGi() else {return someCell}
            
            cell.setAllVisitsByMonth(visits: count)
            cell.setGiVisitsByMonth(visits: countGi)
            cell.setNoGiVisitsByMonth(visits: countNoGi)
            
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellByYear", for: indexPath) as? VisitsByYearCell else {return someCell}
            guard let count = profileServiceModel.getCountByYear() else {return someCell}
            guard let countGi = profileServiceModel.getCountByYearGi() else {return someCell}
            guard let countNoGi = profileServiceModel.getCountByYearNoGi() else {return someCell}
            
            cell.setAllVisitsByYear(visits: count)
            cell.setGiVisitsByYear(visits: countGi)
            cell.setNoGiVisitsByYear(visits: countNoGi)
            
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellByTotal", for: indexPath) as? VisitsByTotalCell else {return someCell}
            guard let count = profileServiceModel.getCountByTotal() else {return someCell}
            guard let countGi = profileServiceModel.getCountByTotalGi() else {return someCell}
            guard let countNoGi = profileServiceModel.getCountByTotalNoGi() else {return someCell}
            
            cell.setAllVisitsByTotal(visits: count)
            cell.setGiVisitsByTotal(visits: countGi)
            cell.setNoGiVisitsByTotal(visits: countNoGi)
            
            return cell
        default:
            return someCell
        }
    }
    
    func presentAlertError() {
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: "Error", message: "Data could not be loaded", preferredStyle: .alert)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }

}
