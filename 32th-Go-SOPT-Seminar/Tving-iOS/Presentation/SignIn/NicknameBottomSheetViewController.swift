//
//  CustomBottomSheetViewController.swift
//  32th-Go-SOPT-Seminar
//
//  Created by Joon Baek on 2023/04/19.
//

import UIKit
import SnapKit

class NicknameBottomSheetViewController: UIViewController {
    
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
}

extension NicknameBottomSheetViewController {
    
    private func setUI() {
        view.backgroundColor = .clear
        contentView.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubview(contentView)
        
        contentView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo((getDeviceHeight()) / 2)
        }
    }
}
