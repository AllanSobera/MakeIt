//
//  TaskViewModel.swift
//  Make It
//
//  Created by Allan Soberanski on 24/06/24.
//

import SwiftUI
import SwiftData

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
        state.tasks = data.sorted { $0.startTime < $1.startTime }
    }
    
    func didDeleteTask(_ data: TaskModel) {
        state.tasks.removeAll { $0 == data }
    }
}
