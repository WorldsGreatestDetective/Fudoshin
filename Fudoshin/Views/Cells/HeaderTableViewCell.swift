//
//  HeaderTableViewCell.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 7/12/22.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "kefa", size: 24)
        label.tintColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let beltLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "kefa", size: 19)
        label.tintColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let giLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gi"
        label.font = UIFont(name: "kefa", size: 19)
        label.tintColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let allLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "All"
        label.font = UIFont(name: "kefa", size: 19)
        label.tintColor = .white
        label.textAlignment = .right
        
        return label
    }()
    
    private let noGiLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No Gi"
        label.font = UIFont(name: "kefa", size: 19)
        label.tintColor = .white
        label.textAlignment = .right
        
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
        
        let views = [nameLabel, beltLabel, stackView]
        
        for view in views {
            addSubview(view)
        }
        
        activateConstraints()
    }
    
    private func configureStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(giLabel)
        stackView.addArrangedSubview(allLabel)
        stackView.addArrangedSubview(noGiLabel)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 110 
    }
    
    private func activateConstraints() {
        let constraintsArray: [NSLayoutConstraint] = [
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            
            beltLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            beltLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.topAnchor.constraint(equalTo: beltLabel.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        ]
        
        NSLayoutConstraint.activate(constraintsArray)
    }
    
    func setNameLabelText(firstName: String, lastName: String) {
        nameLabel.text = "\(firstName) \(lastName)"
    }
    
    func setBeltLabelText(beltLevel: BeltLevel) {
        switch beltLevel {
        case .white:
            beltLabel.text = "White belt"
        case .blue:
            beltLabel.text = "Blue belt"
        case .purple:
            beltLabel.text = "Purple belt"
        case .brown:
            beltLabel.text = "Brown belt"
        case .black:
            beltLabel.text = "Black belt"
        }
    }

}
