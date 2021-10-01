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
        return manager.getPermissionMainViewData(with: negativeListenerHandler, with: positiveListenerHandler)
    }
    
    lazy var negativeListenerHandler: VoidCompletionBlock = { [weak self] in
        print("Negative Pressed.")
    }
    
    lazy var positiveListenerHandler: VoidCompletionBlock = { [weak self] in
        print("Positive Pressed.")
    }
}
