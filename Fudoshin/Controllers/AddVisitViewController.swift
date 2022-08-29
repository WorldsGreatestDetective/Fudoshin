//
//  AddVisitViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 7/26/22.
//

import UIKit

class AddVisitViewController: UIViewController, AddVisitViewDelegateProtocol {
    
    private var addVisitServiceModel: AddVisitServiceModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    private func setView() {
        let addVisitView = AddVisitView(frame: view.frame)
        addVisitView.setDelegate(delegate: self)
        
        view = addVisitView
    }
    
    func setServiceModel(serviceModel: AddVisitServiceModelProtocol) {
        addVisitServiceModel = serviceModel
    }
    
    func saveVisitGi() {
        guard let addVisitServiceModel = addVisitServiceModel else {return}
        
        addVisitServiceModel.setVisit(sessionType: .gi)
        addVisitServiceModel.insertNewVisit()
        
        dismiss(animated: true)
    }
    
    func saveVisitNoGi() {
        guard let addVisitServiceModel = addVisitServiceModel else {return}
        
        addVisitServiceModel.setVisit(sessionType: .noGi)
        addVisitServiceModel.insertNewVisit()
        
        dismiss(animated: true)
    }
    
    private func presentAlertAddVisit() {
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alertController = UIAlertController(title: "Visit Added", message: "Pull down to refresh your visits", preferredStyle: .alert)
        
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
