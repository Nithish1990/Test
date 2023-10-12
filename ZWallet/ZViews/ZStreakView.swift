//
//  ZStreakView.swift
//  Zupper
//
//  Created by nithish-17632 on 02/09/23.
//

import UIKit

class ZStreakView: UIView {
    private let timerLabel = UILabel()
    private let bestStreakLabel = UILabel()
    private let attemptsLabel = UILabel()
    private let daysLabel = UILabel()
    let relapseButton = UIButton()
    
    // Timer properties
    private var timer: Timer?
    private var secondsElapsed: Int = 0
    private var bestStreak: Int = 0
    private var attempts: Int = 0
    private var days: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Set up UI elements
        configureUI()
        // Start the timer
        startTimer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .systemBackground
        
        // Timer Label
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.font = UIFont.systemFont(ofSize: 24)
        timerLabel.text = "00:00:00"
        addSubview(timerLabel)
        
        // Best Streak Label
        bestStreakLabel.translatesAutoresizingMaskIntoConstraints = false
        bestStreakLabel.text = "Best Streak: \(bestStreak)"
        addSubview(bestStreakLabel)
        
        // Attempts Label
        attemptsLabel.translatesAutoresizingMaskIntoConstraints = false
        attemptsLabel.text = "Attempts: \(attempts)"
        addSubview(attemptsLabel)
        
        // Days Label
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.text = "Days: \(days)"
        addSubview(daysLabel)
        
        // Relapse Button
        relapseButton.translatesAutoresizingMaskIntoConstraints = false
        relapseButton.setTitle("Relapse", for: .normal)
        relapseButton.setTitleColor(.label, for: .normal)
//        relapseButton.addTarget(self, action: #selector(relapseButtonTapped), for: .touchUpInside)
        addSubview(relapseButton)
        
        // Configure constraints
        NSLayoutConstraint.activate([
            daysLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            daysLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            timerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            timerLabel.topAnchor.constraint(equalTo: daysLabel.bottomAnchor, constant: 10),
            
            bestStreakLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            bestStreakLabel.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 20),
            
            attemptsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            attemptsLabel.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 10),
            
            relapseButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            relapseButton.topAnchor.constraint(equalTo: attemptsLabel.bottomAnchor,constant: 10),
            relapseButton.widthAnchor.constraint(equalToConstant: 120),
            relapseButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func relapseButtonTapped() {
        
    }
    private func replaceCountChange(){
        // Increment attempts
        attempts += 1
        attemptsLabel.text = "Attempts: \(attempts)"
        
        // Update days (assuming one attempt per day)
        days += 1
        daysLabel.text = "Days: \(days)"
        
        // Reset the timer and update best streak if needed
        stopTimer()
        if attempts > bestStreak {
            bestStreak = attempts
            bestStreakLabel.text = "Best Streak: \(bestStreak)"
        }
        secondsElapsed = 0
        timerLabel.text = "00:00:00"
        
        // Start the timer again
        startTimer()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.secondsElapsed += 1
            self?.updateTimerLabel()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updateTimerLabel() {
        let hours = secondsElapsed / 3600
        let minutes = (secondsElapsed % 3600) / 60
        let seconds = secondsElapsed % 60
        timerLabel.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

extension UILabel {
    static func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = .label
        return label
    }
}
