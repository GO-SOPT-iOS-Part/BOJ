//
//  AutoLayoutPracticeViewController.swift
//  32th-Go-SOPT-Seminar
//
//  Created by Joon Baek on 2023/04/10.
//

import UIKit

final class AutoLayoutPracticeViewController: UIViewController {

    private let firstView = UIView()
    private let secondView = UIView()
    private let thirdView = UIView()
    private let fourthView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}

extension AutoLayoutPracticeViewController {
    
    private func style() {
        firstView.backgroundColor = .systemYellow
        secondView.backgroundColor = .systemGreen
        thirdView.backgroundColor = .black
        fourthView.backgroundColor = .systemBlue
    }
    
    private func setLayout() {
        view.backgroundColor = .white
        
        [firstView, secondView, thirdView, fourthView].forEach {
            view.addSubview($0)
        }
        
        firstView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width/2)
            $0.height.equalTo(UIScreen.main.bounds.height/4)
        }
        
        secondView.snp.makeConstraints {
            $0.top.equalTo(firstView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.width.height.equalTo(firstView)
        }
        
        thirdView.snp.makeConstraints {
            $0.top.equalTo(secondView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(firstView)
        }
        
        fourthView.snp.makeConstraints {
            $0.top.equalTo(thirdView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.width.height.equalTo(firstView)
        }
    }
}
