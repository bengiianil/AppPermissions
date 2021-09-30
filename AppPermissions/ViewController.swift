//
//  ViewController.swift
//  AppPermissions
//
//  Created by Bengi on 28.09.2021.
//

import UIKit

typealias BooleanCompletionBlock = (Bool) -> Void

class ViewController: UIViewController {
    
    // As lateinit var
    private var actionButton: ActionButton!
    private var actionModule: ActionModule!
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
        print("Camera Button Tapped.")
    }
    @IBAction func photosButtonTapped(_ sender: Any) {
        print("Photos Button Tapped.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // At the time of viewDidLoad() execution, call addActionButton() function
        addActionButton()
        addActionModule()
        setupActionModuleData()
        
        // If init time, there is no data, we added the data via setData with 3 sec delay
        /**
         DispatchQueue.main.asyncAfter(deadline: .now()+1) {
             let actionButtonData = ActionButtonData(buttonText: "OK", buttonType: .filled(.smooth)).setActionButtonListener(by: self.actionButtonHandler)
             
             self.actionButton.setData(by: actionButtonData)
         }
         */

        // test(completion: testHandler)
    }
    
    lazy var testHandler: BooleanCompletionBlock = { value in
        print("value: \(value)")
    }

    lazy var actionButtonHandler: VoidCompletionBlock = {
        print("Action Button Pressed.")
    }
    
    private func addActionButton(){
        
        // frame is .zero, because we already set up the constraints manually
        // After GenericBaseView, we dont take data here, we already took inActionButton
        
        // actionButton = ActionButton(frame: .zero, data: ActionButtonData(buttonText: "OK", buttonType: .filled(.smooth)))
        
        // Initialize the button
        actionButton = ActionButton()
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        // actionButton.delegate = self
        
        view.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
        
            // Size of actionButton
            actionButton.heightAnchor.constraint(equalToConstant: 50),
            actionButton.widthAnchor.constraint(equalToConstant: 120),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func addActionModule(){
        
        actionModule = ActionModule()
        actionModule.translatesAutoresizingMaskIntoConstraints = false
                
        view.addSubview(actionModule)
        
        NSLayoutConstraint.activate([
        
            actionModule.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionModule.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200)
        ])
    }

    func setupActionModuleData() {
        
        let negativeButton = ActionButtonData(buttonText: "Not Now", buttonType: .outlined(.smooth)).setActionButtonListener {
            print("Negative Button Fired.")
        }
        
        let positiveButton = ActionButtonData(buttonText: "OK", buttonType: .filled(.smooth)).setActionButtonListener {
            print("Positive Button Fired.")
        }
        actionModule.setData(by: ActionModuleData(negativeButtonData: negativeButton, positiveButtonData: positiveButton))
    }
    
    func test(completion: @escaping (Bool) -> Void) {
        
        print("Test Fired.")
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            completion(true)
        }
    }
}

/**
 extension ViewController: ActionButtonDelegate {
     func actionButtonPressed() {
         // In here, we can do anything we want
         print("ViewController is informed.")
     }
 }
 */

