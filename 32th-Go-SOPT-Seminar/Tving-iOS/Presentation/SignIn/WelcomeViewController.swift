//
//  WelcomeViewController.swift
//  32th-Go-SOPT-Seminar
//
//  Created by Joon Baek on 2023/04/11.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    private let tvingImage = UIImageView(image: ImageLiterals.Image.logo)
    private let welcomeLabel = UILabel()
    
    private lazy var toMainButton: CustomButton = {
        let button = CustomButton(title: "메인으로", radius: 3)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setlayout()
    }
}

extension WelcomeViewController {
    
    private func setlayout() {
        view.addSubviews(tvingImage, welcomeLabel, toMainButton)
        
        tvingImage.snp.remakeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(14)
            $0.centerX.leading.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(tvingImage.snp.bottom).offset(67)
            $0.centerX.equalToSuperview()
        }
        
        toMainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-66)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(convertByWidthRatio(335))
        }
    }
}
