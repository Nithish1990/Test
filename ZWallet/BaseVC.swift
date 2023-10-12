//
//  BaseVC.swift
//  Zupper
//
//  Created by nithish-17632 on 19/08/23.
//

import UIKit

class BaseVC: UIViewController {
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.link, for: .normal)
        return button
    }()
    let report: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chart.pie"), for: .normal)
        button.setTitleColor(.link, for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
                view.backgroundColor = .systemBackground
    }
    func configNavBar(){
        let button = UIBarButtonItem(customView: addButton)
        let lButton = UIBarButtonItem(customView: report)
 //        navigationItem.title = "Title"
        navigationItem.rightBarButtonItem = button
        navigationItem.leftBarButtonItem = lButton
//        navigationController?.preferredContentSize = true
    }
}
