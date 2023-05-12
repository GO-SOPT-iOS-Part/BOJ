//
//  CollectionHeaderView.swift
//  Go-SOPT-WeatherApp
//
//  Created by Joon Baek on 2023/05/12.
//

import UIKit

import Kingfisher
import SnapKit

class CollectionHeaderView: UICollectionReusableView {
        
    static let identifier = "CollectionHeaderView"
    
    private let weatherImageView = UIImageView()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "29C"
        return label
    }()
    
    private let weatherStatusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "light rain"
        return label
    }()
    
    private let maxMinTempLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "최대: "
        return label
    }()
    
//    private let minimumTempLabel: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 14, weight: .regular)
//        label.text = "최소: "
//        return label
//    }()
    
    private let separationView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionHeaderView {
    
    //레이아웃 확인할것
    func layout() {
        [weatherImageView, tempLabel, weatherStatusLabel, maxMinTempLabel, separationView].forEach {
            addSubview($0)
        }
        
        weatherImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        
        tempLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        weatherStatusLabel.snp.makeConstraints {
            $0.top.equalTo(tempLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        maxMinTempLabel.snp.makeConstraints {
            $0.top.equalTo(weatherStatusLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        separationView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
