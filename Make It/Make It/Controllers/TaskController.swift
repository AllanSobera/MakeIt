//
//  TaskController.swift
//  Make It
//
//  Created by Premiersoft on 25/06/24.
//

import Foundation

enum TaskControllerAction {
    case add(TaskViewModelPresenter, TaskModel)
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

final class UseCaseCreator {
    struct Output {
        let useCase: TaskUseCase
        let data: TaskModel?
        
        init(useCase: TaskUseCase, data: TaskModel? = nil) {
            self.useCase = useCase
            self.data = data
        }
    }
    
    @MainActor
    static func create(action: TaskControllerAction) -> Output {
        switch action {
        case .add(let presenter, let data):
            return Output(useCase: AddTaskUseCase(presenter: presenter), data: data)
        case .delete(let presenter, let data):
            return Output(useCase: DeleteTaskUseCase(presenter: presenter), data: data)
        case .fetch(let presenter):
            return Output(useCase: FetchTaskUseCase(presenter: presenter))
        }
    }
}
