//
//  PermissionMainViewData.swift
//  AppPermissions
//
//  Created by Bengi on 30.09.2021.
//

import Foundation
import UIKit

class PermissionMainViewData {
    
    private(set) var image: UIImage
    private(set) var labelData: LabelComponentData
    private(set) var actionModuleData: ActionModuleData
    
    init(image: UIImage, labelData: LabelComponentData, actionModuleData: ActionModuleData) {
        
        self.image = image
        self.labelData = labelData
        self.actionModuleData = actionModuleData
    }
    
}
