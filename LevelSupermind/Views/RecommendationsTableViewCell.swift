//
//  RecommendationsTableViewCell.swift
//  LevelSupermind
//
//  Created by Shivansh Sharma on 01/03/25.
//

import UIKit

class RecommendationsAndRecentsTableViewCell: UITableViewCell {
    
    static let identifier = "RecommendationsAndRecentsTableViewCell"
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let seeAllBtn: UIButton = {
        let button = UIButton()
        button.setTitle("See All", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private var imageNameArray: [String] = ["Card top half", "Card top half-2", "Card top half"]
    private var titleNameArray: [String] = ["Meditation · 10 mins", "Meditation Series", "Meditation Series"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor(red: 15/255.0, green: 6/255.0, blue: 34/255.0, alpha: 1.0)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(headerLabel)
        contentView.addSubview(collectionView)
        contentView.addSubview(seeAllBtn)
        [headerLabel, collectionView, seeAllBtn].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false}

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            headerLabel.trailingAnchor.constraint(greaterThanOrEqualTo: seeAllBtn.leadingAnchor, constant: -15),

            seeAllBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            seeAllBtn.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            collectionView.heightAnchor.constraint(equalToConstant: 280)
        ])
        setupCollectionView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RecommendationsAndRecentsCollectionViewCell.self, forCellWithReuseIdentifier: RecommendationsAndRecentsCollectionViewCell.identifier)
    }

    func configure(with title: String, showSeeAll: Bool) {
        headerLabel.text = title
        collectionView.reloadData()
        seeAllBtn.isHidden = !showSeeAll
    }
}

extension RecommendationsAndRecentsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendationsAndRecentsCollectionViewCell.identifier, for: indexPath) as! RecommendationsAndRecentsCollectionViewCell
        cell.configure(image: UIImage(named: self.imageNameArray[indexPath.row]), title: self.titleNameArray[indexPath.row], authorName: "Akhil Aryan", description: "Freedom Series")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/2, height: collectionView.bounds.height/1.2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
