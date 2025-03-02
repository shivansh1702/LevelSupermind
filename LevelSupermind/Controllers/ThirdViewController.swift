//
//  ThirdViewController.swift
//  LevelSupermind
//
//  Created by Shivansh Sharma on 01/03/25.
//
import UIKit

class ThirdViewController: UIViewController {
    
    private var tableView = UITableView()
    private var selectedSegmentIndex = 0
    private let sections: [MyLibraryEnum] = [
        .recentlyPlayed,
        .profileOption(title: "My Favorites", icon: UIImage(named: "Heart")),
        .profileOption(title: "Downloads", icon: UIImage(named: "DownloadSimple")),
        .profileOption(title: "My Playlists", icon: UIImage(named: "playlist")),
        .profileOption(title: "My Journal Entries", icon: UIImage(named: "Book"))
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 15/255.0, green: 6/255.0, blue: 34/255.0, alpha: 1.0)
        setupUI()
    }
    
    func setupUI() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RecommendationsAndRecentsTableViewCell.self, forCellReuseIdentifier: RecommendationsAndRecentsTableViewCell.identifier)
        tableView.register(MyLibraryCell.self, forCellReuseIdentifier: MyLibraryCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        
        let headerView = ProfileHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        let userProfile = ProfileModel(name: "Sourav", level: "Level Premium User >", streak: 17, league: "Gold League")
        headerView.configure(with: userProfile)
        headerView.segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            headerView.heightAnchor.constraint(equalToConstant: 250),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let footerView = TodayTableFooterView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.2))
        tableView.tableFooterView = footerView
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        selectedSegmentIndex = sender.selectedSegmentIndex
        tableView.reloadData()
    }
}

extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (selectedSegmentIndex == 0) ? sections.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.row] {
        case .recentlyPlayed:
            let cell = tableView.dequeueReusableCell(withIdentifier: RecommendationsAndRecentsTableViewCell.identifier, for: indexPath) as! RecommendationsAndRecentsTableViewCell
            cell.configure(with: "Recommended for You", showSeeAll: true)
            return cell
            
        case .profileOption(let title, let icon):
            let cell = tableView.dequeueReusableCell(withIdentifier: MyLibraryCell.identifier, for: indexPath) as! MyLibraryCell
            cell.configure(with: title, icon: icon)
            return cell
        }
    }
}
