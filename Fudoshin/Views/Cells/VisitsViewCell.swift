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
        label.font = UIFont(name: "kefa", size: 28)
        label.tintColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let beltLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "kefa", size: 20)
        label.tintColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let giLabel: UILabel = {
        let label = UILabel()
        //let image = UIImage(systemName: "circle.lefthalf.filled")
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gi"
        label.font = UIFont(name: "kefa", size: 10)
        label.tintColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let allLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "All"
        label.font = UIFont(name: "kefa", size: 10)
        label.tintColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let noGiLabel: UILabel = {
        let label = UILabel()
        //let image = UIImage(systemName: "circle.righthalf.filled")
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No Gi"
        label.font = UIFont(name: "kefa", size: 10)
        label.tintColor = .white
        label.textAlignment = .right
        
        return label
    }()
    
    private let byWeekGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Regular", size: 17)
        
        return label
    }()
    
    private let byWeekAllVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Regular", size: 17)
        
        return label
    }()
    
    private let byWeekNoGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Regular", size: 17)
        
        return label
    }()
    
    private let byMonthGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Regular", size: 17)
        
        return label
    }()
    
    private let byMonthAllVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Regular", size: 17)
        
        return label
    }()
    
    private let byMonthNoGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Regular", size: 17)
        
        return label
    }()
    
    private let byYearGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Regular", size: 17)
        
        return label
    }()
    
    private let byYearAllVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Regular", size: 17)
        
        return label
    }()
    
    private let byYearNoGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Regular", size: 17)
        
        return label
    }()
    
    private let totalGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Regular", size: 17)
        
        return label
    }()
    
    private let totalAllVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Regular", size: 17)
        
        return label
    }()
    
    private let totalNoGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Regular", size: 17)
        
        return label
    }()
    
    private let giSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "circle.lefthalf.filled") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let allSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let noGiSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "circle.righthalf.filled") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let timeUnitWeekLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "this week" 
        label.font = UIFont(name: "kefa", size: 14)
        label.textAlignment = .center
        
        return label
    }()
    
    private let timeUnitMonthLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "this month"
        label.font = UIFont(name: "kefa", size: 14)
        label.textAlignment = .center
        
        return label
    }()
    
    private let timeUnitYearLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "this year"
        label.font = UIFont(name: "kefa", size: 14)
        label.textAlignment = .center
        
        return label
    }()
    
    private let timeUnitTotalLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "total visits"
        label.font = UIFont(name: "kefa", size: 14)
        label.textAlignment = .center
        
        return label
    }()

    private let giStackView = UIStackView()
    private let allStackView = UIStackView()
    private let noGiStackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit() {
        addConfiguredSubviews()
        configureStackView()
        activateConstraints()
    }
    
    private func addConfiguredSubviews() {
        addSubview(nameLabel)
        addSubview(beltLabel)
        
        let views: [UIView] = [
            noGiStackView, allStackView, giStackView,
            byWeekGiVisitsLabel, byWeekNoGiVisitsLabel, byWeekAllVisitsLabel,
            byMonthGiVisitsLabel, byMonthAllVisitsLabel, byMonthNoGiVisitsLabel,
            byYearGiVisitsLabel, byYearAllVisitsLabel, byYearNoGiVisitsLabel,
            totalGiVisitsLabel, totalAllVisitsLabel, totalNoGiVisitsLabel,
            timeUnitYearLabel, timeUnitTotalLabel, timeUnitMonthLabel, timeUnitWeekLabel
        ]
        
        for view in views {
            addSubview(view)
        }
    }
    
    private func configureStackView() {
        let giSymbols = [giLabel, giSymbol]
        let noGiSymbols = [noGiLabel, noGiSymbol]
        let allSymbols = [allLabel, allSymbol]
        
        giStackView.axis = .vertical
        allStackView.axis = .vertical
        noGiStackView.axis = .vertical
        
        giStackView.spacing = 3
        allStackView.spacing = 3
        noGiStackView.spacing = 3
        
        giStackView.translatesAutoresizingMaskIntoConstraints = false
        noGiStackView.translatesAutoresizingMaskIntoConstraints = false
        allStackView.translatesAutoresizingMaskIntoConstraints = false
        
        for symbol in giSymbols {
            guard let symbol = symbol else {return}
            giStackView.addArrangedSubview(symbol)
        }
        
        for symbol in allSymbols {
            guard let symbol = symbol else {return}
            allStackView.addArrangedSubview(symbol)
        }
        
        for symbol in noGiSymbols {
            guard let symbol = symbol else {return}
            noGiStackView.addArrangedSubview(symbol)
        }
    }
    
    private func activateConstraints() {
        let constraintsArray: [NSLayoutConstraint] = [
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            
            beltLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            beltLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            allStackView.topAnchor.constraint(equalTo: beltLabel.bottomAnchor, constant: 30),
            allStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            giStackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -140),
            giStackView.topAnchor.constraint(equalTo: beltLabel.bottomAnchor, constant: 30),
            noGiStackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 140),
            noGiStackView.topAnchor.constraint(equalTo: beltLabel.bottomAnchor, constant: 30),
            
            byWeekAllVisitsLabel.topAnchor.constraint(equalTo: allStackView.bottomAnchor, constant: 25),
            byWeekAllVisitsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timeUnitWeekLabel.topAnchor.constraint(equalTo: byWeekAllVisitsLabel.bottomAnchor, constant: 15),
            timeUnitWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            byMonthAllVisitsLabel.topAnchor.constraint(equalTo: timeUnitWeekLabel.bottomAnchor, constant: 15),
            byMonthAllVisitsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timeUnitMonthLabel.topAnchor.constraint(equalTo: byMonthAllVisitsLabel.bottomAnchor, constant: 15),
            timeUnitMonthLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            byYearAllVisitsLabel.topAnchor.constraint(equalTo: timeUnitMonthLabel.bottomAnchor, constant: 15),
            byYearAllVisitsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timeUnitYearLabel.topAnchor.constraint(equalTo: byYearAllVisitsLabel.bottomAnchor, constant: 15),
            timeUnitYearLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            totalAllVisitsLabel.topAnchor.constraint(equalTo: timeUnitYearLabel.bottomAnchor, constant: 15),
            totalAllVisitsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timeUnitTotalLabel.topAnchor.constraint(equalTo: totalAllVisitsLabel.bottomAnchor, constant: 15),
            timeUnitTotalLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            byWeekGiVisitsLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -140),
            byWeekGiVisitsLabel.topAnchor.constraint(equalTo: allStackView.bottomAnchor, constant: 25),
            byMonthGiVisitsLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -140),
            byMonthGiVisitsLabel.topAnchor.constraint(equalTo: timeUnitWeekLabel.bottomAnchor, constant: 15),
            byYearGiVisitsLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -140),
            byYearGiVisitsLabel.topAnchor.constraint(equalTo: timeUnitMonthLabel.bottomAnchor, constant: 15),
            totalGiVisitsLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -140),
            totalGiVisitsLabel.topAnchor.constraint(equalTo: timeUnitYearLabel.bottomAnchor, constant: 15),
            
            byWeekNoGiVisitsLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 140),
            byWeekNoGiVisitsLabel.topAnchor.constraint(equalTo: allStackView.bottomAnchor, constant: 25),
            byMonthNoGiVisitsLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 140),
            byMonthNoGiVisitsLabel.topAnchor.constraint(equalTo: timeUnitWeekLabel.bottomAnchor, constant: 15),
            byYearNoGiVisitsLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 140),
            byYearNoGiVisitsLabel.topAnchor.constraint(equalTo: timeUnitMonthLabel.bottomAnchor, constant: 15),
            totalNoGiVisitsLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 140),
            totalNoGiVisitsLabel.topAnchor.constraint(equalTo: timeUnitYearLabel.bottomAnchor, constant: 15)
        ]
        
        NSLayoutConstraint.activate(constraintsArray)
    }
    
    func getFrameHeight() -> CGFloat {
        return frame.height
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
    
    func setSymbolColor(beltLevel: BeltLevel) {
        switch beltLevel {
        case .white:
            let config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor.beltLevelToColor(beltLevel: beltLevel))
            
            // TODO: Extract applying config to symbols to method?
            
            let noGiImage = noGiSymbol?.image?.applyingSymbolConfiguration(config)
            let allImage = allSymbol?.image?.applyingSymbolConfiguration(config)
            let giImage = giSymbol?.image?.applyingSymbolConfiguration(config)
            
            noGiSymbol?.image = noGiImage
            allSymbol?.image = allImage
            giSymbol?.image = giImage
        case .blue:
            let config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor.beltLevelToColor(beltLevel: beltLevel))
            
            let noGiImage = noGiSymbol?.image?.applyingSymbolConfiguration(config)
            let allImage = allSymbol?.image?.applyingSymbolConfiguration(config)
            let giImage = giSymbol?.image?.applyingSymbolConfiguration(config)
            
            noGiSymbol?.image = noGiImage
            allSymbol?.image = allImage
            giSymbol?.image = giImage
        case .purple:
            let config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor.beltLevelToColor(beltLevel: beltLevel))
            
            let noGiImage = noGiSymbol?.image?.applyingSymbolConfiguration(config)
            let allImage = allSymbol?.image?.applyingSymbolConfiguration(config)
            let giImage = giSymbol?.image?.applyingSymbolConfiguration(config)
            
            noGiSymbol?.image = noGiImage
            allSymbol?.image = allImage
            giSymbol?.image = giImage
        case .brown:
            let config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor.beltLevelToColor(beltLevel: beltLevel))
            
            let noGiImage = noGiSymbol?.image?.applyingSymbolConfiguration(config)
            let allImage = allSymbol?.image?.applyingSymbolConfiguration(config)
            let giImage = giSymbol?.image?.applyingSymbolConfiguration(config)
            
            noGiSymbol?.image = noGiImage
            allSymbol?.image = allImage
            giSymbol?.image = giImage
        case .black:
            let config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor.beltLevelToColor(beltLevel: beltLevel))
            
            let noGiImage = noGiSymbol?.image?.applyingSymbolConfiguration(config)
            let allImage = allSymbol?.image?.applyingSymbolConfiguration(config)
            let giImage = giSymbol?.image?.applyingSymbolConfiguration(config)
            
            noGiSymbol?.image = noGiImage
            allSymbol?.image = allImage
            giSymbol?.image = giImage
        }
    }
    
    func alphaToZeroForAll() {
        for view in subviews {
            view.alpha = 0
        }
    }
    
    func alphaToOneForAll() {
        for view in subviews {
            view.alpha = 1
        }
    }
    
    func alphaToZeroForVisits() {
        byWeekGiVisitsLabel.alpha = 0
        byWeekAllVisitsLabel.alpha = 0
        byWeekNoGiVisitsLabel.alpha = 0
        
        byMonthGiVisitsLabel.alpha = 0
        byMonthAllVisitsLabel.alpha = 0
        byMonthNoGiVisitsLabel.alpha = 0
        
        byYearGiVisitsLabel.alpha = 0
        byYearAllVisitsLabel.alpha = 0
        byYearNoGiVisitsLabel.alpha = 0
        
        totalGiVisitsLabel.alpha = 0
        totalAllVisitsLabel.alpha = 0
        totalNoGiVisitsLabel.alpha = 0
    }
    
    func alphaToOneForVisits() {
        byWeekGiVisitsLabel.alpha = 1
        byWeekAllVisitsLabel.alpha = 1
        byWeekNoGiVisitsLabel.alpha = 1
        
        byMonthGiVisitsLabel.alpha = 1
        byMonthAllVisitsLabel.alpha = 1
        byMonthNoGiVisitsLabel.alpha = 1
        
        byYearGiVisitsLabel.alpha = 1
        byYearAllVisitsLabel.alpha = 1
        byYearNoGiVisitsLabel.alpha = 1
        
        totalGiVisitsLabel.alpha = 1
        totalAllVisitsLabel.alpha = 1
        totalNoGiVisitsLabel.alpha = 1
    }
    
    func setGiVisitsByWeek(visits: Int) {
        byWeekGiVisitsLabel.text = "\(visits)"
    }
    
    func setNoGiVisitsByWeek(visits: Int) {
        byWeekNoGiVisitsLabel.text = "\(visits)"
    }
    
    func setAllVisitsByWeek(visits: Int) {
        byWeekAllVisitsLabel.text = "\(visits)"
    }
    
    func setGiVisitsByMonth(visits: Int) {
        byMonthGiVisitsLabel.text = "\(visits)"
    }
    
    func setNoGiVisitsByMonth(visits: Int) {
        byMonthNoGiVisitsLabel.text = "\(visits)"
    }
    
    func setAllVisitsByMonth(visits: Int) {
        byMonthAllVisitsLabel.text = "\(visits)"
    }
    
    func setGiVisitsByYear(visits: Int) {
        byYearGiVisitsLabel.text = "\(visits)"
    }
    
    func setNoGiVisitsByYear(visits: Int) {
        byYearNoGiVisitsLabel.text = "\(visits)"
    }
    
    func setAllVisitsByYear(visits: Int) {
        byYearAllVisitsLabel.text = "\(visits)"
    }
    
    func setGiVisitsByTotal(visits: Int) {
        totalGiVisitsLabel.text = "\(visits)"
    }
    
    func setNoGiVisitsByTotal(visits: Int) {
        totalNoGiVisitsLabel.text = "\(visits)"
    }
    
    func setAllVisitsByTotal(visits: Int) {
        totalAllVisitsLabel.text = "\(visits)"
    }
}
