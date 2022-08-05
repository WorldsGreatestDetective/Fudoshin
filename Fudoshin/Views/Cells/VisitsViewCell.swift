//
//  VisitsViewCell.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 8/2/22.
//

import UIKit

class VisitsViewCell: UITableViewCell {
    
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit() {
        
        
    }

}
