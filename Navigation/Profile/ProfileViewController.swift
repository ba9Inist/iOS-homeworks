//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Егор Голубев on 21.01.2025.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeader: ProfileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        title = "Profile"
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(profileHeader)
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
            
        ])
    }
}
