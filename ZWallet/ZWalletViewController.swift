//
//  ZWalletViewController.swift
//  ZWallet
//
//  Created by nithish-17632 on 29/07/23.
//

import UIKit

class ZWalletViewController: BaseVC,UITextFieldDelegate {

    private lazy var textField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(textField)
        textField.backgroundColor = .quaternaryLabel
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            textField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 80),
        ])
    }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        textField.canPerformAction(action, withSender: sender)

    }
}
