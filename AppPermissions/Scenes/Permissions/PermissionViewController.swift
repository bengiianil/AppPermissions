//
//  PermissionViewController.swift
//  AppPermissions
//
//  Created by Bengi on 30.09.2021.
//

import UIKit

class PermissionViewController: BaseViewController<PermissionViewModel> {

    
    private var permissionMainView: PermissionMainView!
    // public var permissionMainViewData: PermissionMainViewData!
    // private var viewModel: PermissionViewModel!

    override func prepareViewControllerConfiguraitons() {
        //  super.prepareViewControllerConfiguraitons()
        addPermissionMainView()
        subscribeViewModelListeners()
    }
    
    /**
     override func viewDidLoad() {
         super.viewDidLoad()
         addPermissionMainView()
         subscribeViewModelListeners()
     }
     */
    
    func addPermissionMainView() {
        
        // permissionMainView = PermissionMainView(data: getPermissionMainViewData())
        permissionMainView = PermissionMainView(data: viewModel.getPermissionMainViewData())

        permissionMainView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(permissionMainView)
        
        NSLayoutConstraint.activate([
        
            permissionMainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            permissionMainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            permissionMainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func subscribeViewModelListeners() {
        viewModel.listenManagerAction{ [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    /**
    private func getPermissionMainViewData() -> PermissionMainViewData {
        return PermissionMainViewData(image: PermissionImages.camera.value, labelData: LabelComponentData(title: "Camera Permission", subtitle: "Would you please give permission to access your camera."), actionModuleData: ActionModuleData(negativeButtonData: ActionButtonData(buttonText: "Not Now", buttonType: .outlined(.smooth)), positiveButtonData: ActionButtonData(buttonText: "OK", buttonType: .filled(.smooth))))
    }
    */
}
