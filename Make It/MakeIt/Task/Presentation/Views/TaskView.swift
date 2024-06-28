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
        List {
            ForEach(viewModel.state.tasks) { item in
                Button {
                    Navigation.shared.push(DetailTaskView(task: item))
                } label: {
                    VStack(alignment: .leading, content: {
                        Text(item.title)
                            .foregroundStyle(Color.black)
                        Text("\(item.startTime, format: Date.FormatStyle(date: .numeric, time: .standard))")
                            .foregroundStyle(Color.black)
                    })
                }
            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    Navigation.shared.push(AddTaskView())
                } label: {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
        .navigationTitle("Tarefas")
        .navigationBarTitleDisplayMode(.large)
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

struct Teste: View {
    var body: some View {
        VStack {
            Text("Olá")
        }
    }
}
