//
//  TaskUseCase.swift
//  Make It
//
//  Created by Premiersoft on 25/06/24.
//

import Foundation

protocol TaskUseCase {
    func execute(_ data: TaskModel)
    func execute()
}

extension TaskUseCase {
    func execute(_ data: TaskModel) {}
    func execute() {}
}
