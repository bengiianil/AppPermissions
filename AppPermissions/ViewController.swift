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
        
        // If init time, there is no data, we added the data via setData with 3 sec delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.actionButton.setData(by: ActionButtonData(buttonText: "OK", buttonType: .filled(.smooth)))
        }
    }

    private func addActionButton(){
        
        // frame is .zero, because we already set up the constraints manually
        // After GenericBaseView, we dont take data here, we already took inActionButton
        
        // actionButton = ActionButton(frame: .zero, data: ActionButtonData(buttonText: "OK", buttonType: .filled(.smooth)))
        
        // Initialize the button
        actionButton = ActionButton()
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

