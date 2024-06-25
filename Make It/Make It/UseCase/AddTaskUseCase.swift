//
//  AddTaskUseCase.swift
//  Make It
//
//  Created by Premiersoft on 25/06/24.
//

import Foundation

final class AddTaskUseCase {

    @MainActor
    private var repository: TaskRepositoryProtocol = TaskRepository.shared
    private var presenter: TaskViewModelPresenter
    
    
    init(presenter: TaskViewModelPresenter) {
        self.presenter = presenter
    }
}

extension AddTaskUseCase: TaskUseCase {
    @MainActor
    func execute(_ data: TaskModel) {
        repository.addTask(task: data)
        presenter.didAddTask(data)
    }
}

