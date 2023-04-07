//
//  FirstViewController.swift
//  32th-Go-SOPT-Seminar
//
//  Created by Joon Baek on 2023/04/01.
//

import UIKit

final class FirstViewController: UIViewController {
    
    // MARK: - UI Compoents
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요?"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .systemPurple
        label.textAlignment = .center
        return label
    }()

    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.backgroundColor = .systemPurple
        button.setTitleColor(.systemGreen, for: .normal)
        button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("Push", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.systemPurple, for: .normal)
        button.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please write your name"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.clearButtonMode = .whileEditing
        textField.layer.cornerRadius = 5
        textField.addLeftPadding()
        return textField
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()

    }
}

//MARK: - Extensions

private extension FirstViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, nameTextField,
         presentButton, pushButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
 //MARK: - Action Helpers
    
    func presentToSecondViewController() {
        
        let secondViewController = SecondViewController_1st_Seminar()
        guard let name = nameTextField.text else { return }
        secondViewController.name = name
        secondViewController.modalPresentationStyle = .automatic
        secondViewController.modalTransitionStyle = .coverVertical
        self.present(secondViewController, animated: true)
    }
    
    func pushToSecondViewController() {
        
        let secondViewController = SecondViewController_1st_Seminar()
        guard let name = nameTextField.text else { return }
        secondViewController.name = name
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
   //MARK: - objc
    
    @objc
    func presentButtonTapped() {
        
        presentToSecondViewController()
    }
    
    @objc
    func pushButtonTapped() {
        
        pushToSecondViewController()
    }
}
