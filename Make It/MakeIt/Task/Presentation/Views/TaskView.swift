//
//  ContentView.swift
//  Make It
//
//  Created by Allan Soberanski on 24/06/24.
//

import SwiftUI
import SwiftData

struct TaskView: View {
    @State private var viewModel = TaskViewModel()
    private let controller = TaskController()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.state.tasks) { item in
                    NavigationLink {
                        DetailTaskView(task: item)
                    } label: {
                        VStack(alignment: .leading, content: {
                            Text(item.title)
                            Text("\(item.startTime.formattedDate) - \(item.startTime.formattedHourMinute)")
                        })
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        AddTaskView()
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Tarefas")
            .toolbarTitleDisplayMode(.inlineLarge)
        }
        .onAppear {
            Task {
                await controller.on(.fetch(viewModel))
            }
        }
    }
}

#Preview {
    TaskView()
}
