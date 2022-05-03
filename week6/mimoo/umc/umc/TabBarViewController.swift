//
//  TabBarViewController.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/26.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.tabBar.tintColor = UIColor.black
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = Colors.backgroundColor
            self.tabBar.standardAppearance = appearance
            self.tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        
        let homeVC = HomeViewController()
        let profileVC = ProfileViewController()

        homeVC.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(named: "홈/ic_home_home_white")?.setSizeTabBarItem(),
            selectedImage: UIImage(named: "홈/ic_home_home_black")?.setSizeTabBarItem()
        )
        
        profileVC.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(named: "홈/ic_home_heart")?.setSizeTabBarItem(),
            selectedImage: UIImage(named: "홈/ic_home_heart_full")?.setSizeTabBarItem()
        )

        setViewControllers([homeVC, profileVC], animated: false)
        
    }
    
    
}
