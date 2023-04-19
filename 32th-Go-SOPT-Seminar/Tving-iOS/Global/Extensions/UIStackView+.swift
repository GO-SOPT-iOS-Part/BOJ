//
//  UIStackView+.swift
//  32th-Go-SOPT-Seminar
//
//  Created by Joon Baek on 2023/04/11.
//

import UIKit

extension UIStackView {
    
     func addArrangedSubviews(_ views: UIView...) {
         for view in views {
             self.addArrangedSubview(view)
         }
     }
}
