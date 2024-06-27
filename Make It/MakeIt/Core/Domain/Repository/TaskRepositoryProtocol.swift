//
//  TaskRepositoryProtocol.swift
//  MakeIt
//
//  Created by Allan Soberanski on 27/06/24.
//

import Foundation

protocol TaskRepositoryProtocol {
    func addTask(task: TaskModel)
    func deleteTask(task: TaskModel)
    func fetchTasks() -> [TaskModel]
}
