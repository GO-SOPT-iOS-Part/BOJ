//
//  DetailViewController.swift
//  Go-SOPT-WeatherApp
//
//  Created by Joon Baek on 2023/05/12.
//

import UIKit

import Alamofire
import SnapKit

class DetailViewController: UIViewController {
    
    var selectedCityName: String?
    
    var rowData: [String: String]?
    var headerData: [[String: String]] = []
    var data: [[String: String]] = []
    
    let titleLabelNames: [String] = ["체감온도", "습도", "압력", "바람"]
    let contents: [String] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .clear
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
        
        register()
        configDelegate()
        layout()
        fetchCityWeatherData(for: selectedCity)
    }
}

extension DetailViewController {
    
    func register() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionHeaderView")
    }
    
    func configDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func layout() {
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview()
        }
    }
    
    func fetchCityWeatherData(for city: String) {
        WeatherService.shared.fetchWeatherData(of: city) { response in
            switch response {
            case .success(let data):
                guard let weathers = data as? Weathers else { return }
                dump(weathers)

                DispatchQueue.main.async {
                                self.navigationItem.title = weathers.name
                            }
                
                let headerData = [
                    "city": weathers.name,
                    "imageURL": weathers.weather.first?.icon ?? "",
                    "temperature": "\(weathers.main.temp)°C",
                    "description": "\(weathers.weather.description)",
                    "maxMin": "최대: \(weathers.main.temp_max)°C 최소: \(weathers.main.temp_min)°C",
                ]

                let collectionViewData = [
                    "feelsLike": "\(weathers.main.feels_like)°C",
                    "humidity": "\(weathers.main.humidity)%",
                    "pressure": "\(weathers.main.pressure)hpa",
                    "speed": "\(weathers.wind.speed)"
                ]

                //                    self.data.append(headerData)
                self.data.append(collectionViewData)

                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }

            default:
                return
            }
        }
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: (screenWidth - 15) / 2 , height: (screenWidth - 15) / 2 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    // header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let headerSize = CGSize(width: collectionView.bounds.width, height: 250)
        return headerSize
    }
    
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
                return UICollectionViewCell() }
            
            let titleLabel = titleLabelNames[indexPath.item]
            
            let collectionViewData =
            
            cell.title = titleLabelNames[indexPath.item]
//            cell.content = collectionViewData["content"]
            
            return cell
        }

    
    // header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionHeaderView", for: indexPath) as? CollectionHeaderView else { return UICollectionReusableView() }
        
        return header
    }
}



