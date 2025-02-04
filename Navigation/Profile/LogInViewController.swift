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
        scrollView.backgroundColor = .red
        
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
        telefon.layer.borderWidth = 0.5
        telefon.layer.borderColor = UIColor.lightGray.cgColor
        telefon.layer.cornerRadius = 10.0 / 2.0
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
        password.layer.borderWidth = 0.5
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.cornerRadius = 10.0 / 2.0
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
        return button
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
        contentView.addSubview(telefonUser)
        contentView.addSubview(passUser)
        contentView.addSubview(buttonLogin)

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
            
            telefonUser.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            telefonUser.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            telefonUser.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            telefonUser.heightAnchor.constraint(equalToConstant: 50),
            
            passUser.topAnchor.constraint(equalTo: telefonUser.bottomAnchor),
            passUser.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passUser.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passUser.heightAnchor.constraint(equalToConstant: 50),

            buttonLogin.topAnchor.constraint(equalTo: passUser.bottomAnchor, constant: 16),
            buttonLogin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buttonLogin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buttonLogin.heightAnchor.constraint(equalToConstant: 50),
            
            
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
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
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
