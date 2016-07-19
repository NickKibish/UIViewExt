//
//  UIView+Ext.swift
//  CitiFleet
//
//  Created by Nick Kibish on 2/23/16.
//  Copyright © 2016 Nick Kibish. All rights reserved.
//

import UIKit

public enum BorderPosition {
    case Left
    case Right
    case Top
    case Bottom
}

public extension UIView {
     public @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    public @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    public @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor != nil ? UIColor(CGColor: layer.borderColor!) : nil
        }
        set {
            layer.borderColor = newValue?.CGColor
        }
    }
    
    public func setDefaultShadow() {
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.masksToBounds = false
    }
    
    public func addBorders(borderWidth:CGFloat, positions:[BorderPosition], color:UIColor) {
        for position in positions {
            addBorder(borderWidth, position: position, color: color)
        }
    }
    
    public func addBorder(borderWidth:CGFloat, position:BorderPosition, color:UIColor) {
        let layer = CALayer()
        layer.backgroundColor = color.CGColor
        var layerFrame: CGRect
        let size = self.frame.size
        
        switch position {
        case .Top:
            layerFrame = CGRectMake(0, 0, size.width, borderWidth)
        case .Bottom:
            layerFrame = CGRectMake(0, size.height - borderWidth, size.width, borderWidth)
        case .Left:
            layerFrame = CGRectMake(0, 0, borderWidth, size.height)
        case .Right:
            layerFrame = CGRectMake(size.width - borderWidth, 0, borderWidth, size.height)
        }
        
        layer.frame = layerFrame
        self.layer.addSublayer(layer)
    }
    
    
}