//
//  FirstViewController.swift
//  LevelSupermind
//
//  Created by Shivansh Sharma on 01/03/25.
//
import UIKit

class FirstViewController: UIViewController {

    var todayTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 15/255.0, green: 6/255.0, blue: 34/255.0, alpha: 1.0)
        setupTable()
    }


    private func setupTable() {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        tableView.backgroundColor = UIColor(red: 15/255.0, green: 6/255.0, blue: 34/255.0, alpha: 1.0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GetStartedTableViewCell.self, forCellReuseIdentifier: "GetStartedCell")
        tableView.register(ExploreTableViewCell.self, forCellReuseIdentifier: "ExploreTableViewCell")
        tableView.register(RecommendationsAndRecentsTableViewCell.self, forCellReuseIdentifier: "RecommendationsAndRecentsTableViewCell")
        tableView.register(LearnTableViewCell.self, forCellReuseIdentifier: "LearnTableViewCell")
        tableView.register(FeaturedTableViewCell.self, forCellReuseIdentifier: "FeaturedTableViewCell")
        
        let headerView = TodayTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.3))
        tableView.tableHeaderView = headerView
        
        let footerView = TodayTableFooterView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.2))
        tableView.tableFooterView = footerView
        self.todayTableView = tableView
    }
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodayTable.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = TodayTable.allCases
        
        if indexPath.section >= sections.count {
            return UITableViewCell()
        }
        
        let section = sections[indexPath.row]
        
        switch section {
        case .getStarted:
            let cell = tableView.dequeueReusableCell(withIdentifier: "GetStartedCell", for: indexPath) as! GetStartedTableViewCell
            cell.configure(header: section.title,
                           title: "Meditation Series",
                           subtitle: "Manage your emotions",
                           description: "9",
                           extraInfo: "Ranveer Allahabadia",
                           image: UIImage(named: "crane-birds-art-natural-landscape-background-with-asian-traditional-icon-texture-3d-illustration"))
            return cell
        case .explore:
            let cell = tableView.dequeueReusableCell(withIdentifier: ExploreTableViewCell.identifier, for: indexPath) as! ExploreTableViewCell
            cell.configure(with: section.title)
            cell.delegate = self
            return cell
        case .recommendation:
            let cell = tableView.dequeueReusableCell(withIdentifier: RecommendationsAndRecentsTableViewCell.identifier, for: indexPath) as! RecommendationsAndRecentsTableViewCell
            cell.configure(with: section.title, showSeeAll: false)
            return cell
        case .recents:
            let cell = tableView.dequeueReusableCell(withIdentifier: RecommendationsAndRecentsTableViewCell.identifier, for: indexPath) as! RecommendationsAndRecentsTableViewCell
            cell.configure(with: section.title, showSeeAll: true)
            return cell
        case .learn:
            let cell = tableView.dequeueReusableCell(withIdentifier: LearnTableViewCell.identifier, for: indexPath) as! LearnTableViewCell
            cell.configure(header: section.title, image: UIImage(named: "learnSectionImage"), title: "How to meditate like a monk", subtitle: "Read More")
            return cell
        case .featured:
            let cell = tableView.dequeueReusableCell(withIdentifier: FeaturedTableViewCell.identifier, for: indexPath) as! FeaturedTableViewCell
            cell.configure(header: section.title)
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension FirstViewController: ExploreTableViewCellDelegate {
    func didUpdateCellHeight() {
        DispatchQueue.main.async {
            self.todayTableView.beginUpdates()
            self.todayTableView.endUpdates()
        }
    }
}
