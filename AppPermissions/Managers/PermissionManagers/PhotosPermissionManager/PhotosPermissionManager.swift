//
//  PhotosPermissionManager.swift
//  AppPermissions
//
//  Created by Bengi on 1.10.2021.
//

import Foundation
 
class PhotosPermissionManager: PermissionManagerProtocol {
    
    func requestPermission(with completion: @escaping VoidCompletionBlock) {
        print("Request Permission")
    }
    
    func getPermissionMainViewData() -> PermissionMainViewData {
        return PermissionMainViewData(image: PermissionImages.photos.value, labelData: LabelComponentData(title: "Photos Permission", subtitle: "Would you please give permission to access your photos."), actionModuleData: ActionModuleData(negativeButtonData: ActionButtonData(buttonText: "Not Now", buttonType: .outlined(.bright)), positiveButtonData: ActionButtonData(buttonText: "OK", buttonType: .filled(.bright))))
    }
    
    
}
