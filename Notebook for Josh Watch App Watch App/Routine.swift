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
            "Get out of bed",
            "Make the bed",
            "Let Daisy out of the attic",
            "Feed the cats",
            "Drink water",
            "Allergy medicine (Allegra)",
            "Eat yogurt (while doing next tasks)",
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
            "Clean the dishes",
            "Run the diswaher?",
            "Clean the kitchen counter",
            "Refill kitten water",
            "Check kitten food in auto feeder",
            "Floss & Brush Teeth",
            "Clean face",
            "Gameboy (15 minutes)",
            "Read book",
            "Put away kitten",
        ]
    ),
]
