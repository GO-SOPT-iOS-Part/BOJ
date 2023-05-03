//
//  ColorLiterals.swift
//  32th-Go-SOPT-Seminar
//
//  Created by Joon Baek on 2023/04/11.
//

import UIKit

extension UIColor {
    static var w1: UIColor {
        return UIColor(hex: "#FFFFFF")
    }
    
    static var b1: UIColor {
        return UIColor(hex: "#000000" )
    }
    
    static var r1: UIColor {
        return UIColor(hex: "#FF143C" )
    }
    
    static var g1: UIColor {
        return UIColor(hex: "#D6D6D6" )
    }
    
    static var g2: UIColor {
        return UIColor(hex: "#9C9C9C" )
    }
    
    static var g3: UIColor {
        return UIColor(hex: "#626262" )
    }
    
    static var g4: UIColor {
        return UIColor(hex: "#2E2E2E" )
    }
    
    static var tivingRed: UIColor {
        return UIColor(hex: "#FF143C")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
