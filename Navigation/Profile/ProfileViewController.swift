//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Егор Голубев on 21.01.2025.
//

import UIKit
import StorageService
class ProfileViewController: UIViewController {
    
    let profileHeader: ProfileHeaderView = ProfileHeaderView()
    
    fileprivate let posts = postProfile.make()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150.00
        tableView.tableFooterView = UIView()
        tableView.register(
            CustomTableViewCell.self,
            forCellReuseIdentifier: "CustomTableViewCell_ReuseID"
        )
        tableView.register(
            UITableViewHeaderFooterView.self,
            forHeaderFooterViewReuseIdentifier: "CustomTableViewCell_ReuseID"
        )
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
        self.view.backgroundColor = .lightGray
        #else
        self.view.backgroundColor = .blue
        #endif
        
        title = "Profile"
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
        setupConstraints()
        
    }
    
    private func addSubviews(){
        view.addSubview(profileHeader)
        //view.addSubview(buttonTitle)
        view.addSubview(tableView)
    }
    
    private func setupConstraints(){
        
        let safeZone = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            //Основная Вью
            
            profileHeader.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            profileHeader.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            profileHeader.topAnchor.constraint(equalTo: safeZone.topAnchor, constant: 0),
            profileHeader.heightAnchor.constraint(equalToConstant: 220),
            
            tableView.topAnchor.constraint(equalTo: profileHeader.bottomAnchor, constant: 16),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Возвращаем количество строк в секции
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Создаем и конфигурируем ячейку
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier:"CustomTableViewCell_ReuseID"  ,
            for: indexPath
        ) as? CustomTableViewCell else {
                    fatalError("could not dequeueReusableCell")
                }
        cell.update(model: posts[indexPath.row])

                return cell
    }
    
}
