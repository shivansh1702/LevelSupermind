//
//  TableFooterView.swift
//  LevelSupermind
//
//  Created by Shivansh Sharma on 02/03/25.
//

import UIKit

class TodayTableFooterView: UIView {
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Made mindfully in 🇮🇳"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let largeLabel1: UILabel = {
        let label = UILabel()
        label.text = "Clear Mind"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let largeLabel2: UILabel = {
        let label = UILabel()
        label.text = "Better Performance"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 15/255, green: 6/255, blue: 34/255, alpha: 1)
        
        [topLabel,largeLabel1, largeLabel2].forEach{ $0.textColor = UIColor(red: 91/255, green: 75/255, blue: 108/255, alpha: 1)}
        
        let stackView = UIStackView(arrangedSubviews: [topLabel, largeLabel1, largeLabel2])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 10
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
