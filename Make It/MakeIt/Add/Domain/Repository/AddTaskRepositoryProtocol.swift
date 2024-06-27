//
//  AddTaskRepositoryProtocol.swift
//  MakeIt
//
//  Created by Premiersoft on 27/06/24.
//

import Foundation

protocol AddTaskRepositoryProtocol: TaskRepositoryProtocol {}

extension AddTaskRepositoryProtocol {
    private func deleteTask(task: TaskModel) { }
    private func fetchTasks() -> [TaskModel] { [] }
}
