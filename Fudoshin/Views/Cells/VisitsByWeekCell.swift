//
//  VisitsByWeekCell.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 7/15/22.
//

import UIKit

class VisitsByWeekCell: UITableViewCell {
    
    private let giVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    private let allVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    private let noGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    private let stackView = UIStackView()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        commonInit()
    }

    private func commonInit() {
        backgroundColor = super.backgroundColor
        configureStackView()
        
        addSubview(stackView)
        //activateConstraints()
    }
    
    private func configureStackView() {
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(giVisitsLabel)
        stackView.addArrangedSubview(allVisitsLabel)
        stackView.addArrangedSubview(noGiVisitsLabel)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 110 // May change when testing on different devices
    }
    
    // For all constraints where a fixed distance is applied; should consider a minimum/maximum (variable) distance instead of fixed distance
    
    private func activateConstraints() {
        let constraintsArray: [NSLayoutConstraint] = []
        
        NSLayoutConstraint.activate(constraintsArray)
    }
    
    func setGiVisitsByWeek(visits: Int) {
        giVisitsLabel.text = "\(visits)"
    }
    
    func setNoGiVisitsByWeek(visits: Int) {
        noGiVisitsLabel.text = "\(visits)"
    }
    
    func setAllVisitsByWeek(visits: Int) {
        allVisitsLabel.text = "\(visits)"
    }
    
}
