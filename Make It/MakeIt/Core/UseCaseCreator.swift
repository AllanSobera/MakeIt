//
//  UseCaseCreator.swift
//  MakeIt
//
//  Created by Allan Soberanski on 26/06/24.
//

import Foundation

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
