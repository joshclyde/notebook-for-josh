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
            "Style hair?",
            "Coffee",
            "Lotion hands",
            "Sit down and plan for the day",
        ]
    ),
    Routine(
        title: "Wind down",
        tasks: [
            "Floss & Brush Teeth",
            "Clean face",
            "Gameboy for 15 minutes",
            "Read book",
            "Refill kitten water",
            "Put away kitten",
        ]
    ),
]
