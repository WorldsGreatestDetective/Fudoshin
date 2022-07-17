//
//  VisitsByTotalCell.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 7/17/22.
//

import UIKit

class VisitsByTotalCell: UITableViewCell {

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
    
    private let timeUnitLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "total visits" // Work with and change font size/style when adjusting ui
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
        activateConstraints()
    }
    
    private func configureStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(giVisitsLabel)
        stackView.addArrangedSubview(allVisitsLabel)
        stackView.addArrangedSubview(noGiVisitsLabel)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 110 // May change when testing on different devices
    }
    
    // For all constraints where a fixed distance is applied; should consider a minimum/maximum (variable) distance instead of fixed distance
    
    private func activateConstraints() {
        let constraintsArray: [NSLayoutConstraint] = [timeUnitLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor), timeUnitLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 4), stackView.bottomAnchor.constraint(equalTo: timeUnitLabel.topAnchor, constant: 12), stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor), stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor), stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)]
        
        NSLayoutConstraint.activate(constraintsArray)
    }
    
    func setGiVisitsByTotal(visits: Int) {
        giVisitsLabel.text = "\(visits)"
    }
    
    func setNoGiVisitsByTotal(visits: Int) {
        noGiVisitsLabel.text = "\(visits)"
    }
    
    func setAllVisitsByTotal(visits: Int) {
        allVisitsLabel.text = "\(visits)"
    }

}
