//
//  ActionButton.swift
//  AppPermissions
//
//  Created by Bengi on 28.09.2021.
//

import UIKit

class ActionButton: GenericBaseView<ActionButtonData> {
        
    private lazy var shadowContainer: UIView = {
        
        let shadow = UIView()
        shadow.translatesAutoresizingMaskIntoConstraints = false
        shadow.layer.shadowColor = UIColor.black.cgColor
        shadow.layer.shadowOffset = CGSize(width: 0, height: 2) // don't cast a shadow from width,
                                                                // cast 2 shadow from height
        shadow.layer.shadowRadius = 4
        shadow.layer.shadowOpacity = 0.4
        shadow.layer.cornerRadius = 6
        return shadow
    }()

    // When containerView is called, the view is created and this view is reused when necessary
    private var containerView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var infoTitle: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        // label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.font = FontManager.bold(14).value
        label.text = ""
        label.contentMode = .center
        label.textAlignment = .center
        return label
    }()
    
    // addContainerView() func which called in init, inheritted via addMajorViewComponents() from BaseView
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addContainerView()
    }
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        addTapGesture()
    }
    
    private func addContainerView(){
        
        // Add a subview on created view, this is our main container
        addSubview(shadowContainer)
        
        // Added the containerView into the shadowContainer
        shadowContainer.addSubview(containerView)
        
        // Added the infoTitle into the containerView
        containerView.addSubview(infoTitle)
        
        // Contents(connect of camera to the top ext.) on view, append active constraint list(array)
        NSLayoutConstraint.activate([
            
            shadowContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowContainer.topAnchor.constraint(equalTo: topAnchor),
            shadowContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
        
            // It can take the size of the container it is in and grow and shrink in all directions
            containerView.leadingAnchor.constraint(equalTo: shadowContainer.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowContainer.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: shadowContainer.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowContainer.bottomAnchor),
            
            // infoTitle placed inside containerView
            infoTitle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            infoTitle.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
    override func loadDataView() {
        
        super.loadDataView()
        
        guard let data = returnData()
        else{ return }
        
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
    /**
     After GenericBaseView, we overrrided the data via loadDataView function
     
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
     */
}

// To make a clickable button, write an extension
extension ActionButton: UIGestureRecognizerDelegate {
    
    private func addTapGesture() {
        
        // #selector(@objc method) is an Objective C method, we can write it as an extension
        // let tap = UIGestureRecognizer(target: self, action: #selector(@objc method))
        let tap = UITapGestureRecognizer(target: self, action: .buttonTappedSelector)
        
        // With delegate, we allowed the UIGestureRecognizer to be able to run UIGestureRecognizerDelegate
        tap.delegate = self
        
        addGestureRecognizer(tap)
    }
    
    @objc fileprivate func buttonTapped(_ sender: UIGestureRecognizer) {
        print("Tap function is worked.")
    }
}

// it usable just for this file
fileprivate extension Selector {
    static let buttonTappedSelector = #selector(ActionButton.buttonTapped)
}

