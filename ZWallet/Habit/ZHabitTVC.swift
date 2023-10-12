//
//  ZHabitTVC.swift
//  Zupper
//
//  Created by nithish-17632 on 04/09/23.
//

import UIKit

class ZHabitTVC: UITableViewCell {
    
    
    static let identifier = "ZHabitTVC"
    
    // Create UI components for the cell
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect // You can change the style as needed
        return textField
    }()
    
    // Initialize the cell with a reuse identifier
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add label and textField to the cell's content view
        contentView.addSubview(label)
        contentView.addSubview(textField)
        
        // Set up Auto Layout constraints
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textField.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
            textField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
