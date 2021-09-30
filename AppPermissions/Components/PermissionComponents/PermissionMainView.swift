//
//  PermissionMainView.swift
//  AppPermissions
//
//  Created by Bengi on 30.09.2021.
//

import UIKit

class PermissionMainView: GenericBaseView<PermissionMainViewData>{
    
    private var containerView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [permissionImage, permissionInfoView, permissionActionModule])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var permissionImage: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var permissionInfoView: LabelComponent = {
        
        let view = LabelComponent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var permissionActionModule: ActionModule = {
        
        let view = ActionModule()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addInterfaceComponents()
    }
    
    private func addInterfaceComponents() {
        
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
    
    override func loadDataView() {
        
        super.loadDataView()
        guard let data = returnData() else{ return }
        
        permissionImage.image = data.image
        permissionInfoView.setData(by: data.labelData)
        permissionActionModule.setData(by: data.actionModuleData)
    }
}
