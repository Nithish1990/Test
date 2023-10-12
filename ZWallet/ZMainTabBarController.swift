//
//  ZMainTabBarController.swift
//  ZWallet
//
//  Created by nithish-17632 on 29/07/23.
//

import UIKit

class ZMainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let walletVC = HabitInput()
        walletVC.tabBarItem = UITabBarItem(title: "Wallet", image: UIImage(systemName: "dollarsign"), tag: 1)
        let walletNav = UINavigationController(rootViewController: walletVC)
        
        
        
        let stockVC = ZStocksViewController()
        stockVC.tabBarItem = UITabBarItem(title: "Stocks", image: UIImage(systemName: "chart.line.uptrend.xyaxis"), tag: 2)
        let stockNav = UINavigationController(rootViewController: stockVC)
        
        
        let habitVC = ZHabitViewController()
        habitVC.tabBarItem = UITabBarItem(title: "Habit", image: UIImage(systemName: "figure.run"), tag: 3)
        let habitNav = UINavigationController(rootViewController: habitVC)
        
        
        
        let foodVC = ZFoodViewController()
        foodVC.tabBarItem = UITabBarItem(title: "Habit", image: UIImage(systemName: "carrot"), tag: 4)
        let foodNav = UINavigationController(rootViewController: foodVC)
        
        
        self.setViewControllers([walletNav,stockNav,habitNav,foodNav], animated: true)
        self.tabBar.barTintColor = .systemBackground
        
    }
}
