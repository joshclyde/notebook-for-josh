//
//  Routine.swift
//  Notebook for Josh Watch App Watch App
//

import Foundation

struct Routine: Identifiable {
    let id = UUID()
    let title: String
    let tasks: [String]
}

// Hardcoded sample routines
let sampleRoutines: [Routine] = [
    Routine(
        title: "Wake up",
        tasks: [
            "Let Daisy out of the attic",
            "Feed the cats",
            "Drink water",
            "Eat yogurt",
            "Refill cat's water",
            "Put away dishes",
            "Drink water",
            "Scoop litter?",
            "Vacuum first floor",
            "Brush teeth",
            "Deodorant",
            "Style hair",
            "Coffee",
            "Sit down and plan for the day",
        ]
    ),
    Routine(
        title: "Work - Morning",
        tasks: [
            "Check emails",
            "Standup meeting",
            "Review PRs",
        ]
    ),
    Routine(
        title: "Wind down",
        tasks: [
            "Run 3 miles",
            "Push-ups",
            "Stretching",
            "Shower",
            "Read",
        ]
    ),
]
