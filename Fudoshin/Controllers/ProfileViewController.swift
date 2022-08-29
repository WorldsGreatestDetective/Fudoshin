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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        configureNavigation()
        
        if profileServiceModel != nil {
            configureTableView()
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
        tableView.register(VisitsViewCell.self, forCellReuseIdentifier: "visitsCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.05, alpha: 1)
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let someCell = UITableViewCell()
        guard let profileServiceModel = profileServiceModel else {return someCell}
        
        // TODO: Provide better error handling than just returning someCell; perhaps when returning someCell be sure to return to login?
        
        switch indexPath.row {
        case 0:
            profileServiceModel.setAllVisits()
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "visitsCell", for: indexPath) as? VisitsViewCell else {return someCell}
            
            guard let countByWeek = profileServiceModel.getCountByWeek() else {presentAlertError(); return someCell}
            guard let countGiByWeek = profileServiceModel.getCountByWeekGi() else {presentAlertError(); return someCell}
            guard let countNoGiByWeek = profileServiceModel.getCountByWeekNoGi() else {presentAlertError(); return someCell}
            
            guard let countByMonth = profileServiceModel.getCountByMonth() else {presentAlertError(); return someCell}
            guard let countGiByMonth = profileServiceModel.getCountByMonthGi() else {presentAlertError(); return someCell}
            guard let countNoGiByMonth = profileServiceModel.getCountByMonthNoGi() else {presentAlertError(); return someCell}
            
            guard let countByYear = profileServiceModel.getCountByYear() else {presentAlertError(); return someCell}
            guard let countGiByYear = profileServiceModel.getCountByYearGi() else {presentAlertError(); return someCell}
            guard let countNoGiByYear = profileServiceModel.getCountByYearNoGi() else {presentAlertError(); return someCell}
            
            guard let countByTotal = profileServiceModel.getCountByTotal() else {presentAlertError(); return someCell}
            guard let countGiByTotal = profileServiceModel.getCountByTotalGi() else {presentAlertError(); return someCell}
            guard let countNoGiByTotal = profileServiceModel.getCountByTotalNoGi() else {presentAlertError(); return someCell}
            
            cell.selectionStyle = .none
            
            cell.setNameLabelText(firstName: profileServiceModel.firstName, lastName: profileServiceModel.lastName)
            cell.setBeltLabelText(beltLevel: profileServiceModel.beltLevel)
            cell.setSymbolColor(beltLevel: profileServiceModel.beltLevel)
            
            cell.setAllVisitsByWeek(visits: countByWeek)
            cell.setGiVisitsByWeek(visits: countGiByWeek)
            cell.setNoGiVisitsByWeek(visits: countNoGiByWeek)
            
            cell.setAllVisitsByMonth(visits: countByMonth)
            cell.setGiVisitsByMonth(visits: countGiByMonth)
            cell.setNoGiVisitsByMonth(visits: countNoGiByMonth)
            
            cell.setAllVisitsByYear(visits: countByYear)
            cell.setGiVisitsByYear(visits: countGiByYear)
            cell.setNoGiVisitsByYear(visits: countNoGiByYear)
            
            cell.setAllVisitsByTotal(visits: countByTotal)
            cell.setGiVisitsByTotal(visits: countGiByTotal)
            cell.setNoGiVisitsByTotal(visits: countNoGiByTotal)
            
            return cell
        default:
            presentAlertError()
            return someCell
        }
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let tableView = self.tableView else {return 500}
        return tableView.frame.height
    }
    
    private func configureNavigation() {
        guard let navigationController = self.navigationController else {return}
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.configureWithDefaultBackground()
        
        navigationController.navigationBar.standardAppearance = barAppearance
        navigationController.navigationBar.tintColor = .white
        navigationController.setNavigationBarHidden(false, animated: false)
        
        configureNavigationItems()
    }
    
    private func configureNavigationItems() {
        navigationItem.setHidesBackButton(true, animated: false)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(settingsBarButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    private func presentAlertError() {
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: "Error", message: "Data could not be loaded", preferredStyle: .alert)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func presentAlertAddVisit() {
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: "Visit Added", message: "Pull down to refresh your visits", preferredStyle: .alert)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func presentActionSheetAddVisit() {
        guard let profileServiceModel = profileServiceModel else {return}
        guard let tableView = tableView else {return}

        let giAction = UIAlertAction(title: "Gi", style: .default) { action in
            profileServiceModel.insertNewVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .gi, userid: profileServiceModel.id)
            tableView.reloadData()
        }
        
        let noGiAction = UIAlertAction(title: "No Gi", style: .default) { action in
            profileServiceModel.insertNewVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .noGi, userid: profileServiceModel.id)
            tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let addVisitController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        addVisitController.addAction(giAction)
        addVisitController.addAction(noGiAction)
        addVisitController.addAction(cancelAction)
        addVisitController.view.tintColor = .white
        
        present(addVisitController, animated: true, completion: nil)
    }
    
    @objc func addBarButtonTapped() {
        /*guard let profileServiceModel = profileServiceModel else {return}
        
        let addVisitViewController = AddVisitViewController()
        let addVisitServiceModel = AddVisitServiceModel(appDatabase: AppDatabase.sharedPool, userid: profileServiceModel.id)
        
        addVisitViewController.setServiceModel(serviceModel: addVisitServiceModel)
        
        if let presenter = addVisitViewController.presentationController as? UISheetPresentationController {
            presenter.preferredCornerRadius = 40
            presenter.detents = [.medium()]
        }
        
        present(addVisitViewController, animated: true, completion: nil)*/
        presentActionSheetAddVisit()
    }
    
    @objc func settingsBarButtonTapped() {
        guard let id = profileServiceModel?.id else {return}
        
        let settingsViewController = SettingsViewController()
        let settingsServiceModel = SettingsServiceModel(appDatabase: AppDatabase.sharedPool, id: id)
        
        settingsViewController.setServiceModel(serviceModel: settingsServiceModel)
        
        guard let navigationController = self.navigationController else {return}
        navigationController.pushViewController(settingsViewController, animated: true)
    }

}
