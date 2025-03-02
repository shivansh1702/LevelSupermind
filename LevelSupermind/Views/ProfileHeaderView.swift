//
//  ProfileHeaderView.swift
//  LevelSupermind
//
//  Created by Shivansh Sharma on 02/03/25.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Frame 1171277537")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let premiumIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Group 48099035")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let levelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .yellow
        return label
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let streakView = ProfileStatsView(icon: "Group 48099817")
    private let leagueView = ProfileStatsView(icon: "Gold")
    
    let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["My Library", "Insights"])
        control.selectedSegmentIndex = 0
        control.backgroundColor = UIColor(red: 15/255, green: 6/255, blue: 34/255, alpha: 1)
        control.setTitleTextAttributes([.foregroundColor: UIColor.white.withAlphaComponent(0.5)], for: .normal)
        control.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        control.selectedSegmentTintColor = .clear
        control.layer.borderColor = UIColor.clear.cgColor
        control.layer.borderWidth = 0
        return control
    }()
    
    override init(frame: CGRect) {
        
    
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 15/255, green: 6/255, blue: 34/255, alpha: 1)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        let premiumUserView = UIView()
        premiumUserView.translatesAutoresizingMaskIntoConstraints = false
        premiumUserView.addSubview(nameLabel)
        premiumUserView.addSubview(premiumIconImage)
        [nameLabel, premiumIconImage].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: premiumUserView.leadingAnchor, constant: 0),
            nameLabel.topAnchor.constraint(equalTo: premiumUserView.topAnchor, constant: 5),
            nameLabel.bottomAnchor.constraint(equalTo: premiumUserView.bottomAnchor, constant: -5),
            premiumIconImage.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 3),
            premiumIconImage.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor)
        ])

        let labelStack = UIStackView(arrangedSubviews: [premiumUserView, levelLabel])
        labelStack.axis = .vertical
        labelStack.spacing = 5
        labelStack.alignment = .leading
        labelStack.distribution = .fill

        let leftStack = UIStackView(arrangedSubviews: [profileImageView, labelStack])
        leftStack.axis = .horizontal
        leftStack.spacing = 10
        leftStack.alignment = .center
        leftStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(leftStack)
        
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(settingsButton)
        
        let statsStack = UIStackView(arrangedSubviews: [streakView, leagueView])
        statsStack.axis = .horizontal
        statsStack.spacing = 10
        statsStack.distribution = .fillEqually
        statsStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(statsStack)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(segmentedControl)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            leftStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            leftStack.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            leftStack.trailingAnchor.constraint(greaterThanOrEqualTo: settingsButton.leadingAnchor, constant: -15),
            settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            settingsButton.centerYAnchor.constraint(equalTo: leftStack.centerYAnchor),
            settingsButton.widthAnchor.constraint(equalToConstant: 30),
            settingsButton.heightAnchor.constraint(equalToConstant: 30),
            
            statsStack.topAnchor.constraint(equalTo: leftStack.bottomAnchor, constant: 15),
            statsStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            statsStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            segmentedControl.topAnchor.constraint(equalTo: statsStack.bottomAnchor, constant: 35),
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            segmentedControl.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(with profile: ProfileModel) {
        nameLabel.text = profile.name
        levelLabel.text = profile.level
        streakView.update(numberText: "\(profile.streak)", typeText: "Day Streak")
        leagueView.update(numberText: "#04", typeText: profile.league)
    }
}

class ProfileStatsView: UIView {
    private let iconImageView = UIImageView()
    private let numberLabel = UILabel()
    private let typeLabel = UILabel()
    init(icon: String) {
        super.init(frame: .zero)
        backgroundColor = .clear
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        typeLabel.textColor = .white
        typeLabel.font = UIFont.systemFont(ofSize: 12)
        typeLabel.textColor = .lightGray
        
        let labelStack = UIStackView(arrangedSubviews: [numberLabel, typeLabel])
        labelStack.axis = .vertical
        labelStack.spacing = 5
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        
        iconImageView.image = UIImage(named: icon)
        iconImageView.tintColor = .white
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        numberLabel.textColor = .white
        numberLabel.font = .systemFont(ofSize: 14)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let stack = UIStackView(arrangedSubviews: [iconImageView, labelStack])
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            heightAnchor.constraint(equalToConstant: 60),
            widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(numberText: String, typeText: String) {
        numberLabel.text = numberText
        typeLabel.text = typeText
    }
}
