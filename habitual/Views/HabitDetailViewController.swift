//
//  HabitDetailViewController.swift
//  habitual
//
//  Created by Anika Morris on 5/4/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import UIKit

class HabitDetailViewController: UIViewController {
    
    var habit: Habit!
    var habitIndex: Int!
    
    private var persistence = PersistenceLayer()

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var currentStreakLabel: UILabel!
    @IBOutlet weak var totalCompletionsLabel: UILabel!
    @IBOutlet weak var bestStreakLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var markCompletedButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }


    @IBAction func markCompletedPressed(_ sender: Any) {
        habit = persistence.markHabitAsCompleted(habitIndex)
        updateUI()
    }
    
    private func updateUI() {
        title = habit.title
        iconImageView.image = habit.selectedImage.image
        totalCompletionsLabel.text = String(habit.numberOfCompletions)
        bestStreakLabel.text = String(habit.bestStreak)
        startDateLabel.text = habit.dateCreated.stringValue

        if habit.currentStreak == 1 {
            currentStreakLabel.text = "\(habit.currentStreak) day"
        } else {
            currentStreakLabel.text = "\(habit.currentStreak) days"
        }
        
        if habit.completedToday {
            markCompletedButton.setTitle("Completed for Today!", for: .normal)
        } else {
            markCompletedButton.setTitle("Mark as Completed", for: .normal)
        }
    }
}
