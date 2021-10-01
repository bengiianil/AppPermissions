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
    
    func getPermissionMainViewData(with negativeListener: @escaping VoidCompletionBlock, with positiveListener: @escaping VoidCompletionBlock) -> PermissionMainViewData {
        return PermissionMainViewData(
            image: PermissionImages.camera.value,
            labelData: LabelComponentData(
                title: PermissionLocalizables.cameraPermissionTitle.value,
                subtitle: PermissionLocalizables.cameraPermissionSubTitle.value),
            actionModuleData: ActionModuleData(
                negativeButtonData: ActionButtonData(
                    buttonText: PermissionLocalizables.permissionNotNow.value,
                    buttonType: .outlined(.smooth)).setActionButtonListener(by: negativeListener),
                positiveButtonData: ActionButtonData(
                    buttonText: PermissionLocalizables.permissionOk.value,
                    buttonType: .filled(.smooth)).setActionButtonListener(by: positiveListener )))
    }
    
}
