//
//  AddVisitView.swift
//  Fudoshin
//
//  Created by Nathan Reilly on 7/27/22.
//

import UIKit

class AddVisitView: UIView {
    
    private var delegate: AddVisitViewDelegateProtocol? 
    
    private let giButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        config.title = "Gi"
        
        let button = UIButton(configuration: config, primaryAction: nil)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let noGiButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        config.title = "No gi"
        
        let button = UIButton(configuration: config, primaryAction: nil)
        button.tintColor = UIColor(white: 0.05, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    private func commonInit() {
        let buttons = [giButton, noGiButton]
        
        for button in buttons {
            addSubview(button)
        }
        
        addTargetsToButtons()
        activateConstraints()
    }
    
    private func activateConstraints() {
        let constraintsArray: [NSLayoutConstraint] = [
            giButton.widthAnchor.constraint(equalToConstant: frame.width),
            giButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            giButton.bottomAnchor.constraint(equalTo: noGiButton.topAnchor),
            
            noGiButton.widthAnchor.constraint(equalToConstant: frame.width),
            noGiButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            noGiButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraintsArray)
    }
    
    private func addTargetsToButtons() {
        giButton.addTarget(self, action: #selector(giButtonTapped), for: .touchUpInside)
        noGiButton.addTarget(self, action: #selector(noGiButtonTapped), for: .touchUpInside)
    }
    
    @objc private func giButtonTapped() {
        delegate?.saveVisitGi()
    }
    
    @objc private func noGiButtonTapped() {
        delegate?.saveVisitNoGi()
    }
    
    func setDelegate(delegate: AddVisitViewDelegateProtocol) {
        self.delegate = delegate
    }

}
