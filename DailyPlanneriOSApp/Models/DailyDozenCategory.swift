//
//  DailyDozenCategory.swift
//  Notebook for Josh
//

struct DailyDozenCategory: Identifiable {
    let id: String
    let name: String
    let servings: Int

    static let all: [DailyDozenCategory] = [
        DailyDozenCategory(id: "beans",             name: "Beans",              servings: 3),
        DailyDozenCategory(id: "berries",            name: "Berries",            servings: 1),
        DailyDozenCategory(id: "other_fruits",       name: "Other Fruits",       servings: 3),
        DailyDozenCategory(id: "cruciferous_veg",    name: "Cruciferous Vegetables", servings: 1),
        DailyDozenCategory(id: "greens",             name: "Greens",             servings: 2),
        DailyDozenCategory(id: "other_vegetables",   name: "Other Vegetables",   servings: 2),
        DailyDozenCategory(id: "flaxseeds",          name: "Flaxseeds",          servings: 1),
        DailyDozenCategory(id: "nuts",               name: "Nuts",               servings: 1),
        DailyDozenCategory(id: "spices",             name: "Spices",             servings: 1),
        DailyDozenCategory(id: "whole_grains",       name: "Whole Grains",       servings: 3),
        DailyDozenCategory(id: "beverages",          name: "Beverages",          servings: 5),
        DailyDozenCategory(id: "exercise",           name: "Exercise",           servings: 1),
    ]
}
