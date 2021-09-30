//
//  ActionModule.swift
//  AppPermissions
//
//  Created by Bengi on 30.09.2021.
//

import UIKit

class ActionModule: GenericBaseView<ActionModuleData> {
    
    private var containerView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [negativeButton, positiveButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var negativeButton: ActionButton = {
        
        let negButton = ActionButton()
        negButton.translatesAutoresizingMaskIntoConstraints = false
        negButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        negButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return negButton
    }()
    
    private lazy var positiveButton: ActionButton = {
        
        let posButton = ActionButton()
        posButton.translatesAutoresizingMaskIntoConstraints = false
        posButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        posButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return posButton
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addUserComponents()
    }
    
    private func addUserComponents(){

        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
        ])
    }
    
    // To load the data
    override func loadDataView() {
        
        super.loadDataView()
        
        // If there is no data, because its optional
        guard let data = returnData() else{ return }
        
        negativeButton.setData(by: data.negativeButtonData)
        positiveButton.setData(by: data.positiveButtonData)
    }
}
