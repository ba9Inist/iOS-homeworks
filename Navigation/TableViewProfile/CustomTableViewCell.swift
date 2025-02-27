//
//  CustomTableViewCell.swift
//  Navigation
//
//  Created by Егор Голубев on 19.02.2025.
//

import UIKit
import StorageService


class CustomTableViewCell: UITableViewCell {
    
    private lazy var author: UILabel = {
        let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font = UIFont.systemFont(ofSize: 20,weight: .bold)
        author.textColor = .black
        author.numberOfLines = 2
        return author
    }()
    
    private lazy var postdescription: UITextView = {
        let postdescription = UITextView()
        postdescription.translatesAutoresizingMaskIntoConstraints = false
        postdescription.isEditable = false
        postdescription.isScrollEnabled = true
        postdescription.font = UIFont.systemFont(ofSize: 14)
        postdescription.textColor = .systemGray
        postdescription.backgroundColor = .clear
        return postdescription
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        
        return image
    }()
    
    let likes: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = UIFont.systemFont(ofSize: 16)
        likes.textColor = .black
        return likes
    }()
    
    let views: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = UIFont.systemFont(ofSize: 16)
        views.textColor = .black
        return views
    }()
    
    private var dataPost: postProfile? = nil
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: .subtitle,
            reuseIdentifier: reuseIdentifier
        )

        tuneView()
        addSubviews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        isHidden = false
        isSelected = false
        isHighlighted = false
    }
    
    // @link https://stackoverflow.com/a/72277752
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        guard let view = selectedBackgroundView else {
            return
        }
        
        contentView.insertSubview(view, at: 0)
        selectedBackgroundView?.isHidden = !selected
    }
    
    // MARK: - Private
    
    private func tuneView() {
                backgroundColor = .tertiarySystemBackground
                contentView.backgroundColor = .tertiarySystemBackground
                textLabel?.backgroundColor = .clear
                detailTextLabel?.backgroundColor = .clear
                imageView?.backgroundColor = .clear
        
                accessoryView = nil
                accessoryType = .disclosureIndicator
        
                selectionStyle = .gray
                let selectedView = UIView()
                selectedView.backgroundColor = .systemYellow
                selectedBackgroundView = selectedView
    }
    
    private func addSubviews() {
        contentView.addSubview(author)
        contentView.addSubview(postdescription)
        contentView.addSubview(image)
        contentView.addSubview(likes)
        contentView.addSubview(views)
    }
    
    private func setupConstraints() {
        
        //        let screenWidth = UIScreen.main.bounds.width
        //        let screenHeight = UIScreen.main.bounds.height
        
        
        NSLayoutConstraint.activate([
            
            author.topAnchor.constraint(equalTo: contentView.topAnchor),
            author.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 16),
            
            image.widthAnchor.constraint(equalToConstant: 100),
            image.topAnchor.constraint(equalTo: author.bottomAnchor),
            image.heightAnchor.constraint(equalToConstant: 100),
            
            postdescription.topAnchor.constraint(equalTo: author.bottomAnchor),
            postdescription.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            
            likes.topAnchor.constraint(equalTo: postdescription.bottomAnchor),
            views.topAnchor.constraint(equalTo: postdescription.bottomAnchor),
            
            likes.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            views.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            likes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            views.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        
        
    }
    
    func update(model: postProfile) {
        dataPost = model
        author.text = dataPost?.author
        postdescription.text = dataPost?.description
                if let imageUrl = dataPost?.image {
                    image.image = UIImage(named: imageUrl)
                }
                if let likesInt = dataPost?.likes {
                    let likeString = String(likesInt)
                    likes.text = "Likes: \(likeString)"
                }
        
                if let viewsInt = dataPost?.views {
                    let viewString = String(viewsInt)
                    views.text = "Views: \(viewString)"
                }
        
    }
    
}

