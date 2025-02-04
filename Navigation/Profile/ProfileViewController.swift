//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Егор Голубев on 21.01.2025.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeader: ProfileHeaderView = ProfileHeaderView()
    
    lazy var buttonTitle: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Button title", for: .normal)
        button.layer.shadowOffset = CGSize(width: 4.00, height: 4.00)
        button.layer.shadowRadius = 4
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        title = "Profile"
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(profileHeader)
        self.view.addSubview(buttonTitle)
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        
        let safeZone = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            //Основная Вью
            
            profileHeader.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            profileHeader.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            profileHeader.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 0),
            profileHeader.heightAnchor.constraint(equalToConstant: 220),
            
            //Кнопка заголовка
            
            buttonTitle.leftAnchor.constraint(equalTo: safeZone.leftAnchor, constant: 0),
            buttonTitle.rightAnchor.constraint(equalTo: safeZone.rightAnchor, constant: 0),
            buttonTitle.bottomAnchor.constraint(equalTo: safeZone.bottomAnchor, constant: -16)
            
        ])
    }
}
