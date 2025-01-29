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
    }
    
    override func viewWillLayoutSubviews() {
        ProfileHeader.frame = view.frame
        
    }
    
}
