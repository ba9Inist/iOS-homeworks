//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Егор Голубев on 21.01.2025.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let ProfileHeader: ProfileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        title = "Profile"
        self.view.addSubview(ProfileHeader)
        setupConstraints()

    }
    
    override func viewWillLayoutSubviews() {
        ProfileHeader.frame = view.frame
        
    }
    private func setupConstraints(){
        
        let safeZone = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            //Основная Вью
            
            ProfileHeader.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            ProfileHeader.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            ProfileHeader.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 0),
            ProfileHeader.heightAnchor.constraint(equalToConstant: 220),
            
            
            // Фото профиля
            
            //Высота объекта
            ProfileHeader.imgProfile.heightAnchor.constraint(equalToConstant: 128.00),
            
            //Длина объекта
            ProfileHeader.imgProfile.widthAnchor.constraint(equalToConstant: 128.00),
            
            //Горизонтальная линия по безопасной зоне
            //ProfileHeader.imgProfile.centerXAnchor.constraint(equalTo: safeZone.centerXAnchor),
            
              //Вертикальная линия по безопасной зоне
              //ProfileHeader.imgProfile.centerYAnchor.constraint(equalTo: safeZone.centerYAnchor,),
            
            //Отсуп слева
            ProfileHeader.imgProfile.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            
            //Отступ сверху от безопасной зоны
            ProfileHeader.imgProfile.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 16),
            
            
            //Имя профиля

            ProfileHeader.fullNameLabel.leftAnchor.constraint(equalTo: safeZone.leftAnchor, constant: 150),
            ProfileHeader.fullNameLabel.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 27),
            
            
            //Описание профиля
            
            ProfileHeader.infoUser.leftAnchor.constraint(equalTo: safeZone.leftAnchor, constant: 150),
            ProfileHeader.infoUser.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 100),
            
            
            //Кнопка статуса
            
            ProfileHeader.buttonStatus.leftAnchor.constraint(equalTo: safeZone.leftAnchor, constant: 16),
            ProfileHeader.buttonStatus.centerXAnchor.constraint(equalTo: safeZone.centerXAnchor),
            ProfileHeader.buttonStatus.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 160),
            
            //Кнопка заголовка
            
            ProfileHeader.buttonTitle.leftAnchor.constraint(equalTo: safeZone.leftAnchor, constant: 0),
            ProfileHeader.buttonTitle.rightAnchor.constraint(equalTo: safeZone.rightAnchor, constant: 0),
            ProfileHeader.buttonTitle.bottomAnchor.constraint(equalTo: safeZone.bottomAnchor, constant: -16)
            
            
        ])
    }
}
