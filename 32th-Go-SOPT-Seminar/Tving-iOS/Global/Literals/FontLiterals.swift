//
//  FontLiterals.swift
//  32th-Go-SOPT-Seminar
//
//  Created by Joon Baek on 2023/04/11.
//

import UIKit

extension UIFont {
    @nonobjc class var h1: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 23)
    }
    
    @nonobjc class var h2: UIFont {
        return UIFont.font(.pretendardMedium, ofSize: 23)
    }
    
    @nonobjc class var h3: UIFont {
        return UIFont.font(.pretendardSemiBold, ofSize: 14)
    }
    
    @nonobjc class var b1: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 14)
    }
}

enum FontName: String {
    case pretendardBold = "Pretendard-Bold"
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
