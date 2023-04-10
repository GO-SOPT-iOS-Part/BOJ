//
//  UITextField+.swift
//  32th-Go-SOPT-Seminar
//
//  Created by Joon Baek on 2023/04/07.
//

import UIKit

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
