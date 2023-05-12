//
//  TableViewCell.swift
//  Go-SOPT-WeatherApp
//
//  Created by Joon Baek on 2023/05/12.
//

import UIKit

import Kingfisher
import SnapKit

class TableViewCell: UITableViewCell {
    
    var imageURL: URL?
    
    static let identifier = "TableViewCell"
    
    let weatherImageView = UIImageView()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Seoul"
        return label
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "현재온도: "
        return label
    }()
    
    let humidLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "습도: "
        return label
    }()
    
    var city: String? {
        didSet {
            cityLabel.text = city
        }
    }
    
    var temperature: String? {
        didSet {
            tempLabel.text = "현재온도: \(temperature ?? "")"
        }
    }
    
    var humidity: String? {
        didSet {
            humidLabel.text = "습도: \(humidity ?? "")"
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        layout()
    }
}

extension TableViewCell {
    func layout() {
        
        [weatherImageView, cityLabel, tempLabel, humidLabel].forEach {
            contentView.addSubview($0)
        }
        
        weatherImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
        
        cityLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        tempLabel.snp.makeConstraints {
            $0.top.equalTo(cityLabel.snp.bottom).offset(5)
            $0.trailing.equalTo(cityLabel)
        }
        
        humidLabel.snp.makeConstraints {
            $0.top.equalTo(tempLabel.snp.bottom).offset(5)
            $0.trailing.equalTo(cityLabel)
        }
    }
    
    func loadImage() {
        guard let imageURL = imageURL else { return }
        
        weatherImageView.kf.setImage(with: imageURL)
    }
}
