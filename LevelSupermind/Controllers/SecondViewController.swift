//
//  SecondViewController.swift
//  LevelSupermind
//
//  Created by Shivansh Sharma on 01/03/25.
//
import UIKit

class SecondViewController: UIViewController {
    
    private let loadingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "hourglass")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "We are finding the best feed for you, hang tight."
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 15/255.0, green: 6/255.0, blue: 34/255.0, alpha: 1.0)
        
        view.addSubview(loadingImageView)
        view.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            loadingImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            loadingImageView.widthAnchor.constraint(equalToConstant: 80),
            loadingImageView.heightAnchor.constraint(equalToConstant: 80),
            
            messageLabel.topAnchor.constraint(equalTo: loadingImageView.bottomAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }
}
