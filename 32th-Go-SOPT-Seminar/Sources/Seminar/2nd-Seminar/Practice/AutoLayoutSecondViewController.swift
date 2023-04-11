//
//  AutoLayoutSecondViewController.swift
//  32th-Go-SOPT-Seminar
//
//  Created by Joon Baek on 2023/04/08.
//

import UIKit

import SnapKit

final class AutoLayoutSecondViewController: UIViewController {
    
    private lazy var hitButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전으로", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전으로", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension AutoLayoutSecondViewController {
    
    private func layout() {
        [hitButton, dismissButton].forEach {
            view.addSubview($0)
            
            hitButton.snp.makeConstraints( {
                $0.centerX.equalToSuperview()
                $0.leading.equalToSuperview().offset(250)
            })
        }
        
    }
    
}
