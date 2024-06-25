//
//  DeleteTaskUseCase.swift
//  Make It
//
//  Created by Premiersoft on 25/06/24.
//

import Foundation

final class DeleteTaskUseCase {
    
    @MainActor
    private var repository: TaskRepositoryProtocol = TaskRepository.shared
    private var presenter: TaskViewModelPresenter
    
    init(presenter: TaskViewModelPresenter) {
        self.presenter = presenter
    }
}

extension DeleteTaskUseCase: TaskUseCase {
    @MainActor
    func execute(_ data: TaskModel) {
        repository.deleteTask(task: data)
        presenter.didDeleteTask(data)
    }
}

