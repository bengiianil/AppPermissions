//
//  ViewController.swift
//  AppPermissions
//
//  Created by Bengi on 28.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // As lateinit var
    private var actionButton: ActionButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // At the time of viewDidLoad() execution, call addActionButton() function
        addActionButton()
    }

    private func addActionButton(){
        
        // Initialize the button
        // frame is .zero, because we already set up the constraints manually
        actionButton = ActionButton(frame: .zero, data: ActionButtonData(buttonText: "OK", buttonType: .filled(.smooth)))
        
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
        
            // Size of actionButton
            actionButton.heightAnchor.constraint(equalToConstant: 50),
            actionButton.widthAnchor.constraint(equalToConstant: 120),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

