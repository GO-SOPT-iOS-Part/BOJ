//
//  AutoLayoutFirstViewController.swift
//  32th-Go-SOPT-Seminar
//
//  Created by Joon Baek on 2023/04/08.
//

import UIKit

import SnapKit

final class AutoLayoutFirstViewController: UIViewController {
    
    private let pushLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "조금만 더 눌러봐"
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("다음으로!", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layout()
    }
}

extension AutoLayoutFirstViewController {
    private func layout() {
        [pushLabel, button].forEach {
            view.addSubview($0)
        }
        
        pushLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(pushLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
            $0.height.equalTo(60)
        }
    }
}
