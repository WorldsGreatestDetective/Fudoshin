//
//  AddVisitViewController.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 7/26/22.
//

import UIKit

class AddVisitViewController: UIViewController, AddVisitViewDelegateProtocol {
    
    var addVisitServiceModel: AddVisitServiceModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    func setView() {
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
}
