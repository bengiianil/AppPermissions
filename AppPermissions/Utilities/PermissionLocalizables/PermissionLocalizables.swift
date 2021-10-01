//
//  PermissionLocalizables.swift
//  AppPermissions
//
//  Created by Bengi on 1.10.2021.
//

import Foundation

enum PermissionLocalizables: String, GenericValueProtocol {
    
    typealias Value = String
    var value: String {
        return rawValue.toLocaliza()
    }
    
    case cameraPermissionTitle = "cameraPermissionTitle"
    case cameraPermissionSubTitle = "cameraPermissionSubTitle"
    case photosPermissionTitle = "photosPermissionTitle"
    case photosPermissionSubTitle = "photosPermissionSubTitle"
    case permissionOk = "permissionOk"
    case permissionNotNow = "permissionNotNow"
}
