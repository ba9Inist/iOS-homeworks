//
//  FeedViewController.swift
//  Navigation
//
//  Created by Егор Голубев on 15.01.2025.
//

import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jumpButton = UIButton(type: .system)
        jumpButton.setTitle("Переход на другую страницу", for: .normal)
        jumpButton.addTarget(self, action: #selector(OpenPost), for: .touchUpInside)
        jumpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(jumpButton)
        
        NSLayoutConstraint.activate([
            jumpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            jumpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
        
        
    }
    
    @objc func OpenPost() {
        let post = Post(title: "New post")
        
        let openView = PostViewController(post: post)
        
        navigationController?.pushViewController(openView, animated: true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
