//
//  ExploreTableViewCell.swift
//  LevelSupermind
//
//  Created by Shivansh Sharma on 02/03/25.
//

import UIKit

protocol ExploreTableViewCellDelegate: AnyObject {
    func didUpdateCellHeight()
}

class ExploreTableViewCell: UITableViewCell {

    static let identifier = "ExploreTableViewCell"
    weak var delegate: ExploreTableViewCellDelegate?
    private var isExpanded = false
    
    private let allItems: [(image: UIImage?, title: String)] = [
        (UIImage(named: "Meditation icon"), "Meditation"),
        (UIImage(named: "Body icon"), "Workout"),
        (UIImage(named: "Moon"), "Sleep"),
        (UIImage(named: "CaretDown"), "More"),
        (UIImage(named: "lotus"), "Mantra"),
        (UIImage(named: "CalendarDots"), "Events"),
        (UIImage(named: "BookOpenUser"), "Courses"),
        (UIImage(named: "UsersThree"), "Community"),
        (UIImage(named: "ClockCountdown"), "Timer"),
        (UIImage(named: "FlowerTulip"), "Affirmation"),
        (UIImage(named: "MusicNotesSimple"), "Music"),
        (UIImage(named: "Notebook"), "Journal"),
    ]
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    private let editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Shortcuts", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(UIColor(red: 187/255, green: 155/255, blue: 255/255, alpha: 1), for: .normal)
        return button
    }()
    
    private var collectionHeightConstraint: NSLayoutConstraint!

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
        contentView.addSubview(editButton)
        [headerLabel, collectionView, editButton].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false}

        collectionHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 100)

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),

            collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            collectionHeightConstraint,
            editButton.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 8),
            editButton.centerXAnchor.constraint(equalTo: self.collectionView.centerXAnchor),
            editButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5)
        ])

        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ExploreCollectionViewCell.self, forCellWithReuseIdentifier: ExploreCollectionViewCell.identifier)
    }

    func configure(with title: String) {
        headerLabel.text = title
        collectionView.reloadData()
    }

    private func updateCollectionViewHeight() {
        DispatchQueue.main.async {
            let newHeight = self.collectionView.contentSize.height
            self.collectionHeightConstraint.constant = newHeight
            self.delegate?.didUpdateCellHeight()
        }
    }
}

extension ExploreTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isExpanded ? allItems.count : 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreCollectionViewCell.identifier, for: indexPath) as! ExploreCollectionViewCell
        
        if indexPath.item == 3 {
            let image = isExpanded ? UIImage(named: "collapse") : UIImage(named: "CaretDown")
            let title = isExpanded ? "Close" : "More"
            cell.configure(with: image, title: title)
            editButton.isHidden = isExpanded ? false : true
        } else {
            let item = allItems[indexPath.item]
            cell.configure(with: item.image, title: item.title)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 3 {
            isExpanded.toggle()
            collectionView.reloadData()

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { 
                self.updateCollectionViewHeight()
                self.contentView.layoutIfNeeded()
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 24) / 4
        return CGSize(width: width, height: width)
    }
}
