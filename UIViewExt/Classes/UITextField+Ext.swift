//
//  File.swift
//  CitiFleet
//
//  Created by Nick Kibish on 2/22/16.
//  Copyright © 2016 Nick Kibish. All rights reserved.
//

import UIKit

public extension UITextField {
    public func setPlaceholder(font:UIFont, color:UIColor, text:String) {
        let attributes = [
            NSForegroundColorAttributeName: color,
            NSFontAttributeName : font
        ]
        self.attributedPlaceholder = NSAttributedString(string: text, attributes:attributes)
    }
}

public extension UISearchBar {
    public func setTextColor(color: UIColor) {
        for subView in subviews {
            for secondLevelSubview in subView.subviews {
                if secondLevelSubview.isKindOfClass(UITextField) {
                    let searchBarTextField = secondLevelSubview as! UITextField
                    searchBarTextField.textColor = color
                }
            }
        }
    }
}
