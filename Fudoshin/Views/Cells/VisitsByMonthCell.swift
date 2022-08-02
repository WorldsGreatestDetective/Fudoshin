//
//  VisitsByMonthCell.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 7/17/22.
//

import UIKit

class VisitsByMonthCell: UITableViewCell {

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
        label.text = "this month" // Work with and change font size/style when adjusting ui
        label.font = UIFont(name: "PingFang HK Regular", size: 14)
        label.textAlignment = .center
        
        return label
    }()
    
    private let stackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func commonInit() {
        backgroundColor = super.backgroundColor
        
        configureStackView()
        addSubview(timeUnitLabel)
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
        let constraintsArray: [NSLayoutConstraint] = [
            stackView.bottomAnchor.constraint(equalTo: timeUnitLabel.topAnchor, constant: 25),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            //stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            timeUnitLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            timeUnitLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 10),
        ]
        
        NSLayoutConstraint.activate(constraintsArray)
    }
    
    func setGiVisitsByMonth(visits: Int) {
        giVisitsLabel.text = "\(visits)"
    }
    
    func setNoGiVisitsByMonth(visits: Int) {
        noGiVisitsLabel.text = "\(visits)"
    }
    
    func setAllVisitsByMonth(visits: Int) {
        allVisitsLabel.text = "\(visits)"
    }
}
