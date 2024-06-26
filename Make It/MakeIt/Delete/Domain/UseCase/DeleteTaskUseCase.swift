//
//  DeleteTaskUseCase.swift
//  Make It
//
//  Created by Allan Soberanski on 25/06/24.
//

import Foundation

final class DeleteTaskUseCase {
    
    @MainActor
    private var repository: TaskRepositoryProtocol = TaskRepository.shared
    private var presenter: DeleteTaskViewModelPresenter
    
    init(presenter: DeleteTaskViewModelPresenter) {
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

