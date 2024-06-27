//
//  AddTaskViewModel.swift
//  MakeIt
//
//  Created by Allan Soberanski on 27/06/24.
//

import Foundation

@Observable
class AddTaskViewData {
    var title: String = ""
    var description: String = ""
    var startDate: Date = Date.now
    var hasBeenAdded: Bool = false
}

@Observable
final class AddTaskViewModel {
    var data: AddTaskViewData = AddTaskViewData()
}

extension AddTaskViewModel: AddTaskViewModelPresenter {
    func didAddTask() {
        data.hasBeenAdded = true
    }
}

extension AddTaskViewModel {
    func getTaskToAdd() -> TaskModel {
        return .init(
            id: UUID(),
            title: data.title,
            descriptionTitle: data.description,
            startTime: data.startDate
        )
    }
}
