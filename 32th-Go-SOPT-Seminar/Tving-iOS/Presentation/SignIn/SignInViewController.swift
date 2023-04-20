//
//  SignInViewController.swift
//  32th-Go-SOPT-Seminar
//
//  Created by Joon Baek on 2023/04/11.
//

import UIKit

final class SignInViewController: UIViewController {
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_before"), for: .normal)
        return button
    }()

    private let loginLabel: UILabel = {
        let label = UILabel()
        label.font = .h2
        label.textColor = .g1
        label.text = "TVING ID 로그인"
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .g4
        textField.layer.cornerRadius = 3
        textField.addLeftPadding(width: 22)
        textField.setPlaceholderColor(.g2)
        textField.font = .h3
        textField.textColor = .g2
        textField.placeholder = "아이디"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .g4
        textField.layer.cornerRadius = 3
        textField.addLeftPadding(width: 22)
        textField.setPlaceholderColor(.g2)
        textField.font = .h3
        textField.textColor = .g2
        textField.placeholder = "비밀번호"
        
        return textField
    }()
    
    private lazy var signInButton: CustomButton = {
        let button = CustomButton(title: "로그인하기", radius: 3)
//        button.addTarget(<#T##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        return button
    }()
    
    private var findStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 33
        return stackView
    }()
    
    private lazy var findIdButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.g2, for: .normal)
        button.titleLabel?.font = .h3
        button.setTitle("아이디 찾기", for: .normal)
        return button
    }()
    
    private lazy var findPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.g2, for: .normal)
        button.titleLabel?.font = .h3
        button.setTitle("비밀번호 찾기", for: .normal)
        return button
    }()
    
    private lazy var makeNicknameButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.g2, for: .normal)
        button.titleLabel?.font = .b1
        button.setTitle("닉네임 만들러가기", for: .normal)
        button.setUnderline()
        button.addTarget(self, action: #selector(nicknameButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let askLabel: UILabel = {
        let label = UILabel()
        label.font = .b1
        label.textColor = .g3
        label.text = "아직 계정이 없으신가요?"
        return label
    }()
    
    private let separationBar: UIView = {
        let view = UIView()
        view.backgroundColor = .g2
        return view
    }()
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

            setUI()
            setLayout()
    }
}

// MARK: - Extensions

extension SignInViewController {
    
    private func setUI() {
        view.backgroundColor = .black
    }
    
    private func setLayout() {
        view.addSubviews(
            backButton,
            loginLabel,
            idTextField,
            passwordTextField,
            signInButton,
            findStackView,
            askLabel,
            makeNicknameButton
        )
        
        findStackView.addArrangedSubviews(findIdButton, separationBar, findPasswordButton)
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            $0.leading.equalToSuperview().offset(24)
        }
        
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(31)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(convertByHeightRatio(52))
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.centerX.leading.height.equalTo(idTextField)
        }
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.centerX.leading.equalTo(idTextField)
        }
        
        findStackView.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(31)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(92)
            $0.height.equalTo(convertByHeightRatio(22))
        }
        
        separationBar.snp.makeConstraints {
            $0.height.equalTo(12)
            $0.width.equalTo(1)
        }
        
        askLabel.snp.makeConstraints {
            $0.top.equalTo(findStackView.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(51)
        }
        
        makeNicknameButton.snp.makeConstraints {
            $0.centerY.equalTo(askLabel)
            $0.trailing.equalToSuperview().offset(-50)
            $0.width.equalTo(convertByWidthRatio(128))
        }
    }
    
    //MARK: - Config
    
    private func setConfigDelegate() {
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func config() {
        passwordTextField.rightView = passwordIconStackView
        passwordTextField.rightViewMode = .always
    }
    
    //MARK: - Action
    
    private func pushToWelcomeViewController() {
        
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .fullScreen
        self.present(welcomeViewController, animated: true)
        
    }
    
    private func showBottomSheet() {
        let bottomSheetViewController = NicknameBottomSheetViewController()
        bottomSheetViewController.modalPresentationStyle = .custom
        bottomSheetViewController.transitioningDelegate = self
        present(bottomSheetViewController, animated: true, completion: nil)
    }
    
    func setTextFieldBorderColor(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.g2.cgColor
    }
    
    //MARK: - @Objc
    
    @objc
    private func loginButtonTapped() {
        pushToWelcomeViewController()
    }
    
    @objc
    private func nicknameButtonTapped() {
        showBottomSheet()
    }
}

extension SignInViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if idTextField.isEditing {
            setTextFieldBorderColor(idTextField)
        } else {
            setTextFieldBorderColor(passwordTextField)
        }
    }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            
            textField.layer.borderWidth = 0
        }
        
    }
    
    extension SignInViewController: UIViewControllerTransitioningDelegate {
        
        func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
            return CustomPresentationController(presentedViewController: presented, presenting: presenting)
        }
    }
    
