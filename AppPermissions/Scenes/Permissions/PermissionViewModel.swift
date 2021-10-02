//
//  PermissionViewModel.swift
//  AppPermissions
//
//  Created by Bengi on 1.10.2021.
//

import Foundation

class PermissionViewModel {
    
    private let manager: PermissionManagerProtocol
    private var permissionViewDismissActionBlock: VoidCompletionBlock?
    
    init(manager: PermissionManagerProtocol) {
        self.manager = manager
    }
    
    func listenManagerAction(with completion: @escaping VoidCompletionBlock) {
        permissionViewDismissActionBlock = completion
    }
    
    func getPermissionMainViewData() -> PermissionMainViewData {
        return manager.getPermissionMainViewData(with: negativeListenerHandler, with: positiveListenerHandler)
    }
    
    lazy var negativeListenerHandler: VoidCompletionBlock = { [weak self] in
        print("Negative Pressed.")
        
        // permissionViewDismissActionBlock is fired, we need self because its into the closure
        self?.permissionViewDismissActionBlock?()
    }
    
    lazy var positiveListenerHandler: VoidCompletionBlock = { [weak self] in
        print("Positive Pressed.")
    }
}
