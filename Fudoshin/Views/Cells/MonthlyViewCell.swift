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
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let februarySymbol: UIImageView? = {
        guard let image = UIImage(systemName: "f.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let marchSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "m.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let aprilSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "a.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let maySymbol: UIImageView? = {
        guard let image = UIImage(systemName: "m.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let juneSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "j.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let julySymbol: UIImageView? = {
        guard let image = UIImage(systemName: "j.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let augustSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "a.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let septemberSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "s.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let octoberSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "o.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let novemberSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "n.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private let decemberSymbol: UIImageView? = {
        guard let image = UIImage(systemName: "d.circle.fill") else {return nil}
        
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        let newImage = image.applyingSymbolConfiguration(config)
        
        let view = UIImageView(image: newImage)
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private var delegate: MonthlyViewCellDelegate?
    
    private var stackViewOne = UIStackView()
    private var stackViewTwo = UIStackView()
    private var stackViewThree = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit() {
        activateConstraints()
        configureSubViews()
        
        addSubview(stackViewOne)
        addSubview(stackViewTwo)
        addSubview(stackViewThree)
    }
    
    private func configureSubViews() {
        stackViewOne.axis = .horizontal
        stackViewTwo.axis = .horizontal
        stackViewThree.axis = .horizontal
        
        stackViewOne.spacing = 45
        stackViewTwo.spacing = 45
        stackViewThree.spacing = 45
        
        let viewsOne = [januarySymbol, februarySymbol, marchSymbol, aprilSymbol]
        let viewsTwo = [maySymbol, juneSymbol, julySymbol, augustSymbol]
        let viewsThree = [septemberSymbol, octoberSymbol, novemberSymbol, decemberSymbol]
        
        for one in viewsOne {
            stackViewOne.addArrangedSubview(one!)
        }
        
        for two in viewsTwo {
            stackViewTwo.addArrangedSubview(two!)
        }
        
        for three in viewsThree {
            stackViewThree.addArrangedSubview(three!)
        }
    }
    
    private func activateConstraints() {
        let array: [NSLayoutConstraint] = [
            stackViewOne.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackViewTwo.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackViewThree.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            stackViewOne.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            stackViewTwo.topAnchor.constraint(equalTo: stackViewOne.bottomAnchor, constant: 15),
            stackViewThree.topAnchor.constraint(equalTo: stackViewTwo.bottomAnchor, constant: 15)
        ]
        
        NSLayoutConstraint.activate(array)
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
