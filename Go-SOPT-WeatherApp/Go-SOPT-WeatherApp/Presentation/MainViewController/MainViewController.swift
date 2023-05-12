//
//  MainViewController.swift
//  Go-SOPT-WeatherApp
//
//  Created by Joon Baek on 2023/05/12.
//

import UIKit

import Alamofire
import SnapKit

class MainViewController: UIViewController {
    
    var data: [[String: String]] = []
    
    let tableView = UITableView()
    
    let cities = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
    
    var isSelected: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "날씨"
        
        register()
        configDelegate()
        layout()
        fetchWeather(for: cities)
    }
}

extension MainViewController {
    
    func register() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    func configDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func layout() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func fetchWeather(for cities: [String]) {
        for city in cities {
            WeatherService.shared.fetchWeatherData(of: city) { response in
                switch response {
                case .success(let data):
                    guard let weathers = data as? Weathers else { return }
                    dump(weathers)
                    
                    let rowData = [
                      "city": weathers.name,
                      "temperature": "\(weathers.main.temp)°C",
                      "humidity": "\(weathers.main.humidity)%",
                      "imageURL": weathers.weather.first?.icon ?? ""
                    ]

                    self.data.append(rowData)

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }

                default:
                    return
                }
            }
        }
    }
}

extension MainViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailVC = DetailViewController()
//        detailVC.rowData = data[indexPath.row]
//        navigationController?.pushViewController(detailVC, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath) as! TableViewCell
        let selectedCityName = selectedCell.cityLabel.text
        
        let detailVC = DetailViewController()
        detailVC.selectedCityName = selectedCityName
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

extension MainViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        let rowData = data[indexPath.row]
        
        cell.city = rowData["city"]
        cell.temperature = rowData["temperature"]
        cell.humidity = rowData["humidity"]
        if let imageURL = rowData["imageURL"] {
            cell.weatherImageView.getImageFromURL(imageURL)
        }
        
        return cell
    }
}
