//
//  SignInViewController.swift
//  32th-Go-SOPT-Seminar
//
//  Created by Joon Baek on 2023/04/11.
//

import UIKit

final class SignInViewController: UIViewController {
    
    //MARK: - Variables
    
    var isSecureTextEntry = true
    
    //MARK: - UI Components
    
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
        textField.layer.borderWidth = 1
        textField.placeholder = "아이디"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .g4
        textField.layer.cornerRadius = 3
        textField.addLeftPadding(width: 22)
        textField.font = .h3
        textField.textColor = .g2
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        textField.placeholder = "비밀번호"
        return textField
    }()
    
    private lazy var signInButton: CustomButton = {
        let button = CustomButton(title: "로그인하기", radius: 3)
        button.isEnabled = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.backgroundColor = .clear
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
    
    private var passwordIconStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 14)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private lazy var idClearButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Icn.clear, for: .normal)
        button.addTarget(self, action: #selector(idClearButtonTapped), for: .touchUpInside)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        return button
    }()
    
    private lazy var clearButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Icn.clear, for: .normal)
        button.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var securityButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Icn.securityOn, for: .normal)
        button.addTarget(self, action: #selector(securityButtonTapped) , for: .touchUpInside)
        return button
    }()
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setConfigDelegate()
    }
}

// MARK: - Extensions

extension SignInViewController {
    
    private func setUI() {
        view.backgroundColor = .black
        
        setButtonBorderColor(signInButton)
        idTextField.setPlaceholderColor(.g2)
        passwordTextField.setPlaceholderColor(.g2)
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
        
        passwordIconStackView.addArrangedSubviews(clearButton, securityButton)
        
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
    
    private func showIdFieldIcons() {
        idTextField.rightView = idClearButton
        idTextField.rightViewMode = .always
    }
    
    private func showPasswordFieldIcons() {
        passwordTextField.rightView = passwordIconStackView
        passwordTextField.rightViewMode = .always
    }
    
    private func setTextFieldBorderColor(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.g2.cgColor
    }
    
    private func setButtonBorderColor(_ button: CustomButton) {
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.g4.cgColor
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
    
    private func clearTexts(_ textField: UITextField) {
        textField.text = ""
    }
    
    private func securityToggle() {
        isSecureTextEntry.toggle()
        passwordTextField.isSecureTextEntry = isSecureTextEntry
    }
    
    private func handleSignInButton() {
        if let id = idTextField.text, let password = passwordTextField.text,
           !id.isEmpty && !password.isEmpty {
            signInButton.layer.borderWidth = 0
            signInButton.backgroundColor = .tivingRed
            signInButton.isEnabled = true
        } else {
            signInButton.isEnabled = false
            setButtonBorderColor(signInButton)
        }
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
    
    @objc
    private func idClearButtonTapped() {
        clearTexts(idTextField)
    }
    
    @objc
    private func clearButtonTapped() {
        clearTexts(passwordTextField)
    }
    
    @objc
    private func securityButtonTapped() {
        securityToggle()
    }
}

//MARK: - UITextFieldDelegate
extension SignInViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTextField {
            setTextFieldBorderColor(idTextField)
        } else {
            setTextFieldBorderColor(passwordTextField)
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let id = idTextField.text, !id.isEmpty {
            showIdFieldIcons()
        } else {
            idTextField.rightViewMode = .never
        }
        
        if let password = passwordTextField.text, !password.isEmpty {
            showPasswordFieldIcons()
        } else {
            passwordTextField.rightViewMode = .never
        }
        
        handleSignInButton()

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

