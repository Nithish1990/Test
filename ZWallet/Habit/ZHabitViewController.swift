//
//  ZHabitViewController.swift
//  ZWallet
//
//  Created by nithish-17632 on 29/07/23.
//

import UIKit

class ZHabitViewController: BaseVC {
    // UI elements
    private let streakView = ZStreakView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Habit"
        
        configNavBar()
        configStreakView()
    }
    private func configStreakView(){
        streakView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(streakView)
        NSLayoutConstraint.activate([
            streakView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            streakView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            streakView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            streakView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
}
