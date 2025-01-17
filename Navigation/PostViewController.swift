//
//  PostViewController.swift
//  Navigation
//
//  Created by Егор Голубев on 15.01.2025.
//

import UIKit

struct Post {
    let title: String
}

class PostViewController: UIViewController {
    
    var post: Post
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .cyan
        title = post.title
        
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(OpenInfo))
        
        navigationItem.rightBarButtonItem = myButton
        
    }
    
    @objc func OpenInfo() {
        let Info = Info(title: "Модальное открытие")
        
        let openView = InfoViewController(Info: Info)
        
        self.present(openView, animated: true, completion: nil)
    }
}


