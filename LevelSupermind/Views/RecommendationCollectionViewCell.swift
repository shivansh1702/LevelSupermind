//
//  RecommendationCollectionViewCell.swift
//  LevelSupermind
//
//  Created by Shivansh Sharma on 02/03/25.
//
import UIKit

class RecommendationsAndRecentsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecommendationsAndRecentsCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor(red: 143/255, green: 206/255, blue: 205/255, alpha: 1)
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .lightGray
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        return label
    }()
    
    private let infoView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        
        infoView.addSubview(titleLabel)
        infoView.addSubview(descriptionLabel)
        infoView.addSubview(authorLabel)
        
        contentView.addSubview(imageView)
        contentView.addSubview(infoView)
        
        [imageView, infoView, titleLabel, descriptionLabel, authorLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            
            infoView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            infoView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            infoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            titleLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 5),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            
            authorLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: 0),
            authorLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            authorLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: UIImage?, title: String, authorName: String, description: String) {
        imageView.image = image
        titleLabel.text = title
        authorLabel.text = authorName
        descriptionLabel.text = description
    }
}
