//
//  InfoViewController.swift
//  Navigation
//
//  Created by Егор Голубев on 15.01.2025.
//

import UIKit

struct Info {
    let title: String
}



class InfoViewController: UIViewController {
    
    var Info: Info
    
    init(Info: Info) {
        self.Info = Info
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .brown
        title = Info.title
        
        let alertButton = UIButton(type: .system)
        alertButton.setTitle("Alert", for: .normal)
        alertButton.addTarget(self, action: #selector(OpenUIAlertController), for: .touchUpInside)
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alertButton)
        
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func OpenUIAlertController() {
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Exit", comment: "Default action"), style: .default, handler: { _ in
            NSLog("Exit alert")
        }))
        self.present(alert, animated: true, completion: nil)
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
