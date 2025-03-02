//
//  GetStartedTableViewCell.swift
//  LevelSupermind
//
//  Created by Shivansh Sharma on 02/03/25.
//
import UIKit

class GetStartedTableViewCell: UITableViewCell {
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 28/255, green: 19/255, blue: 58/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 104/255, green: 38/255, blue: 234/255, alpha: 1).cgColor
        view.layer.masksToBounds = true
        return view
    }()
    
    private var titleLabel: UILabel!
    private var subtitleLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var extraInfoLabel: UILabel!

    private let rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor(red: 15/255.0, green: 6/255.0, blue: 34/255.0, alpha: 1.0)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(headerView)
        headerView.addSubview(headerLabel)
        contentView.addSubview(containerView)
        
        titleLabel = UILabel()
        subtitleLabel = UILabel()
        descriptionLabel = UILabel()
        extraInfoLabel = UILabel()
        [titleLabel, subtitleLabel, descriptionLabel, extraInfoLabel].forEach { label in
            label?.translatesAutoresizingMaskIntoConstraints = false
            label?.textAlignment = .left
        }
        titleLabel.textColor = UIColor(red: 108/255, green: 108/255, blue: 250/255, alpha: 1)
        [subtitleLabel, descriptionLabel, extraInfoLabel].forEach { label in
            label?.textColor = .white
        }
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subtitleLabel.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        subtitleLabel.numberOfLines = 2
        descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        extraInfoLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(extraInfoLabel)
        containerView.addSubview(rightImageView)

        [headerView, headerLabel, containerView, rightImageView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            headerView.heightAnchor.constraint(equalToConstant: 40),

            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),

            containerView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),

            subtitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.trailingAnchor.constraint(equalTo: rightImageView.leadingAnchor, constant: -25),

            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            descriptionLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10),

            extraInfoLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            extraInfoLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            extraInfoLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),

            rightImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            rightImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            rightImageView.widthAnchor.constraint(equalToConstant: 150),
            rightImageView.heightAnchor.constraint(equalToConstant: 110)
        ])
    }

    func configure(header: String, title: String, subtitle: String, description: String, extraInfo: String, image: UIImage?) {
        headerLabel.text = header
        titleLabel.text = title
        subtitleLabel.text = subtitle
        descriptionLabel.text = description
        extraInfoLabel.text = extraInfo
        rightImageView.image = image
    }
}


