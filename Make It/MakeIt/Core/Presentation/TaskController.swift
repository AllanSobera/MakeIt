//
//  TaskController.swift
//  Make It
//
//  Created by Allan Soberanski on 25/06/24.
//

import Foundation

enum TaskControllerAction {
    case add(AddTaskViewModelPresenter, TaskModel)
    case delete(TaskViewModelPresenter, TaskModel)
    case fetch(TaskViewModelPresenter)
}

protocol TaskControllerProtocol {
    func on(_ action: TaskControllerAction) async
}

final class TaskController {    }

extension TaskController: TaskControllerProtocol {
    func on(_ action: TaskControllerAction) async {
        let output = await UseCaseCreator.create(action: action)
        guard let data = output.data else {
            output.useCase.execute()
            return
        }
        output.useCase.execute(data)
    }
}
