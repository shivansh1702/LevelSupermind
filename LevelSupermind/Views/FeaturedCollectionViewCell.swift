//
//  FeaturedCollectionViewCell.swift
//  LevelSupermind
//
//  Created by Shivansh Sharma on 02/03/25.
//

import UIKit

class FeaturedCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FeaturedCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let dimView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.isUserInteractionEnabled = false 
        return view
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let descriptionLabel1: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    private let descriptionLabel2: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        label.textAlignment = .center
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        return label
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "play_arrow")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(dimView)
        
        let topStack = UIStackView(arrangedSubviews: [typeLabel, descriptionLabel1])
        topStack.axis = .vertical
        topStack.spacing = 5
        
        let bottomStack = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel2])
        bottomStack.axis = .vertical
        bottomStack.spacing = 3
        
        contentView.addSubview(topStack)
        contentView.addSubview(bottomStack)
        contentView.addSubview(timeLabel)
        contentView.addSubview(actionButton)
        
        [imageView, dimView, topStack, bottomStack, timeLabel, actionButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            dimView.topAnchor.constraint(equalTo: imageView.topAnchor),
            dimView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            dimView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            dimView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            
            topStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            topStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            bottomStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bottomStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            bottomStack.bottomAnchor.constraint(equalTo: timeLabel.topAnchor, constant: -10),
            
            timeLabel.leadingAnchor.constraint(equalTo: bottomStack.leadingAnchor),
            timeLabel.topAnchor.constraint(equalTo: bottomStack.bottomAnchor, constant: 15),
            timeLabel.widthAnchor.constraint(equalToConstant: 70),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            actionButton.topAnchor.constraint(equalTo: descriptionLabel2.bottomAnchor, constant: 5),
            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            actionButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            actionButton.widthAnchor.constraint(equalToConstant: 40),
            actionButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: UIImage?, typeText: String, description1: String, name: String, description2: String, time: String, typeColor: UIColor) {
        imageView.image = image
        typeLabel.text = typeText
        descriptionLabel1.text = description1
        nameLabel.text = name
        descriptionLabel2.text = description2
        timeLabel.text = time
        typeLabel.textColor = typeColor
    }
}
