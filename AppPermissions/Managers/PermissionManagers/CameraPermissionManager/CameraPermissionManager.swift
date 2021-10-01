//
//  CameraPermissionManager.swift
//  AppPermissions
//
//  Created by Bengi on 1.10.2021.
//

import Foundation

class CameraPermissionManager: PermissionManagerProtocol {
    
    func requestPermission(with completion: @escaping VoidCompletionBlock) {
        print("Request Permission")
    }
    
    func getPermissionMainViewData() -> PermissionMainViewData {
        return PermissionMainViewData(image: PermissionImages.camera.value, labelData: LabelComponentData(title: "Camera Permission", subtitle: "Would you please give permission to access your camera."), actionModuleData: ActionModuleData(negativeButtonData: ActionButtonData(buttonText: "Not Now", buttonType: .outlined(.smooth)), positiveButtonData: ActionButtonData(buttonText: "OK", buttonType: .filled(.smooth))))
        
    }
    
    
}
