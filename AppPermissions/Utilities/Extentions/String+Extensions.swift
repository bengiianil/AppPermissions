//
//  String+Extensions.swift
//  AppPermissions
//
//  Created by Bengi on 1.10.2021.
//

import Foundation

extension String {
    
    func toLocaliza() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
