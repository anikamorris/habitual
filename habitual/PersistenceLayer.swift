//
//  PersistenceLayer.swift
//  habitual
//
//  Created by Anika Morris on 4/29/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation

struct PersistenceLayer {

    private(set) var habits: [Habit] = []
    private static let userDefaultsHabitsKeyValue = "HABITS_ARRAY"

    init() {
        self.loadHabits()
    }
    
    private mutating func loadHabits() {
        let userDefaults = UserDefaults.standard

        guard
            let habitData = userDefaults.data(forKey: PersistenceLayer.userDefaultsHabitsKeyValue),
            let habits = try? JSONDecoder().decode([Habit].self, from: habitData) else {
                return
        }

        self.habits = habits
    }
    
    @discardableResult
    mutating func createNewHabit(name: String, image: Habit.Images) -> Habit {
        let newHabit = Habit(title: name, image: image)
        self.habits.insert(newHabit, at: 0) // Prepend the habits to the array
        self.saveHabits()

        return newHabit
    }
    
    private func saveHabits() {
        guard let habitsData = try? JSONEncoder().encode(self.habits) else {
            fatalError("could not encode list of habits")
        }

        let userDefaults = UserDefaults.standard
        userDefaults.set(habitsData, forKey: PersistenceLayer.userDefaultsHabitsKeyValue)
        userDefaults.synchronize()
    }

}
