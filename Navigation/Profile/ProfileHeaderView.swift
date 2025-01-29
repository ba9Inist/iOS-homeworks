//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Егор Голубев on 21.01.2025.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imgProfile)
        addSubview(fullNameLabel)
        addSubview(buttonStatus)
        addSubview(infoUser)
        addSubview(buttonTitle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        button.setTitle("Snow status", for: .normal)
        button.layer.shadowOffset = CGSize(width: 4.00, height: 4.00)
        button.layer.shadowRadius = 4
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7

        return button
    }()
    
    
    @objc func printStatus() {
        print("Status: \(infoUser.text!)")
   }
    
}
