//
//  TodayTableHeaderView.swift
//  LevelSupermind
//
//  Created by Shivansh Sharma on 01/03/25.
//

import UIKit

class TodayTableHeaderView: UIView {
    
    private let imageView = UIImageView()
    private let button1 = UIButton()
    private let button2 = UIButton()
    private let button3 = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Background image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)

        button1.setTitle("2", for: .normal)
        button1.setImage(UIImage(named: "Group 48099817"), for: .normal)
        button1.layer.cornerRadius = 15
        
        button2.setTitle("Rank 5", for: .normal)
        button2.setImage(UIImage(named: "Gold"), for: .normal)
        button2.layer.cornerRadius = 15

        button3.setImage(UIImage(named: "Gift"), for: .normal)
        button3.backgroundColor = .systemRed
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        [button1, button2, button3].forEach { button in
            button.backgroundColor = UIColor(red: 17/255, green: 9/255, blue: 32/255, alpha: 0.7)
            button.setTitleColor(.white, for: .normal)
            button.semanticContentAttribute = .forceRightToLeft
            
        }
        
        let leftStack = UIStackView(arrangedSubviews: [button1, button2])
        leftStack.axis = .horizontal
        leftStack.spacing = 8
        leftStack.distribution = .fillProportionally
        leftStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(leftStack)
        addSubview(button3)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            leftStack.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            leftStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            leftStack.widthAnchor.constraint(equalToConstant: 150),
            leftStack.heightAnchor.constraint(equalToConstant: 42),

            button3.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            button3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            button3.widthAnchor.constraint(equalToConstant: 42),
            button3.heightAnchor.constraint(equalToConstant: 42),

        ])
        button3.layer.cornerRadius = 21

    }
}
