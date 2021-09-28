//
//  ActionButton.swift
//  AppPermissions
//
//  Created by Bengi on 28.09.2021.
//

import UIKit

class ActionButton: BaseView {
    
    private let data: ActionButtonData
    
    // When containerView is called, the view is created and this view is reused when necessary
    private var containerView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var infoTitle: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        // label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.font = FontManager.bold(14).value
        label.text = "OK"
        label.contentMode = .center
        label.textAlignment = .center
        return label
    }()

    init(frame: CGRect, data: ActionButtonData) {
        
        self.data = data
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // addContainerView() func which called in init, inheritted via addMajorViewComponents() from BaseView
    override func addMajorViewComponents() {
        
        super.addMajorViewComponents()
        addContainerView()
        loadData()
    }
    
    private func addContainerView(){
        
        // Add a subview on created view
        addSubview(containerView)
        
        // Added the infoTitle into the containerView
        containerView.addSubview(infoTitle)
        
        // Contents(connect of camera to the top ext.) on view, append active constraint list(array)
        NSLayoutConstraint.activate([
        
            // It can take the size of the container it is in and grow and shrink in all directions
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // infoTitle placed inside containerView
            infoTitle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            infoTitle.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
    func loadData() {
        
        infoTitle.text = data.buttonText
        
        switch data.buttonType {
            
        case .filled(let theme):
            containerView.backgroundColor = theme.value
            infoTitle.textColor = .white
        case .outlined(let theme):
            containerView.backgroundColor = .white
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = theme.value.cgColor
            infoTitle.textColor = theme.value
        }
    }
}
