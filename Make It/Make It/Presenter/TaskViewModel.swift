//
//  TaskViewModel.swift
//  Make It
//
//  Created by Premiersoft on 24/06/24.
//

import SwiftUI
import SwiftData

protocol TaskViewModelPresenter {
    func didFetchTasks(_ data: [TaskModel])
    func didAddTask(_ data: TaskModel)
    func didDeleteTask(_ data: TaskModel)
}

@Observable
class ViewData {
    var tasks: [TaskModel] = []
}

@Observable
final class TaskViewModel {
    var state: ViewData = ViewData()
}

extension TaskViewModel: TaskViewModelPresenter {
    func didFetchTasks(_ data: [TaskModel]) {
        state.tasks = data
    }
    
    func didAddTask(_ data: TaskModel) {
        state.tasks.append(data)
    }
    
    func didDeleteTask(_ data: TaskModel) {
        state.tasks.removeAll { $0 == data }
    }
}
