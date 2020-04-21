//
//  StringExtension.swift
//  EAAlert
//
//  Created by Emre AYDIN on 14.01.2020.
//  Copyright © 2019 Emre AYDIN. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func getHeight(_ width: CGFloat, _ font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
}
