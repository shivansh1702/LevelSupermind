//
//  LearnTableViewCell.swift
//  LevelSupermind
//
//  Created by Shivansh Sharma on 02/03/25.
//

import UIKit

class LearnTableViewCell: UITableViewCell {
    
    static let identifier = "LearnTableViewCell"
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 56/255, green: 33/255, blue: 106/255, alpha: 1)
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    private let learnImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        label.textColor = .white
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Vector"), for: .normal)
        button.backgroundColor = UIColor(red: 17/255, green: 9/255, blue: 32/255, alpha: 0.7)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 19
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 15/255, green: 6/255, blue: 34/255, alpha: 1)
        
        contentView.addSubview(headerLabel)
        contentView.addSubview(containerView)
        containerView.addSubview(learnImageView)
        
        let textStack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        textStack.axis = .vertical
        textStack.spacing = 5
        textStack.alignment = .leading
        
        containerView.addSubview(textStack)
        containerView.addSubview(actionButton)
        
        [headerLabel, containerView, learnImageView, textStack, actionButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            headerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),

            containerView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 15),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            learnImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            learnImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            learnImageView.widthAnchor.constraint(equalToConstant: 110),
            learnImageView.heightAnchor.constraint(equalToConstant: 70),
            
            textStack.leadingAnchor.constraint(equalTo: learnImageView.trailingAnchor, constant: 10),
            textStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            textStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15),
            textStack.trailingAnchor.constraint(lessThanOrEqualTo: actionButton.leadingAnchor, constant: -10),
            
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            actionButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            actionButton.widthAnchor.constraint(equalToConstant: 38),
            actionButton.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(header: String, image: UIImage?, title: String, subtitle: String) {
        headerLabel.text = header
        learnImageView.image = image
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}

