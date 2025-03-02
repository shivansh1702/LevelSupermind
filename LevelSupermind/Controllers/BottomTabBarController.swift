//
//  BottomTabBarController.swift
//  LevelSupermind
//
//  Created by Shivansh Sharma on 01/03/25.
//

import UIKit

class BottomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let separator = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 0.5))
        separator.backgroundColor = UIColor.lightGray
        separator.autoresizingMask = .flexibleWidth
        tabBar.addSubview(separator)
        
        setupTabs()
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 15/255.0, green: 6/255.0, blue: 34/255.0, alpha: 1.0)
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.tintColor = UIColor(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0)
        tabBar.unselectedItemTintColor = .lightGray
    }

    
    private func setupTabs() {
        let todayScreen = FirstViewController()
        let exploreScreen = SecondViewController()
        let myProfileScreen = ThirdViewController()
        
        let todayImage = UIImage(named: "House")?.withRenderingMode(.alwaysTemplate)
        let exploreImage = UIImage(named: "MagnifyingGlass")?.withRenderingMode(.alwaysTemplate)
        let myProfileImage = UIImage(named: "User")?.withRenderingMode(.alwaysTemplate)
        
        todayScreen.tabBarItem = UITabBarItem(title: "Today", image: todayImage, selectedImage: todayImage)
        exploreScreen.tabBarItem = UITabBarItem(title: "Explore", image: exploreImage, selectedImage: exploreImage)
        myProfileScreen.tabBarItem = UITabBarItem(title: "My Profile", image: myProfileImage, selectedImage: myProfileImage)
        
        viewControllers = [todayScreen, exploreScreen, myProfileScreen]
    }
}
