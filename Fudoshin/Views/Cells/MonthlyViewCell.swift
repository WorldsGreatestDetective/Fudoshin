//
//  MonthlyViewCell.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 11/1/22.
//

import UIKit

class MonthlyViewCell: UITableViewCell {
    
    private let januarySymbol: UIImageView? = {
        guard let image = UIImage(systemName: "j.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 27)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        
        view.contentMode = .scaleAspectFit
        view.tag = 1
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private let februarySymbol: UIImageView? = {
        guard let image = UIImage(systemName: "f.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 27)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        
        view.contentMode = .scaleAspectFit
        view.tag = 2
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private let marchSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "m.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 27)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        
        view.contentMode = .scaleAspectFit
        view.tag = 3
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private let aprilSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "a.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 27)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        
        view.contentMode = .scaleAspectFit
        view.tag = 4
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private let maySymbol: UIImageView? = {
        guard let image = UIImage(systemName: "m.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 27)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        
        view.contentMode = .scaleAspectFit
        view.tag = 5
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private let juneSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "j.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 27)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        
        view.contentMode = .scaleAspectFit
        view.tag = 6
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private let julySymbol: UIImageView? = {
        guard let image = UIImage(systemName: "j.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 27)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        
        view.contentMode = .scaleAspectFit
        view.tag = 7
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private let augustSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "a.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 27)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        
        view.contentMode = .scaleAspectFit
        view.tag = 8
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private let septemberSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "s.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 27)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        
        view.contentMode = .scaleAspectFit
        view.tag = 9
        view.isUserInteractionEnabled = true

        return view
    }()
    
    private let octoberSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "o.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 27)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        
        view.contentMode = .scaleAspectFit
        view.tag = 10
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private let novemberSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "n.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 27)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        
        view.contentMode = .scaleAspectFit
        view.tag = 11
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private let decemberSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "d.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 27)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        
        view.contentMode = .scaleAspectFit
        view.tag = 12
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    private var delegate: MonthlyViewCellDelegate?
    
    private var mainStackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit() {
        configureSubViews()
        
        contentView.addSubview(mainStackView)
        
        addTargetToSymbols()
        activateConstraints()
    }
    
    private func configureSubViews() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        mainStackView.axis = .vertical
        mainStackView.distribution = .equalCentering
        mainStackView.alignment = .fill
        mainStackView.spacing = 40
        
        let stackViewOne = UIStackView()
        let stackViewTwo = UIStackView()
        let stackViewThree = UIStackView()
        
        stackViewOne.alignment = .top
        stackViewTwo.alignment = .top
        stackViewThree.alignment = .top
        
        stackViewOne.distribution = .equalSpacing
        stackViewTwo.distribution = .equalSpacing
        stackViewThree.distribution = .equalSpacing
        
        stackViewOne.axis = .horizontal
        stackViewTwo.axis = .horizontal
        stackViewThree.axis = .horizontal
        
        stackViewOne.spacing = 60
        stackViewTwo.spacing = 60
        stackViewThree.spacing = 60
        
        let viewsOne = [januarySymbol, februarySymbol, marchSymbol, aprilSymbol]
        let viewsTwo = [maySymbol, juneSymbol, julySymbol, augustSymbol]
        let viewsThree = [septemberSymbol, octoberSymbol, novemberSymbol, decemberSymbol]
        
        let stackViews = [stackViewOne,stackViewTwo,stackViewThree]
        
        for one in viewsOne {
            stackViewOne.addArrangedSubview(one!)
        }
        
        for two in viewsTwo {
            stackViewTwo.addArrangedSubview(two!)
        }
        
        for three in viewsThree {
            stackViewThree.addArrangedSubview(three!)
        }
        
        for view in stackViews {
            mainStackView.addArrangedSubview(view)
        }
        
    }
    
    private func activateConstraints() {
        let array: [NSLayoutConstraint] = [
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            //mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25),
            mainStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25)
        ]
        
        NSLayoutConstraint.activate(array)
    }
    
    private func addTargetToSymbols() {
        let symbols: [UIImageView?] = [januarySymbol, februarySymbol, marchSymbol, aprilSymbol, maySymbol, juneSymbol, julySymbol, augustSymbol, septemberSymbol, octoberSymbol, novemberSymbol, decemberSymbol]
        
        for symbol in symbols {
            guard let symbol = symbol else {return}
            
            let gestureRecognizer = UITapGestureRecognizer()
            gestureRecognizer.addTarget(self, action: #selector(monthSymbolTapped(sender:)))
            symbol.addGestureRecognizer(gestureRecognizer)
        }
    }
    
    @objc func monthSymbolTapped(sender: UIGestureRecognizer) {
        guard let tag = sender.view?.tag else {return}
        
        switch tag {
        case 1:
            delegate?.pushToYearlyVisits(month: tag)
        case 2:
            delegate?.pushToYearlyVisits(month: tag)
        case 3:
            delegate?.pushToYearlyVisits(month: tag)
        case 4:
            delegate?.pushToYearlyVisits(month: tag)
        case 5:
            delegate?.pushToYearlyVisits(month: tag)
        case 6:
            delegate?.pushToYearlyVisits(month: tag)
        case 7:
            delegate?.pushToYearlyVisits(month: tag)
        case 8:
            delegate?.pushToYearlyVisits(month: tag)
        case 9:
            delegate?.pushToYearlyVisits(month: tag)
        case 10:
            delegate?.pushToYearlyVisits(month: tag)
        case 11:
            delegate?.pushToYearlyVisits(month: tag)
        case 12:
            delegate?.pushToYearlyVisits(month: tag)
        default:
            return
        }
    }
    
    func setDelegate(delegate: MonthlyViewCellDelegate) {
        self.delegate = delegate
    }
    
    func setSymbolColor(beltLevel: BeltLevel) {
        switch beltLevel {
        case .white:
            let config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor.beltLevelToColor(beltLevel: beltLevel))
            
            let janImage = januarySymbol?.image?.applyingSymbolConfiguration(config)
            let febImage = februarySymbol?.image?.applyingSymbolConfiguration(config)
            let marImage = marchSymbol?.image?.applyingSymbolConfiguration(config)
            let aprImage = aprilSymbol?.image?.applyingSymbolConfiguration(config)
            let mayImage = maySymbol?.image?.applyingSymbolConfiguration(config)
            let junImage = juneSymbol?.image?.applyingSymbolConfiguration(config)
            let julImage = julySymbol?.image?.applyingSymbolConfiguration(config)
            let augImage = augustSymbol?.image?.applyingSymbolConfiguration(config)
            let sepImage = septemberSymbol?.image?.applyingSymbolConfiguration(config)
            let octImage = octoberSymbol?.image?.applyingSymbolConfiguration(config)
            let novImage = novemberSymbol?.image?.applyingSymbolConfiguration(config)
            let decImage = decemberSymbol?.image?.applyingSymbolConfiguration(config)
            
            januarySymbol?.image = janImage
            februarySymbol?.image = febImage
            marchSymbol?.image = marImage
            aprilSymbol?.image = aprImage
            maySymbol?.image = mayImage
            juneSymbol?.image = junImage
            julySymbol?.image = julImage
            augustSymbol?.image = augImage
            septemberSymbol?.image = sepImage
            octoberSymbol?.image = octImage
            novemberSymbol?.image = novImage
            decemberSymbol?.image = decImage
        case .blue:
            let config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor.beltLevelToColor(beltLevel: beltLevel))
            
            let janImage = januarySymbol?.image?.applyingSymbolConfiguration(config)
            let febImage = februarySymbol?.image?.applyingSymbolConfiguration(config)
            let marImage = marchSymbol?.image?.applyingSymbolConfiguration(config)
            let aprImage = aprilSymbol?.image?.applyingSymbolConfiguration(config)
            let mayImage = maySymbol?.image?.applyingSymbolConfiguration(config)
            let junImage = juneSymbol?.image?.applyingSymbolConfiguration(config)
            let julImage = julySymbol?.image?.applyingSymbolConfiguration(config)
            let augImage = augustSymbol?.image?.applyingSymbolConfiguration(config)
            let sepImage = septemberSymbol?.image?.applyingSymbolConfiguration(config)
            let octImage = octoberSymbol?.image?.applyingSymbolConfiguration(config)
            let novImage = novemberSymbol?.image?.applyingSymbolConfiguration(config)
            let decImage = decemberSymbol?.image?.applyingSymbolConfiguration(config)
            
            januarySymbol?.image = janImage
            februarySymbol?.image = febImage
            marchSymbol?.image = marImage
            aprilSymbol?.image = aprImage
            maySymbol?.image = mayImage
            juneSymbol?.image = junImage
            julySymbol?.image = julImage
            augustSymbol?.image = augImage
            septemberSymbol?.image = sepImage
            octoberSymbol?.image = octImage
            novemberSymbol?.image = novImage
            decemberSymbol?.image = decImage
        case .purple:
            let config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor.beltLevelToColor(beltLevel: beltLevel))
            
            let janImage = januarySymbol?.image?.applyingSymbolConfiguration(config)
            let febImage = februarySymbol?.image?.applyingSymbolConfiguration(config)
            let marImage = marchSymbol?.image?.applyingSymbolConfiguration(config)
            let aprImage = aprilSymbol?.image?.applyingSymbolConfiguration(config)
            let mayImage = maySymbol?.image?.applyingSymbolConfiguration(config)
            let junImage = juneSymbol?.image?.applyingSymbolConfiguration(config)
            let julImage = julySymbol?.image?.applyingSymbolConfiguration(config)
            let augImage = augustSymbol?.image?.applyingSymbolConfiguration(config)
            let sepImage = septemberSymbol?.image?.applyingSymbolConfiguration(config)
            let octImage = octoberSymbol?.image?.applyingSymbolConfiguration(config)
            let novImage = novemberSymbol?.image?.applyingSymbolConfiguration(config)
            let decImage = decemberSymbol?.image?.applyingSymbolConfiguration(config)
            
            januarySymbol?.image = janImage
            februarySymbol?.image = febImage
            marchSymbol?.image = marImage
            aprilSymbol?.image = aprImage
            maySymbol?.image = mayImage
            juneSymbol?.image = junImage
            julySymbol?.image = julImage
            augustSymbol?.image = augImage
            septemberSymbol?.image = sepImage
            octoberSymbol?.image = octImage
            novemberSymbol?.image = novImage
            decemberSymbol?.image = decImage
        case .brown:
            let config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor.beltLevelToColor(beltLevel: beltLevel))
            
            let janImage = januarySymbol?.image?.applyingSymbolConfiguration(config)
            let febImage = februarySymbol?.image?.applyingSymbolConfiguration(config)
            let marImage = marchSymbol?.image?.applyingSymbolConfiguration(config)
            let aprImage = aprilSymbol?.image?.applyingSymbolConfiguration(config)
            let mayImage = maySymbol?.image?.applyingSymbolConfiguration(config)
            let junImage = juneSymbol?.image?.applyingSymbolConfiguration(config)
            let julImage = julySymbol?.image?.applyingSymbolConfiguration(config)
            let augImage = augustSymbol?.image?.applyingSymbolConfiguration(config)
            let sepImage = septemberSymbol?.image?.applyingSymbolConfiguration(config)
            let octImage = octoberSymbol?.image?.applyingSymbolConfiguration(config)
            let novImage = novemberSymbol?.image?.applyingSymbolConfiguration(config)
            let decImage = decemberSymbol?.image?.applyingSymbolConfiguration(config)
            
            januarySymbol?.image = janImage
            februarySymbol?.image = febImage
            marchSymbol?.image = marImage
            aprilSymbol?.image = aprImage
            maySymbol?.image = mayImage
            juneSymbol?.image = junImage
            julySymbol?.image = julImage
            augustSymbol?.image = augImage
            septemberSymbol?.image = sepImage
            octoberSymbol?.image = octImage
            novemberSymbol?.image = novImage
            decemberSymbol?.image = decImage
        case .black:
            let config = UIImage.SymbolConfiguration(hierarchicalColor: UIColor.beltLevelToColor(beltLevel: beltLevel))
            
            let janImage = januarySymbol?.image?.applyingSymbolConfiguration(config)
            let febImage = februarySymbol?.image?.applyingSymbolConfiguration(config)
            let marImage = marchSymbol?.image?.applyingSymbolConfiguration(config)
            let aprImage = aprilSymbol?.image?.applyingSymbolConfiguration(config)
            let mayImage = maySymbol?.image?.applyingSymbolConfiguration(config)
            let junImage = juneSymbol?.image?.applyingSymbolConfiguration(config)
            let julImage = julySymbol?.image?.applyingSymbolConfiguration(config)
            let augImage = augustSymbol?.image?.applyingSymbolConfiguration(config)
            let sepImage = septemberSymbol?.image?.applyingSymbolConfiguration(config)
            let octImage = octoberSymbol?.image?.applyingSymbolConfiguration(config)
            let novImage = novemberSymbol?.image?.applyingSymbolConfiguration(config)
            let decImage = decemberSymbol?.image?.applyingSymbolConfiguration(config)
            
            januarySymbol?.image = janImage
            februarySymbol?.image = febImage
            marchSymbol?.image = marImage
            aprilSymbol?.image = aprImage
            maySymbol?.image = mayImage
            juneSymbol?.image = junImage
            julySymbol?.image = julImage
            augustSymbol?.image = augImage
            septemberSymbol?.image = sepImage
            octoberSymbol?.image = octImage
            novemberSymbol?.image = novImage
            decemberSymbol?.image = decImage
        }
    }

}
