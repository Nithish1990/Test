//
//  Calculator.swift
//  Zupper
//
//  Created by nithish-17632 on 03/09/23.
//

import Foundation
import UIKit

class ReturnPercentageViewController: UIViewController {
    // UI elements
    private let paidTextField = UITextField()
    private let returnTextField = UITextField()
    private let percentageTextField = UITextField()
    private let calculatePercentageButton = UIButton()
    private let calculateReturnButton = UIButton()
    private let resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        // Configure UI elements
        configureTextField(paidTextField, placeholder: "Enter the amount paid")
        configureTextField(returnTextField, placeholder: "Enter the return amount")
        configureTextField(percentageTextField, placeholder: "Enter the return percentage")

        configureButton(calculatePercentageButton, title: "Calculate Percentage", action: #selector(calculatePercentageButtonTapped))
        configureButton(calculateReturnButton, title: "Calculate Return", action: #selector(calculateReturnButtonTapped))

        configureResultLabel()

        configureConstraints()
        paidTextField.becomeFirstResponder()
    }

    private func configureTextField(_ textField: UITextField, placeholder: String) {
        textField.placeholder = placeholder
        textField.tintColor = .systemBackground
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
    }

    private func configureButton(_ button: UIButton, title: String, action: Selector) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = .systemBackground
        button.setTitleColor(.label, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
    }

    private func configureResultLabel() {
        resultLabel.textAlignment = .center
        resultLabel.textColor = .label
        resultLabel.numberOfLines = 0
    }

    private func configureConstraints() {
        // Define constraints for UI elements
        paidTextField.translatesAutoresizingMaskIntoConstraints = false
        returnTextField.translatesAutoresizingMaskIntoConstraints = false
        percentageTextField.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        calculateReturnButton.translatesAutoresizingMaskIntoConstraints = false
        calculatePercentageButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(paidTextField)
        view.addSubview(returnTextField)
        view.addSubview(percentageTextField)
        view.addSubview(calculatePercentageButton)
        view.addSubview(calculateReturnButton)
        view.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            paidTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            paidTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            paidTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10),
            
            returnTextField.topAnchor.constraint(equalTo: paidTextField.bottomAnchor,constant: 10),
            returnTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            returnTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10),
            
            percentageTextField.topAnchor.constraint(equalTo:  returnTextField.bottomAnchor,constant: 10),
            percentageTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            percentageTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10),
            
            calculateReturnButton.topAnchor.constraint(equalTo: percentageTextField.bottomAnchor,constant: 10),
            calculateReturnButton.leadingAnchor.constraint(equalTo: percentageTextField.leadingAnchor),
            
            calculatePercentageButton.topAnchor.constraint(equalTo: calculateReturnButton.topAnchor),
            calculatePercentageButton.trailingAnchor.constraint(equalTo: percentageTextField.trailingAnchor),
            
            
            resultLabel.topAnchor.constraint(equalTo: calculateReturnButton.bottomAnchor,constant: 10),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    @objc private func calculatePercentageButtonTapped() {
        // Calculate return percentage
        if let paidText = paidTextField.text, let returnText = returnTextField.text,
           let paidAmount = Double(paidText), let returnAmount = Double(returnText) {
            let returnPercentage = ((returnAmount - paidAmount) / paidAmount) * 100
            resultLabel.text = String(format: "Return Percentage: %.2f%%", returnPercentage)
        } else {
            resultLabel.text = "Invalid input"
        }
        
        percentageTextField.text = ""
    }

    @objc private func calculateReturnButtonTapped() {
        // Calculate return amount
        if let paidText = paidTextField.text, let percentageText = percentageTextField.text,
           let paidAmount = Double(paidText), let returnPercentage = Double(percentageText) {
            let returnAmount = (returnPercentage / 100) * paidAmount + paidAmount
            resultLabel.text = String(format: "Return Amount: %.2f", returnAmount)
        } else {
            resultLabel.text = "Invalid input"
        }
        returnTextField.text = ""
    }
}
