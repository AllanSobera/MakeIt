//
//  ContentView.swift
//  Make It
//
//  Created by Premiersoft on 24/06/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var viewModel = TaskViewModel()
    private let controller = TaskController()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.state.tasks) { item in
                    NavigationLink {
                        Text("Item at \(item.title)")
                    } label: {
                        VStack(alignment: .leading, content: {
                            Text("Coisa para fazer")
                            Text("\(item.startTime, format: Date.FormatStyle(date: .numeric, time: .standard))")
                        })
                    }
                }
                .onDelete { data in
                    Task {
                        for index in data {
                            await controller.on(.delete(viewModel, viewModel.state.tasks[index]))
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
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
    
    func addItem() {
        Task {
            await controller.on(
                .add(
                    viewModel,
                    .init(
                        id: UUID(),
                        title: "Teste",
                        descriptionTitle: "Estou testando",
                        startTime: Date()
                    )
                )
            )
        }
    }
}

#Preview {
    ContentView()
}
