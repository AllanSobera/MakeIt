//
//  AddTaskUseCase.swift
//  Make It
//
//  Created by Allan Soberanski on 25/06/24.
//

import Foundation

final class AddTaskUseCase {

    @MainActor
    private var repository: TaskRepositoryProtocol = TaskRepository.shared
    private var presenter: AddTaskViewModelPresenter
    
    
    init(presenter: AddTaskViewModelPresenter) {
        self.presenter = presenter
    }
}

extension AddTaskUseCase: TaskUseCase {
    @MainActor
    func execute(_ data: TaskModel) {
        repository.addTask(task: data)
        presenter.didAddTask()
    }
}

