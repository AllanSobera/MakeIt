//
//  FetchTaskUseCase.swift
//  Make It
//
//  Created by Allan Soberanski on 25/06/24.
//

import Foundation

@MainActor
final class FetchTaskUseCase {
    
    private let repository: TaskRepositoryProtocol = TaskRepository.shared
    private let presenter: TaskViewModelPresenter
    
    init(presenter: TaskViewModelPresenter) {
        self.presenter = presenter
    }
}

extension FetchTaskUseCase: TaskUseCase {
    func execute() {
        let result = repository.fetchTasks()
        presenter.didFetchTasks(result)
    }
}

