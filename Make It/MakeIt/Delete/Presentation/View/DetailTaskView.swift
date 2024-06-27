//
//  DetailTaskView.swift
//  MakeIt
//
//  Created by Allan Soberanski on 26/06/24.
//

import SwiftUI

struct DetailTaskView: View {
    @Environment(\.dismiss) var dismiss
    @State private var viewModel: DeleteTaskViewModel = .init()
    private var controller: TaskController = .init()
    private var task: TaskModel
    
    init(task: TaskModel) {
        self.task = task
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 8) {
                titleAndText(title: "Título", text: task.title)
                titleAndText(title: "Descrição", text: task.descriptionTitle)
                titleAndText(
                    title: "Data de ínicio",
                    text: "\(task.startTime.formattedDate)"
                )
                titleAndText(title: "Horário de ínicio", text: "\(task.startTime.formattedHour)")
                Rectangle()
                    .foregroundStyle(task.isOverdue ? Color.red : Color.green)
                    .frame(width: 50, height: 50)
                Spacer()
            }
            .padding(20)
        }
        .toolbar(content: {
            ToolbarItem {
                Button(action: {
                    Task {
                        await controller.on(.delete(viewModel, task))
                    }
                }, label: {
                    Label("Remove Item", systemImage: "trash")
                })
            }
        })
        .toolbarTitleDisplayMode(.inline)
        .navigationTitle("Tarefa")
        .onChange(of: viewModel.state.didDeleteItem) {
            dismiss()
        }
    }
    
    private func titleAndText(title: String, text: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(.title3, weight: .bold))
            Text(text)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
