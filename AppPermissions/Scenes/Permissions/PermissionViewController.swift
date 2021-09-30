//
//  PermissionViewController.swift
//  AppPermissions
//
//  Created by Bengi on 30.09.2021.
//

import UIKit

class PermissionViewController: UIViewController {

    private var permissionMainView: PermissionMainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPermissionMainView()
    }
    
    func addPermissionMainView() {
        
        permissionMainView = PermissionMainView(data: getPermissionMainViewData())
        permissionMainView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(permissionMainView)
        
        NSLayoutConstraint.activate([
        
            permissionMainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            permissionMainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            permissionMainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func getPermissionMainViewData() -> PermissionMainViewData {
        
        return PermissionMainViewData(image: PermissionImages.camera.value, labelData: LabelComponentData(title: "Camera Permission", subtitle: "Would you please give permission to access your camera"), actionModuleData: ActionModuleData(negativeButtonData: ActionButtonData(buttonText: "Not Now", buttonType: .outlined(.smooth)), positiveButtonData: ActionButtonData(buttonText: "OK", buttonType: .filled(.smooth))))
    }
}
//
