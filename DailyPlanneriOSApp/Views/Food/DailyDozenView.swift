//
//  DailyDozenView.swift
//  Notebook for Josh
//

import SwiftUI

struct DailyDozenView: View {
    @State private var store = DailyDozenStore()

    var body: some View {
        List(DailyDozenCategory.all) { category in
            DailyDozenRowView(category: category, store: store)
        }
        .navigationTitle("Daily Dozen")
        .onAppear {
            store.markViewed()
        }
    }
}

#Preview {
    NavigationStack {
        DailyDozenView()
    }
}
