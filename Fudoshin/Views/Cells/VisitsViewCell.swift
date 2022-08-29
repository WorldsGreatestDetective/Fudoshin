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
        label.font = UIFont(name: "cochin", size: 28)
        label.tintColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let beltLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "cochin", size: 20)
        label.tintColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let giLabel: UILabel = {
        let label = UILabel()
        let image = UIImage(systemName: "circle.lefthalf.filled")
        
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
        let image = UIImage(systemName: "circle.righthalf.filled")
        
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
        label.font = UIFont(name: "kefa", size: 17)
        
        return label
    }()
    
    private let byWeekAllVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "kefa", size: 17)
        
        return label
    }()
    
    private let byWeekNoGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "kefa", size: 17)
        
        return label
    }()
    
    private let byMonthGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "kefa", size: 17)
        
        return label
    }()
    
    private let byMonthAllVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "kefa", size: 17)
        
        return label
    }()
    
    private let byMonthNoGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "kefa", size: 17)
        
        return label
    }()
    
    private let byYearGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "kefa", size: 17)
        
        return label
    }()
    
    private let byYearAllVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "kefa", size: 17)
        
        return label
    }()
    
    private let byYearNoGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "kefa", size: 17)
        
        return label
    }()
    
    private let totalGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "kefa", size: 17)
        
        return label
    }()
    
    private let totalAllVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "kefa", size: 17)
        
        return label
    }()
    
    private let totalNoGiVisitsLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "kefa", size: 17)
        
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
        label.text = "this week" // Work with and change font size/style when adjusting ui
        label.font = UIFont(name: "PingFang HK Regular", size: 14)
        label.textAlignment = .center
        
        return label
    }()
    
    private let timeUnitMonthLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "this month" // Work with and change font size/style when adjusting ui
        label.font = UIFont(name: "PingFang HK Regular", size: 14)
        label.textAlignment = .center
        
        return label
    }()
    
    private let timeUnitYearLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "this year" // Work with and change font size/style when adjusting ui
        label.font = UIFont(name: "PingFang HK Regular", size: 14)
        label.textAlignment = .center
        
        return label
    }()
    
    private let timeUnitTotalLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "total visits" // Work with and change font size/style when adjusting ui
        label.font = UIFont(name: "PingFang HK Regular", size: 14)
        label.textAlignment = .center
        
        return label
    }()
    
    private let categoryStackView = UIStackView()
    
    private let giStackView = UIStackView()
    private let allStackView = UIStackView()
    private let noGiStackView = UIStackView()
    
    private let visitsStackView = UIStackView()
    
    private let weekStackView = UIStackView()
    private let monthStackView = UIStackView()
    private let yearStackView = UIStackView()
    private let totalStackView = UIStackView()

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
        addSubview(categoryStackView)
        addSubview(visitsStackView)
    }
    
    private func configureStackView() {
        let categories = [giStackView, allStackView, noGiStackView]
        let giSymbols = [giLabel, giSymbol]
        let noGiSymbols = [noGiLabel, noGiSymbol]
        let allSymbols = [allLabel, allSymbol]
        
        let visits = [weekStackView, timeUnitWeekLabel, monthStackView, timeUnitMonthLabel, yearStackView, timeUnitYearLabel, totalStackView, timeUnitTotalLabel]
        let weekVisits = [byWeekGiVisitsLabel, byWeekAllVisitsLabel, byWeekNoGiVisitsLabel]
        let monthVisits = [byMonthGiVisitsLabel, byMonthAllVisitsLabel, byMonthNoGiVisitsLabel]
        let yearVisits = [byYearGiVisitsLabel, byYearAllVisitsLabel, byYearNoGiVisitsLabel]
        let totalVisits = [totalGiVisitsLabel, totalAllVisitsLabel, totalNoGiVisitsLabel]
        
        categoryStackView.translatesAutoresizingMaskIntoConstraints = false
        visitsStackView.translatesAutoresizingMaskIntoConstraints = false
         
        categoryStackView.axis = .horizontal
        
        giStackView.axis = .vertical
        allStackView.axis = .vertical
        noGiStackView.axis = .vertical
        
        visitsStackView.axis = .vertical
        weekStackView.axis = .horizontal
        monthStackView.axis = .horizontal
        yearStackView.axis = .horizontal
        totalStackView.axis = .horizontal
        
        categoryStackView.distribution = .equalCentering
        
        //visitsStackView.distribution = .equalCentering
        weekStackView.distribution = .equalCentering
        monthStackView.distribution = .equalCentering
        yearStackView.distribution = .equalCentering
        totalStackView.distribution = .equalCentering
        
        categoryStackView.spacing = 135
        
        giStackView.spacing = 3
        allStackView.spacing = 3
        noGiStackView.spacing = 3
        
        visitsStackView.spacing = 16
        weekStackView.spacing = 135
        monthStackView.spacing = 135
        yearStackView.spacing = 135
        totalStackView.spacing = 135
        
        for category in categories {
            categoryStackView.addArrangedSubview(category)
        }
        
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
        
        for visit in visits {
            visitsStackView.addArrangedSubview(visit)
        }
        
        for visit in weekVisits {
            weekStackView.addArrangedSubview(visit)
        }
        for visit in monthVisits {
            monthStackView.addArrangedSubview(visit)
        }
        for visit in yearVisits {
            yearStackView.addArrangedSubview(visit)
        }
        for visit in totalVisits {
            totalStackView.addArrangedSubview(visit)
        }
    }
    
    private func activateConstraints() {
        let constraintsArray: [NSLayoutConstraint] = [
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            
            beltLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            beltLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            categoryStackView.topAnchor.constraint(equalTo: beltLabel.bottomAnchor, constant: 30),
            categoryStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            visitsStackView.topAnchor.constraint(equalTo: categoryStackView.bottomAnchor, constant: 15),
            visitsStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
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
            let config = UIImage.SymbolConfiguration(hierarchicalColor: .white)
            
            // TODO: Extract applying config to symbols to method?
            
            let noGiImage = noGiSymbol?.image?.applyingSymbolConfiguration(config)
            let allImage = allSymbol?.image?.applyingSymbolConfiguration(config)
            let giImage = giSymbol?.image?.applyingSymbolConfiguration(config)
            
            noGiSymbol?.image = noGiImage
            allSymbol?.image = allImage
            giSymbol?.image = giImage
        case .blue:
            let config = UIImage.SymbolConfiguration(hierarchicalColor: .systemBlue)
            
            let noGiImage = noGiSymbol?.image?.applyingSymbolConfiguration(config)
            let allImage = allSymbol?.image?.applyingSymbolConfiguration(config)
            let giImage = giSymbol?.image?.applyingSymbolConfiguration(config)
            
            noGiSymbol?.image = noGiImage
            allSymbol?.image = allImage
            giSymbol?.image = giImage
        case .purple:
            let config = UIImage.SymbolConfiguration(hierarchicalColor: .systemPurple)
            
            let noGiImage = noGiSymbol?.image?.applyingSymbolConfiguration(config)
            let allImage = allSymbol?.image?.applyingSymbolConfiguration(config)
            let giImage = giSymbol?.image?.applyingSymbolConfiguration(config)
            
            noGiSymbol?.image = noGiImage
            allSymbol?.image = allImage
            giSymbol?.image = giImage
        case .brown:
            let config = UIImage.SymbolConfiguration(hierarchicalColor: .systemBrown)
            
            let noGiImage = noGiSymbol?.image?.applyingSymbolConfiguration(config)
            let allImage = allSymbol?.image?.applyingSymbolConfiguration(config)
            let giImage = giSymbol?.image?.applyingSymbolConfiguration(config)
            
            noGiSymbol?.image = noGiImage
            allSymbol?.image = allImage
            giSymbol?.image = giImage
        case .black:
            let config = UIImage.SymbolConfiguration(hierarchicalColor: .systemRed)
            
            let noGiImage = noGiSymbol?.image?.applyingSymbolConfiguration(config)
            let allImage = allSymbol?.image?.applyingSymbolConfiguration(config)
            let giImage = giSymbol?.image?.applyingSymbolConfiguration(config)
            
            noGiSymbol?.image = noGiImage
            allSymbol?.image = allImage
            giSymbol?.image = giImage
        }
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
