//
//  PermissionViewFactory.swift
//  AppPermissions
//
//  Created by Bengi on 1.10.2021.
//

import Foundation

class PermissionViewFactory {
    
    class func getManager(with type: PermissionType) -> PermissionManagerProtocol {
        switch type {
        case .camera:
            return CameraPermissionManager()
        case .photos:
            return PhotosPermissionManager()
        }
    }
}
