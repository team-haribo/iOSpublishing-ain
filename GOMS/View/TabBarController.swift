//
//  TabBarController.swift
//  GOMS
//
//  Created by 신아인 on 2023/05/29.
//

import UIKit

class TabBarController: UITabBarController {
    
    let HEIGHT_TAB_BAR:CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        let outingVC = OutingViewController()
        let statusVC = StatusViewController()

        tabBar.tintColor = .orange
        tabBar.backgroundColor = .white
        
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill"), selectedImage: nil)
        outingVC.tabBarItem = UITabBarItem(title: "외출하기", image: UIImage(systemName: "viewfinder"), selectedImage: nil)
        statusVC.tabBarItem = UITabBarItem(title: "외출현황", image: UIImage(systemName: "door.left.hand.open"), selectedImage: nil)
        
        let navigationHome = UINavigationController(rootViewController: homeVC)
        let navigationOuting = UINavigationController(rootViewController: outingVC)
        let navigationStatus = UINavigationController(rootViewController: statusVC)
        
        setViewControllers([navigationHome, navigationOuting, navigationStatus], animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = HEIGHT_TAB_BAR
        tabFrame.origin.y = self.view.frame.size.height - HEIGHT_TAB_BAR
        self.tabBar.frame = tabFrame
    }
}
