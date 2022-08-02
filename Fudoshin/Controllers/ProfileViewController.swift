//
//  ProfileViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 7/14/22.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var profileServiceModel: ProfileServiceModelProtocol? = nil
    private var tableView: UITableView?
    private let cellIdentifiers = ["headerCell", "cellByWeek", "cellByMonth", "cellByYear", "cellByTotal"]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        
        if profileServiceModel != nil {
            configureTableView()
            //tableView?.reloadData()
        } else {
            // present some error?
            print("service model not injected")
        }
    }
    
    func setServiceModel(serviceModel: ProfileServiceModelProtocol) {
        profileServiceModel = serviceModel
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: view.frame)
        guard let tableView = tableView else {return}

        view.addSubview(tableView)
        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: "headerCell")
        tableView.register(VisitsByWeekCell.self, forCellReuseIdentifier: "cellByWeek")
        tableView.register(VisitsByMonthCell.self, forCellReuseIdentifier: "cellByMonth")
        tableView.register(VisitsByYearCell.self, forCellReuseIdentifier: "cellByYear")
        tableView.register(VisitsByTotalCell.self, forCellReuseIdentifier: "cellByTotal")
        tableView.refreshControl = UIRefreshControl()
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as? HeaderTableViewCell else {print("8");return someCell}
            
            cell.setNameLabelText(firstName: profileServiceModel.firstName, lastName: profileServiceModel.lastName)
            cell.setBeltLabelText(beltLevel: profileServiceModel.beltLevel)
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellByWeek", for: indexPath) as? VisitsByWeekCell else {return someCell}
            guard let count = profileServiceModel.getCountByWeek() else {presentAlertError(); return someCell}
            guard let countGi = profileServiceModel.getCountByWeekGi() else {presentAlertError(); return someCell}
            guard let countNoGi = profileServiceModel.getCountByWeekNoGi() else {presentAlertError(); return someCell}
            
            cell.setAllVisitsByWeek(visits: count)
            cell.setGiVisitsByWeek(visits: countGi)
            cell.setNoGiVisitsByWeek(visits: countNoGi)
            
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellByMonth", for: indexPath) as? VisitsByMonthCell else {return someCell}
            guard let count = profileServiceModel.getCountByMonth() else {presentAlertError(); return someCell}
            guard let countGi = profileServiceModel.getCountByMonthGi() else {presentAlertError(); return someCell}
            guard let countNoGi = profileServiceModel.getCountByMonthNoGi() else {presentAlertError(); return someCell}
            
            cell.setAllVisitsByMonth(visits: count)
            cell.setGiVisitsByMonth(visits: countGi)
            cell.setNoGiVisitsByMonth(visits: countNoGi)
            
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellByYear", for: indexPath) as? VisitsByYearCell else {return someCell}
            guard let count = profileServiceModel.getCountByYear() else {presentAlertError(); return someCell}
            guard let countGi = profileServiceModel.getCountByYearGi() else {presentAlertError(); return someCell}
            guard let countNoGi = profileServiceModel.getCountByYearNoGi() else {presentAlertError(); return someCell}
            
            cell.setAllVisitsByYear(visits: count)
            cell.setGiVisitsByYear(visits: countGi)
            cell.setNoGiVisitsByYear(visits: countNoGi)
            
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellByTotal", for: indexPath) as? VisitsByTotalCell else {return someCell}
            guard let count = profileServiceModel.getCountByTotal() else {presentAlertError(); return someCell}
            guard let countGi = profileServiceModel.getCountByTotalGi() else {presentAlertError(); return someCell}
            guard let countNoGi = profileServiceModel.getCountByTotalNoGi() else {presentAlertError(); return someCell}
            
            cell.setAllVisitsByTotal(visits: count)
            cell.setGiVisitsByTotal(visits: countGi)
            cell.setNoGiVisitsByTotal(visits: countNoGi)
            
            return cell
        default:
            presentAlertError()
            return someCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 130
        } else {
            return 90
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    private func presentAlertError() {
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: "Error", message: "Data could not be loaded", preferredStyle: .alert)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func configureNavigation() {
        guard let navigationController = self.navigationController else {return}
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.configureWithDefaultBackground()
        
        navigationController.navigationBar.standardAppearance = barAppearance
        navigationController.setNavigationBarHidden(false, animated: false)
        
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
        //navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "profileSettings"), style: .plain, target: nil, action: nil)
    }
    
    @objc func addBarButtonTapped() {
        guard let profileServiceModel = profileServiceModel else {return}
        
        let addVisitViewController = AddVisitViewController()
        let addVisitServiceModel = AddVisitServiceModel(appDatabase: AppDatabase.sharedPool, userid: profileServiceModel.id)
        
        addVisitViewController.setServiceModel(serviceModel: addVisitServiceModel)
        addVisitViewController.modalPresentationStyle = .popover
        addVisitViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(addVisitViewController, animated: true)
        
        if addVisitViewController.isBeingDismissed == true {
            tableView?.reloadData()
        }
    }

}
