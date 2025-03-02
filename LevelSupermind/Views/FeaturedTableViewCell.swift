//
//  FeaturedTableViewCell.swift
//  LevelSupermind
//
//  Created by Shivansh Sharma on 02/03/25.
//
import UIKit

class FeaturedTableViewCell: UITableViewCell {
    
    static let identifier = "FeaturedTableViewCell"
    var imageArray: [String] = ["relax", "innerPeace", "tea"]
    var typeTextArray: [String] = ["Meditation Series", "Music", "Workout"]
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 15/255, green: 6/255, blue: 34/255, alpha: 1)
        
        contentView.addSubview(headerLabel)
        contentView.addSubview(collectionView)
        
        [headerLabel, collectionView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            headerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            collectionView.heightAnchor.constraint(equalToConstant: 300),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FeaturedCollectionViewCell.self, forCellWithReuseIdentifier: FeaturedCollectionViewCell.identifier)
        collectionView.decelerationRate = .fast
    }
    
    func configure(header: String) {
        headerLabel.text = header
        collectionView.reloadData()
    }
}

extension FeaturedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCollectionViewCell.identifier, for: indexPath) as! FeaturedCollectionViewCell
        let typeTextColors: [UIColor] = [UIColor(red: 106/255, green: 108/255, blue: 250/255, alpha: 1), UIColor(red: 81/255, green: 183/255, blue: 179/255, alpha: 1), UIColor(red: 255/255, green: 198/255, blue: 7/255, alpha: 1)]
        cell.configure(image: UIImage(named: imageArray[indexPath.row]), typeText: typeTextArray[indexPath.row], description1: "Change your thought patterns", name: "Ranveer Allahabadia", description2: "Break down your thought patterns and understand why you think the way you do to optimise your emotional well-being", time: "10 mins", typeColor: typeTextColors[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 0.8) {
            cell.alpha = 1
        }
    }
}
