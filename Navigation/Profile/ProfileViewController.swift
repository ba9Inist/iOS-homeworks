//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Егор Голубев on 21.01.2025.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        title = "Profile"
        self.view.addSubview(ProfileHeader)
        self.view.addSubview(ProfileHeader.imgProfile)
        self.view.addSubview(ProfileHeader.fullNameLabel)
        self.view.addSubview(ProfileHeader.buttonStatus)
        self.view.addSubview(ProfileHeader.infoUser)
        
        ProfileHeader.buttonStatus.addTarget(self, action: #selector(printStatus), for: .touchUpInside)
        
    }
    
    override func viewWillLayoutSubviews() {
        ProfileHeader.frame = view.frame
        
    }
    
    let ProfileHeader: ProfileHeaderView = ProfileHeaderView()
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @objc func printStatus() {
        
        print(ProfileHeader.infoUser.text!)
        
    }
}
