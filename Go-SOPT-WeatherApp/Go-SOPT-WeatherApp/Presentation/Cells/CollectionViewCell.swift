//
//  CollectionViewCell.swift
//  Go-SOPT-WeatherApp
//
//  Created by Joon Baek on 2023/05/12.
//

import UIKit

import Kingfisher
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.text = "체감온도"
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "293.52"
        return label
    }()
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var content: String? {
        didSet {
            contentLabel.text = content
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionViewCell {
    
    func  style() {
        contentView.backgroundColor = .lightGray
    }
    
    func layout() {
        
        [titleLabel, contentLabel].forEach {
            contentView.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(10)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(titleLabel)
        }
    }
}
