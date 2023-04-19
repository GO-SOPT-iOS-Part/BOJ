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
    
    private let nickNameLabel: UILabel = {
        let label = UILabel()
        label.font = .h2
        label.text = "닉네임을 입력해주세요"
        return label
    }()
    
    private let nickNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .g2
        textField.layer.cornerRadius = 3
        textField.addLeftPadding(width: 22)
        textField.font = .b1
        textField.textColor = .b1
        return textField
    }()
    
    private lazy var saveButton: CustomButton = {
        let button = CustomButton(title: "저장하기", radius: 12)
        return button
    }()
    
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
        contentView.roundCorners(cornerRadius: 25, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    
    private func setLayout() {
        view.addSubview(contentView)
        
        contentView.addSubviews(nickNameLabel, nickNameTextField, saveButton)
        
        contentView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo((getDeviceHeight()) / 2)
        }
        
        nickNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(20)
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(nickNameLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(nickNameLabel)
            $0.height.equalTo(convertByHeightRatio(52))
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-5)
            $0.centerX.leading.height.equalTo(nickNameTextField)
        }
    }
}
