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
        
        title = ""
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
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "visitsCell", for: indexPath) as! VisitsViewCell
        guard let profileServiceModel = profileServiceModel else {return cell}
        
        switch indexPath.row {
        case 0:
            profileServiceModel.setAllVisits()
            
            guard let countByWeek = profileServiceModel.getCountByWeek() else {presentAlertError(); return cell}
            guard let countGiByWeek = profileServiceModel.getCountByWeekGi() else {presentAlertError(); return cell}
            guard let countNoGiByWeek = profileServiceModel.getCountByWeekNoGi() else {presentAlertError(); return cell}
            
            guard let countByMonth = profileServiceModel.getCountByMonth() else {presentAlertError(); return cell}
            guard let countGiByMonth = profileServiceModel.getCountByMonthGi() else {presentAlertError(); return cell}
            guard let countNoGiByMonth = profileServiceModel.getCountByMonthNoGi() else {presentAlertError(); return cell}
            
            guard let countByYear = profileServiceModel.getCountByYear() else {presentAlertError(); return cell}
            guard let countGiByYear = profileServiceModel.getCountByYearGi() else {presentAlertError(); return cell}
            guard let countNoGiByYear = profileServiceModel.getCountByYearNoGi() else {presentAlertError(); return cell}
            
            guard let countByTotal = profileServiceModel.getCountByTotal() else {presentAlertError(); return cell}
            guard let countGiByTotal = profileServiceModel.getCountByTotalGi() else {presentAlertError(); return cell}
            guard let countNoGiByTotal = profileServiceModel.getCountByTotalNoGi() else {presentAlertError(); return cell}
            
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
            return cell
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
        guard let profileServiceModel = profileServiceModel else {return}

        navigationItem.setHidesBackButton(true, animated: false)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.beltLevelToColor(beltLevel: profileServiceModel.beltLevel)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(settingsBarButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.beltLevelToColor(beltLevel: profileServiceModel.beltLevel)
    }
    
    private func reloadVisitsAnimated() {
        let indexPath = IndexPath(row: 0, section: 0)
        guard let cell = tableView?.cellForRow(at: indexPath) as? VisitsViewCell else {return}
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                cell.alphaToZeroForVisits()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                cell.alphaToOneForVisits()
            }
        }, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.tableView?.reloadData()
        }
        
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
            self.reloadVisitsAnimated()
        }
        
        let noGiAction = UIAlertAction(title: "No Gi", style: .default) { action in
            profileServiceModel.insertNewVisit(id: Visit.setid(), visitDate: Date.setDateStringFromNow(), sessionType: .noGi, userid: profileServiceModel.id)
            self.reloadVisitsAnimated()
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
        presentActionSheetAddVisit()
    }
    
    @objc func settingsBarButtonTapped() {
        guard let user = profileServiceModel?.getUser() else {return}

        let settingsViewController = SettingsViewController()
        let settingsServiceModel = SettingsServiceModel(appDatabase: AppDatabase.sharedPool, user: user)
        
        settingsViewController.setServiceModel(serviceModel: settingsServiceModel)
        
        guard let navigationController = self.navigationController else {return}
        navigationController.pushViewController(settingsViewController, animated: true)
    }

}
