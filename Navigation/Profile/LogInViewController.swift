//
//  LogInViewController.swift
//  Navigation
//
//  Created by Егор Голубев on 03.02.2025.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
        return contentView
    }()
    
    
    private lazy var logoVK: UIImageView = {
        let logo = UIImageView(image: UIImage(resource: .logoVK))
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        return logo
    }()
    
    private lazy var telefonUser: UITextField = {
        let telefon = UITextField()
        telefon.translatesAutoresizingMaskIntoConstraints = false
        telefon.textColor = .black
        telefon.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        telefon.tintColor = .colorVK
        telefon.autocapitalizationType = .none
        telefon.backgroundColor = .systemGray6
        telefon.placeholder =  " Email or phone"
        telefon.keyboardType = UIKeyboardType.default
        telefon.returnKeyType = UIReturnKeyType.done
        telefon.clearButtonMode = UITextField.ViewMode.whileEditing
        telefon.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        telefon.delegate = self
        return telefon
    }()
    
    private lazy var passUser: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.textColor = .black
        password.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        password.tintColor = .colorVK
        password.autocapitalizationType = .none
        password.backgroundColor = .systemGray6
        password.placeholder =  " Password"
        password.isSecureTextEntry = true
        password.keyboardType = UIKeyboardType.default
        password.returnKeyType = UIReturnKeyType.done
        password.clearButtonMode = UITextField.ViewMode.whileEditing
        password.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        password.delegate = self
        return password
    }()
    
    private lazy var buttonLogin: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(windowProfileView), for: .touchUpInside)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10.0
        button.setBackgroundImage(UIImage(resource: .bluePixel), for: .normal)
        button.alpha = 1.0
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var separatorTextLabel: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .lightGray
        return separator
    }()
    
    private lazy var stackUI: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [telefonUser, passUser])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fillEqually
        stack.layer.cornerRadius = 10
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor.lightGray.cgColor
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubview()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardObservers()
    }
    
    private func addSubview() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoVK)
        contentView.addSubview(buttonLogin)
        contentView.addSubview(stackUI)
        stackUI.addSubview(telefonUser)
        stackUI.addSubview(passUser)
        stackUI.addSubview(separatorTextLabel)
        
    }
    
    private func setupConstraints(){
        
        let safeZone = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: safeZone.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeZone.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeZone.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeZone.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            logoVK.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoVK.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoVK.widthAnchor.constraint(equalToConstant: 100),
            logoVK.heightAnchor.constraint(equalToConstant: 100),
            
            buttonLogin.topAnchor.constraint(equalTo: passUser.bottomAnchor, constant: 16),
            buttonLogin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buttonLogin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buttonLogin.heightAnchor.constraint(equalToConstant: 50),
            
            stackUI.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackUI.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackUI.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            stackUI.heightAnchor.constraint(equalToConstant: 100),
            
            telefonUser.centerXAnchor.constraint(equalTo: stackUI.centerXAnchor),
            telefonUser.heightAnchor.constraint(equalToConstant: 50),
            
            separatorTextLabel.centerXAnchor.constraint(equalTo: stackUI.centerXAnchor),
            separatorTextLabel.heightAnchor.constraint(equalToConstant: 0.5),
            separatorTextLabel.centerYAnchor.constraint(equalTo: stackUI.centerYAnchor),
            separatorTextLabel.widthAnchor.constraint(equalTo: stackUI.widthAnchor, multiplier: 1),
            
            passUser.topAnchor.constraint(equalTo: telefonUser.bottomAnchor),
            passUser.heightAnchor.constraint(equalToConstant: 50),
            
            
        ])
    }
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc private func windowProfileView() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    private var originalContentInset: UIEdgeInsets = .zero
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        let keyboardHeight = keyboardFrame.height
        
        originalContentInset = scrollView.contentInset // Запоминаем текущие отступы
        
        scrollView.contentInset.bottom = keyboardHeight
        scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }
    
    
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
