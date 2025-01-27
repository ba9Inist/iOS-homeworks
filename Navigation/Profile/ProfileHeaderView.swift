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
        
        let imgProfile: UIImageView = {
            let imageView = UIImageView(image: UIImage(resource: .avatarka))
            imageView.frame = CGRect(x: 16, y: 136, width: 128, height: 128)
            //imageView.autoSetDimensions(to: CGSize(width: 128.0, height: 128.0))
            imageView.layer.borderWidth = 3.0
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.cornerRadius = 64.0
            imageView.clipsToBounds = true
            return imageView
        }()
        
        let fullNameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            label.frame = CGRect(x: 170, y: 147, width: 200, height: 30)
            label.textColor = .black
            label.text = "Name Name"
            label.numberOfLines = 0

            return label
        }()
        
        let infoUser: UITextView = {
            let textInfo = UITextView()
            textInfo.frame = CGRect(x: 170, y: 200, width: 200, height: 30)
            textInfo.text = "Waiting for something..."
            textInfo.font = UIFont.systemFont(ofSize: 14)
            textInfo.textColor = .gray
            textInfo.backgroundColor = .lightGray
            return textInfo
        }()
        
        let buttonStatus: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemBlue
            button.setTitle("Snow status", for: .normal)
            button.frame = CGRect(x: 16, y: 280, width: 400, height: 50)
            button.layer.shadowOffset = CGSize(width: 4.00, height: 4.00)
            button.addTarget(self, action: #selector(printStatus(infoUser.text!)),  for: .touchUpInside)
            button.layer.shadowRadius = 4
            button.layer.cornerRadius = 4
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.7

            return button
        }()
                
        addSubview(imgProfile)
        addSubview(fullNameLabel)
        addSubview(buttonStatus)
        addSubview(infoUser)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func printStatus(_ textStatus: String) {
        print(textStatus)
   }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
