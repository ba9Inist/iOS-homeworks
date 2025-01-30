//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Егор Голубев on 21.01.2025.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let imgProfile: UIImageView = {
        let imageView = UIImageView(image: UIImage(resource: .avatarka))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 64.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Name Name"
        label.numberOfLines = 0

        return label
    }()
    
    let infoUser: UILabel = {
        let textInfo = UILabel()
        textInfo.translatesAutoresizingMaskIntoConstraints = false
        textInfo.text = "Waiting for something..."
        textInfo.font = UIFont.systemFont(ofSize: 14)
        textInfo.textColor = .gray
        textInfo.backgroundColor = .lightGray
        return textInfo
    }()
    
    lazy var buttonStatus: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Snow status", for: .normal)
        button.layer.shadowOffset = CGSize(width: 4.00, height: 4.00)
        button.addTarget(self, action: #selector(printStatus),  for: .touchUpInside)
        button.layer.shadowRadius = 4
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7

        return button
    }()
    
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imgProfile)
        addSubview(fullNameLabel)
        addSubview(buttonStatus)
        addSubview(infoUser)
        addSubview(buttonTitle)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func printStatus() {
        print("Status: \(infoUser.text!)")
   }
    
    private func setupConstraints(){
        
        let safeZone = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            // Фото профиля
            
            //Высота объекта
            imgProfile.heightAnchor.constraint(equalToConstant: 128.00),
            
            //Длина объекта
            imgProfile.widthAnchor.constraint(equalToConstant: 128.00),
            
            //Горизонтальная линия по безопасной зоне
            //ProfileHeader.imgProfile.centerXAnchor.constraint(equalTo: safeZone.centerXAnchor),
            
              //Вертикальная линия по безопасной зоне
              //ProfileHeader.imgProfile.centerYAnchor.constraint(equalTo: safeZone.centerYAnchor,),
            
            //Отсуп слева
            imgProfile.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            
            //Отступ сверху от безопасной зоны
            imgProfile.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 16),
            
            
            //Имя профиля

            fullNameLabel.leftAnchor.constraint(equalTo: safeZone.leftAnchor, constant: 150),
            fullNameLabel.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 27),


            //Описание профиля

            infoUser.leftAnchor.constraint(equalTo: safeZone.leftAnchor, constant: 150),
            infoUser.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 100),


            //Кнопка статуса

            buttonStatus.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 160),
            buttonStatus.leftAnchor.constraint(equalTo: safeZone.leftAnchor, constant: 16),
            buttonStatus.centerXAnchor.constraint(equalTo: safeZone.centerXAnchor),

            
            //Кнопка заголовка

            buttonTitle.leftAnchor.constraint(equalTo: safeZone.leftAnchor, constant: 0),
            buttonTitle.rightAnchor.constraint(equalTo: safeZone.rightAnchor, constant: 0),
            buttonTitle.bottomAnchor.constraint(equalTo: safeZone.bottomAnchor, constant: 32)
        
            
        ])
    }

    
    
}
