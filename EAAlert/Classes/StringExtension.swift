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
    
    func getEstimatedFrame(_ font: UIFont) -> CGRect {
        let fontSize = font.pointSize
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: self).boundingRect(with: CGSize(width: UIScreen.main.bounds.size.width-100, height: UIScreen.main.bounds.size.height-100), options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize+2)], context: nil)
    }
    
}
