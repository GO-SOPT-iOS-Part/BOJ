//
//  CustomButton.swift
//  32th-Go-SOPT-Seminar
//
//  Created by Joon Baek on 2023/04/11.
//

import UIKit
import SnapKit

class CustomButton: UIButton {
    
    init (title: String, radius: Int) {
        super.init(frame: .zero)
        setUI(title: title, radius: radius)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomButton {
    
    private func setUI(title: String, radius: Int) {
        backgroundColor = .tivingRed
        self.setTitle(title, for: .normal)
        self.setTitleColor(.w1, for: .normal)
        self.titleLabel?.font = .h3
        self.layer.cornerRadius = CGFloat(radius)
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(52)
        }
    }
}
