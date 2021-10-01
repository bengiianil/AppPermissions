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
    
    func getPermissionMainViewData(with negativeListener: @escaping VoidCompletionBlock, with positiveListener: @escaping VoidCompletionBlock) -> PermissionMainViewData {
        return PermissionMainViewData(
            image: PermissionImages.photos.value,
            labelData: LabelComponentData(
                title: PermissionLocalizables.photosPermissionTitle.value,
                subtitle: PermissionLocalizables.photosPermissionSubTitle.value),
            actionModuleData: ActionModuleData(
                negativeButtonData: ActionButtonData(
                    buttonText: PermissionLocalizables.permissionNotNow.value,
                    buttonType: .outlined(.bright)).setActionButtonListener(by: negativeListener),
                positiveButtonData: ActionButtonData(
                    buttonText: PermissionLocalizables.permissionNotNow.value,
                    buttonType: .filled(.bright)).setActionButtonListener(by: positiveListener)))
    }
    
}
