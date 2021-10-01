//
//  PermissionViewModel.swift
//  AppPermissions
//
//  Created by Bengi on 1.10.2021.
//

import Foundation

class PermissionViewModel {
    
    private let manager: PermissionManagerProtocol
    
    init(manager: PermissionManagerProtocol) {
        self.manager = manager
    }
    
    func getPermissionMainViewData() -> PermissionMainViewData {
        return manager.getPermissionMainViewData()
    }
}
