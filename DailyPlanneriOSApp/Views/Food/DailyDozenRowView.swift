//
//  DailyDozenRowView.swift
//  Notebook for Josh
//

import SwiftUI

struct DailyDozenRowView: View {
    let category: DailyDozenCategory
    @Bindable var store: DailyDozenStore

    var body: some View {
        HStack {
            Text(category.name)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 6) {
                ForEach(0..<category.servings, id: \.self) { index in
                    Button {
                        store.toggle(category: category, servingIndex: index)
                    } label: {
                        Image(systemName: store.isChecked(category: category, servingIndex: index)
                              ? "checkmark.square.fill"
                              : "square")
                            .imageScale(.large)
                            .foregroundStyle(store.isChecked(category: category, servingIndex: index)
                                             ? .green
                                             : .secondary)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(.vertical, 2)
    }
}
